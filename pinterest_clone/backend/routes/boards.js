const express = require('express');
const router = express.Router();
const auth = require('../middleware/auth');
const boardController = require('../controllers/boardController');

// Get all boards
router.get('/', boardController.getAllBoards);

// Get a single board by ID
router.get('/:id', boardController.getBoardById);

// Create a new board
router.post('/', auth, boardController.createBoard);

// Update a board
router.put('/:id', auth, boardController.updateBoard);

// Delete a board
router.delete('/:id', auth, boardController.deleteBoard);

module.exports = router;