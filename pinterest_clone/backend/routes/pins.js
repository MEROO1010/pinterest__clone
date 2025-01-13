const express = require('express');
const router = express.Router();
const auth = require('../middleware/auth');
const pinController = require('../controllers/pinController');

// Get all pins
router.get('/', pinController.getAllPins);

// Get a single pin by ID
router.get('/:id', pinController.getPinById);

// Create a new pin
router.post('/', auth, pinController.createPin);

// Update a pin
router.put('/:id', auth, pinController.updatePin);

// Delete a pin
router.delete('/:id', auth, pinController.deletePin);

module.exports = router;