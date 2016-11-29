'use strict';

var Mongoose = require('mongoose');
var Config = require('../config');

Mongoose.Promise = global.Promise;

// Mongo Local
Mongoose.connect('mongodb://' + Config.mongo.url + '/' + Config.mongo.database);

// Mongo Heroku
//Mongoose.connect('mongodb://' + Config.mongoHeroku.username + ':' + Config.mongoHeroku.password + '@' + Config.mongoHeroku.url + '/' + Config.mongoHeroku.database);

var db = Mongoose.connection;

// Log Local
db.on('error', console.error.bind(console, 'connection error'));
db.once('open', function callback() {
	console.log('Database started: ' + Config.mongo.url + "/" + Config.mongo.database);
});

// Log Heroku
// db.on('error', console.error.bind(console, 'connection error'));
// db.once('open', function callback() {
// 	console.log('Database started: ' + Config.mongoHeroku.url + "/" + Config.mongoHeroku.database);
// });

exports.Mongoose = Mongoose;
exports.db = db;
