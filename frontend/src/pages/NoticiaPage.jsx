// src/pages/NoticiasPage.jsx

import React, { useState, useEffect } from 'react';

const NoticiasPage = () => {
  const [noticias, setNoticias] = useState([]);

  useEffect(() => {
    const fetchNoticias = async () => {
      try {
        const response = await fetch('http://localhost:3000/noticias'); // Substitua pela URL correta da sua API
        if (!response.ok) {
          throw new Error('Falha ao buscar notícias');
        }
        const data = await response.json();
        setNoticias(data);
      } catch (error) {
        console.error('Erro:', error);
      }
    };

    fetchNoticias();
  }, []);

  if (noticias.length === 0) {
    return <div>Carregando notícias...</div>;
  }

  return (
    <div className="container mx-auto mt-10">
      <div className="max-w-4xl mx-auto">
        <h2 className="text-3xl font-bold text-gray-800 mb-4">Notícias</h2>
        <div className="grid gap-6">
          {noticias.map((noticia) => (
            <div key={noticia.id} className="bg-gray-100 rounded-xl p-6 shadow-md">
              <h3 className="text-xl font-bold mb-2">{noticia.titulo}</h3>
              <p className="text-gray-700">{noticia.texto}</p>
              <p className="text-gray-600 mt-2"><strong>Jogador ID:</strong> {noticia.jogador_id}</p>
              <p className="text-gray-600"><strong>Time ID:</strong> {noticia.time_id}</p>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};

export default NoticiasPage;
