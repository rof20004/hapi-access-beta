<login>

  <div id="alertErrorLogin" class="alert alert-danger" role="alert" show="{messageError}">
    <strong>Erro:
    </strong>{messageError}
  </div>

  <form onsubmit="{doLogin}">
    <div class="card">
      <div class="card-block">

        <!--Header-->
        <div class="text-xs-center">
          <h3>
            <i class="fa fa-lock"></i>
            Login</h3>
          <hr class="mt-2 mb-2">
        </div>

        <!--Body-->
        <div class="md-form form-group">
          <i class="fa fa-envelope prefix"></i>
          <label for="email">E-mail</label>
          <input type="text" id="email" name="email" class="form-control">
        </div>

        <div class="md-form form-group">
          <i class="fa fa-lock prefix"></i>
          <label for="password">Password</label>
          <input type="password" id="password" name="password" class="form-control">
        </div>

        <div class="text-xs-center">
          <button id="alert-target" class="btn btn-primary">Entrar</button>
        </div>
      </div>

      <!--Footer-->
      <div class="modal-footer">
        <div class="options">
          Não registrado? <a href="/user">Cadastrar</a>
        </div>
      </div>

    </div>
  </form>

  <style scoped>
    :scope {
      width: 55%;
      margin: 0 auto;
    }
  </style>

  <script>
    var self = this;
    self.messageError = null;

    doLogin(e) {
      $.ajax({
        url: '/login',
        method: 'POST',
        data: {
          email: self.email.value,
          password: self.password.value
        },
        dataType: 'json',
        success: function (data, status, xhr) {
          riot.mixin('mainOpts', data);
          riot.route('/');
        },
        error: function (data, status, xhr) {
          if (!data.responseJSON.message) {
            self.messageError = 'Ocorreu um erro no servidor';
          } else {
            self.messageError = data.responseJSON.message;
          }
          self.update();
        }
      });
    }
  </script>

</login>
