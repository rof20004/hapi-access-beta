<button_logout>
  <a href onclick="{doLogout}" class="nav-link" title="Logout">
    <i class="fa fa-sign-out fa-2x" aria-hidden="true"></i>
  </a>
  <script>
    var self = this;

    doLogout(e) {
      $.ajax({
        url: '/logout',
        method: 'POST',
        success: function (data, status, xhr) {
          // Unmount Navbar and Footer
          var header = riot.mount(document.getElementById('header-tag'));
          header[0].unmount(true);
          
          riot.route('/security/login');
        }
      });
    }
  </script>
</button_logout>
