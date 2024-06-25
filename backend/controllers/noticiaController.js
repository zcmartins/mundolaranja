// backend/controllers/noticiaController.js

const db = require('../config/db');

// Função para obter todas as notícias
const obterTodasNoticias = async (req, res) => {
  try {
    const query = 'SELECT * FROM noticias';
    const result = await db.query(query);
    res.status(200).json(result.rows);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// Função para obter uma notícia por ID
const obterNoticiaPorId = async (req, res) => {
  const { id } = req.params;
  try {
    const query = 'SELECT * FROM noticias WHERE id = $1';
    const result = await db.query(query, [id]);
    if (result.rows.length === 0) {
      res.status(404).json({ message: 'Notícia não encontrada' });
    } else {
      res.status(200).json(result.rows[0]);
    }
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

module.exports = {
  obterTodasNoticias,
  obterNoticiaPorId,
  // Adicione outras funções conforme necessário (ex: criar, atualizar, excluir notícias)
};
