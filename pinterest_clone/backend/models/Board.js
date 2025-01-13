const mongoose = require('mongoose');

const BoardSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
  },
  description: {
    type: String,
  },
  pins: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'Pin',
    },
  ],
});

module.exports = mongoose.model('Board', BoardSchema);