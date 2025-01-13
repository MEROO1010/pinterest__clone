const express = require('express');
const router = express.Router();
const auth = require('../middleware/auth');
const userController = require('../controllers/userController');

// Register a new user
router.post('/register', userController.registerUser);

// Login user
router.post('/login', userController.loginUser);

// Get user profile
router.get('/me', auth, userController.getUserProfile);

// Update user profile
router.put('/me', auth, userController.updateUserProfile);

module.exports = router;