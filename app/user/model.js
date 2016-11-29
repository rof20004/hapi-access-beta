'use strict';

var Mongoose = require('../../db').Mongoose;

var userSchema = new Mongoose.Schema({
  nome: {
    type: String,
    required: true
  },
  scope: {
    type: String,
    enum: ['admin', 'customer', 'initial'],
    required: true
  }
});

module.exports = Mongoose.model('User', userSchema, 'user');
