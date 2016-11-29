<main>

  <div id="header-tag"></div>

  <div id="mounted"></div>

  <script>
    var self = this;
    riot.mixin('mainOpts', opts);

    riot.route.start(true);
    riot.route.base('/');

    riot.route('/', function() {
      opts = riot.mixin('mainOpts');
      var r = riot.mount('#mounted', 'index', opts);
      riot.mount('#header-tag', 'header');
    });

    riot.route('/security/login', function() {
      opts = riot.mixin('mainOpts');
      var r = riot.mount('#mounted', 'login', opts);
    });

    riot.route('/user', function() {
      opts = riot.mixin('mainOpts');
      var r = riot.mount('#mounted', 'user_add', opts);
    });

    riot.route('/filme', function() {
      opts = riot.mixin('mainOpts');
      var r = riot.mount('#mounted', 'filme', opts);
    });

    self.on('updated', function() {
      riot.mixin('mainOpts', opts);
      riot.mount('#mounted', opts.tag, opts);
      riot.route(opts.path);

      // Mount Navbar and Footer
      if (opts.isAuthenticated) {
        riot.mount('#header-tag', 'header');
      }
    });
  </script>

</main>
