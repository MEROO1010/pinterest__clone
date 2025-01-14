const express = require('express');
const connectDB = require('./config/db');
const cors = require('cors');
require('dotenv').config(); // Load environment variables from .env file

const app = express();

// Connect Database
connectDB();

// Init Middleware
app.use(express.json({ extended: false }));
app.use(cors());

// Define Routes
app.use('/api/boards', require('./routes/boards'));
app.use('/api/pins', require('./routes/pins'));
app.use('/api/users', require('./routes/users'));

const PORT = process.env.PORT || 5000;

app.listen(PORT, () => console.log(`Server started on port ${PORT}`));