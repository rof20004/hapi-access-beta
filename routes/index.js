'use strict';

const User 		 = require('../app/user');

exports.endpoints = [

	// Views
	{method: 'GET',    	path: '/user/semacesso',											config: User.View.semAcesso},
	{method: 'GET',    	path: '/user/comacesso',											config: User.View.comAcesso},
	{method: 'GET',    	path: '/user/erroacesso',											config: User.View.erroAcesso}

];
