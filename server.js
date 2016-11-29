'use strict';

const Hapi = require('hapi');
const Config = require('./config');
const Routes = require('./routes');
const User = require('./app/user');

const server = new Hapi.Server();
server.connection({
  host: Config.server.host,
  port: Config.server.port,
  routes: {
    cors: true
  }
});

server.register([], (err) => {
  if (err) {
    throw err;
  }

  server.route(Routes.endpoints);

  server.ext('onPreHandler', function(request, reply) {
    if (request.path === '/user/comacesso') {
      User.Model.find({}, (err, users) => {
        if (err) {
          return reply.redirect('/user/semacesso');
        }

        if (users[0]['scope'] === 'admin') {
          reply.continue();
        } else {
          return reply.redirect('/user/semacesso');
        }
      });
    } else {
      reply.continue();
    }

  });

  server.start((err) => {
    console.log('Server started:', server.info.uri);
  });
});
