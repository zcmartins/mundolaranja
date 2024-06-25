const express = require('express');
const router = express.Router();
const db = require('../config/db');

// Rota para buscar todos os jogadores
router.get('/', async (req, res) => {
    try {
        const query = 'SELECT * FROM jogadores';
        const result = await db.query(query);
        res.status(200).json(result.rows);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// Rota para buscar um jogador pelo ID
router.get('/:id', async (req, res) => {
    try {
        const { id } = req.params;
        const query = 'SELECT * FROM jogadores WHERE id = $1';
        const result = await db.query(query, [id]);

        if (result.rows.length === 0) {
            return res.status(404).json({ error: 'Jogador não encontrado' });
        }

        res.status(200).json(result.rows[0]);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

module.exports = router;
