import React from 'react';
import ReactDOM from 'react-dom/client';
import {BrowserRouter as Router,Routes,Route} from "react-router-dom";
import './index.css'
import Jogadores from "./pages/Jogadores"
import Times from "./pages/Times"
import Noticias from "./pages/Noticias"
import JogPage from './pages/JogPage';
import TimePage from './pages/TimePage';
import ChatPage from './pages/ChatPage';



ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <Router>
      <Routes>
        <Route path='/' element={<Noticias/>} />
        <Route path='/jogadores' element={<Jogadores/>} />
        <Route path='/times' element={<Times/>} />
        <Route path="/jogadores/:id" element={<JogPage/>} />
        <Route path="/times/:id" element={<TimePage />} />
        <Route path="/chat" element={<ChatPage />} />
      </Routes>
    </Router>
  </React.StrictMode>,
)
