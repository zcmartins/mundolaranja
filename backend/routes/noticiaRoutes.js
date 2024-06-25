// backend/routes/noticiaRoutes.js

const express = require('express');
const router = express.Router();
const noticiaController = require('../controllers/noticiaController');

// Rota para buscar todas as notícias
router.get('/', noticiaController.obterTodasNoticias);

// Rota para buscar uma notícia por ID
router.get('/:id', noticiaController.obterNoticiaPorId);

// Adicione outras rotas conforme necessário (ex: criar, atualizar, excluir notícias)

module.exports = router;
