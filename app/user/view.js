'use strict';

const Config = require('../../config');

exports.semAcesso = {
  handler: function(request, reply) {
    reply('Usuário acessou uma URL SEM acesso');
  }
};

exports.comAcesso = {
  handler: function(request, reply) {
    reply('Usuário acessou uma URL COM acesso');
  }
};

exports.erroAcesso = {
  handler: function(request, reply) {
    reply('Usuário acessou uma URL ERRADA');
  }
}
