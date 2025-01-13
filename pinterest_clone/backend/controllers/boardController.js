const Board = require('../models/Board');
const Pin = require('../models/Pin');

// Get all boards
exports.getAllBoards = async (req, res) => {
  try {
    const boards = await Board.find().populate('pins');
    res.status(200).json(boards);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

// Get a single board
exports.getBoardById = async (req, res) => {
  try {
    const board = await Board.findById(req.params.id).populate('pins');
    if (!board) {
      return res.status(404).json({ message: 'Board not found' });
    }
    res.status(200).json(board);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

// Create a new board
exports.createBoard = async (req, res) => {
  const { name, description } = req.body;
  const board = new Board({
    name,
    description,
    pins: [],
  });

  try {
    const newBoard = await board.save();
    res.status(201).json(newBoard);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
};

// Update a board
exports.updateBoard = async (req, res) => {
  const { name, description } = req.body;

  try {
    const board = await Board.findById(req.params.id);
    if (!board) {
      return res.status(404).json({ message: 'Board not found' });
    }

    board.name = name || board.name;
    board.description = description || board.description;

    const updatedBoard = await board.save();
    res.status(200).json(updatedBoard);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
};

// Delete a board
exports.deleteBoard = async (req, res) => {
  try {
    const board = await Board.findById(req.params.id);
    if (!board) {
      return res.status(404).json({ message: 'Board not found' });
    }

    await board.remove();
    res.status(200).json({ message: 'Board deleted' });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};