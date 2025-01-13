const Pin = require('../models/Pin');
const Board = require('../models/Board');

// Get all pins
exports.getAllPins = async (req, res) => {
  try {
    const pins = await Pin.find().populate('user');
    res.status(200).json(pins);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

// Get a single pin
exports.getPinById = async (req, res) => {
  try {
    const pin = await Pin.findById(req.params.id).populate('user');
    if (!pin) {
      return res.status(404).json({ message: 'Pin not found' });
    }
    res.status(200).json(pin);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

// Create a new pin
exports.createPin = async (req, res) => {
  const { title, description, imageUrl, user, boardId } = req.body;
  const pin = new Pin({
    title,
    description,
    imageUrl,
    user,
  });

  try {
    const newPin = await pin.save();
    const board = await Board.findById(boardId);
    if (board) {
      board.pins.push(newPin._id);
      await board.save();
    }
    res.status(201).json(newPin);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
};

// Update a pin
exports.updatePin = async (req, res) => {
  const { title, description, imageUrl } = req.body;

  try {
    const pin = await Pin.findById(req.params.id);
    if (!pin) {
      return res.status(404).json({ message: 'Pin not found' });
    }

    pin.title = title || pin.title;
    pin.description = description || pin.description;
    pin.imageUrl = imageUrl || pin.imageUrl;

    const updatedPin = await pin.save();
    res.status(200).json(updatedPin);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
};

// Delete a pin
exports.deletePin = async (req, res) => {
  try {
    const pin = await Pin.findById(req.params.id);
    if (!pin) {
      return res.status(404).json({ message: 'Pin not found' });
    }

    await pin.remove();
    res.status(200).json({ message: 'Pin deleted' });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};