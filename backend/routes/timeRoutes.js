// backend/routes/timeRoutes.js

const express = require('express');
const router = express.Router();
const db = require('../config/db');

// Rota para buscar todos os times
router.get('/', async (req, res) => {
  try {
    const query = 'SELECT * FROM times';
    const result = await db.query(query);
    res.status(200).json(result.rows);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Rota para buscar um time por ID
router.get('/:id', async (req, res) => {
  const { id } = req.params;
  try {
    const query = 'SELECT * FROM times WHERE id = $1';
    const result = await db.query(query, [id]);
    if (result.rows.length === 0) {
      res.status(404).json({ message: 'Time não encontrado' });
    } else {
      res.status(200).json(result.rows[0]);
    }
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = router;
