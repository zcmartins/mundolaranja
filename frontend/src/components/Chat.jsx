// src/App.jsx
import React, { useState, useEffect, useRef } from 'react';
import io from 'socket.io-client';

const socket = io('http://localhost:3000');

function App() {
  const [username, setUsername] = useState('');
  const [loggedIn, setLoggedIn] = useState(false);
  const [message, setMessage] = useState('');
  const [messageId, setMessageId] = useState('');
  const [messages, setMessages] = useState([]);
  const [activeDropdown, setActiveDropdown] = useState(null);
  const messagesEndRef = useRef(null);

  useEffect(() => {
    if (loggedIn) {
      socket.emit('getMessages');

      socket.on('messages', (data) => {
        setMessages(data);
        scrollToBottom();
      });

      socket.on('messageEdited', (data) => {
        setMessages((prevMessages) =>
          prevMessages.map((msg) => (msg.id === data.id ? data : msg))
        );
      });

      socket.on('messageDeleted', (id) => {
        setMessages((prevMessages) =>
          prevMessages.filter((msg) => msg.id !== id)
        );
      });

      socket.on('messageSent', (message) => {
        setMessages((prevMessages) => [...prevMessages, message]);
        scrollToBottom();
        setActiveDropdown(null); // Fechar dropdown ao enviar nova mensagem
      });

      return () => {
        socket.off('messages');
        socket.off('messageEdited');
        socket.off('messageDeleted');
        socket.off('messageSent');
      };
    }
  }, [loggedIn]);

  const handleLogin = () => {
    if (username) {
      setLoggedIn(true);
    }
  };

  const handleSendMessage = (e) => {
    e.preventDefault();
    if (message) {
      if (messageId) {
        socket.emit('editMessage', { id: messageId, author: username, message });
        setMessageId('');
        setMessage('');
      } else {
        socket.emit('sendMessage', { author: username, message, timestamp: new Date() });
        setMessage('');
      }
    }
  };

  const handleEditMessage = (id, text) => {
    setMessage(text);
    setMessageId(id);
    setActiveDropdown(id);
  };

  const handleDeleteMessage = (id) => {
    socket.emit('deleteMessage', { id, author: username });
    setActiveDropdown(null);
  };

  const scrollToBottom = () => {
    messagesEndRef.current?.scrollIntoView({ behavior: 'smooth' });
  };

  useEffect(() => {
    scrollToBottom(); // Scroll para a última mensagem ao entrar no chat
  }, [messages]);

  return (
    <div className="flex items-center justify-center divtest bg-gray-900 text-white">
      {!loggedIn ? (
        <div id="login" className="flex flex-col items-center">
          <input
            type="text"
            id="username"
            placeholder="Digite seu usuário"
            value={username}
            onChange={(e) => setUsername(e.target.value)}
            className="w-full max-w-xs border border-gray-300 h-12 px-4 text-sm mt-2 rounded-md bg-gray-800 text-white"
          />
          <button
            id="loginBtn"
            onClick={handleLogin}
            className="w-full max-w-xs bg-blue-600 text-white h-12 px-4 text-sm mt-2 rounded-md"
          >
            Entrar
          </button>
        </div>
      ) : (
        <div className="w-full max-w-xl bg-gray-800 p-6 shadow-md rounded-lg">
          <div className="messages h-80 mb-4 border border-gray-600 p-4 overflow-y-scroll rounded-md bg-gray-700">
            {messages.map((msg) => (
              <div
                key={msg.id}
                className={`message ${msg.author === username ? 'my-message bg-gray-600' : 'other-message bg-gray-800'} p-2 mb-2 rounded-md flex flex-col`}
              >
                <div className="flex justify-between items-center">
                  <strong>{msg.author}</strong>
                  <span className="text-xs text-gray-400">
                    {new Date(msg.timestamp).toLocaleString()}
                  </span>
                </div>
                <div>{msg.message}</div>
                {msg.author === username && (
                  <div className="flex justify-end mt-2">
                    <div className="relative">
                      <button
                        className="dropbtn text-white"
                        onClick={() => setActiveDropdown(activeDropdown === msg.id ? null : msg.id)}
                      >
                        ⋮
                      </button>
                      {activeDropdown === msg.id && (
                        <div className="dropdown-content absolute bottom-0 right-0 bg-gray-600 shadow-lg rounded-md">
                          <button
                            className="edit-btn block w-full text-left px-4 py-2 text-white hover:bg-gray-500"
                            onClick={() => handleEditMessage(msg.id, msg.message)}
                          >
                            Editar
                          </button>
                          <button
                            className="delete-btn block w-full text-left px-4 py-2 text-white hover:bg-gray-500"
                            onClick={() => handleDeleteMessage(msg.id)}
                          >
                            Excluir
                          </button>
                        </div>
                      )}
                    </div>
                  </div>
                )}
              </div>
            ))}
            <div ref={messagesEndRef} />
          </div>
          <form onSubmit={handleSendMessage} className="w-full">
            <input
              type="text"
              name="message"
              placeholder="Digite sua mensagem"
              value={message}
              onChange={(e) => setMessage(e.target.value)}
              className="w-full border border-gray-600 h-12 px-4 text-sm mt-2 rounded-md bg-gray-700 text-white"
            />
            <button
              type="submit"
              className="w-full bg-blue-600 text-white h-12 px-4 text-sm mt-2 rounded-md"
            >
              Enviar
            </button>
          </form>
        </div>
      )}
    </div>
  );
}

export default App;
