<user_add>

  <div class="alert alert-success" role="alert" show="{messageSuccess}">
    <strong>Ok:
    </strong>{messageSuccess}
  </div>

  <div class="alert alert-danger" role="alert" show="{messageError}">
    <strong>Erro:
    </strong>{messageError}
  </div>

  <form onsubmit="{userAdd}">
    <div class="card">
      <div class="card-block">

        <!--Header-->
        <div class="text-xs-center">
          <h3>Guia Nacional de Cinemas</h3>
          <hr class="mt-2 mb-2">
        </div>

        <div class="row">
          <div class="col-md-12">
            <div class="md-form form-group">
              <label for="nomeFantasia">Nome Fantasia
                <span>*</span>
              </label>
              <input class="form-control" type="text" name="nomeFantasia" id="nomeFantasia">
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="md-form form-group">
              <label for="cnpj">CNPJ
                <span>*</span>
              </label>
              <input class="form-control" type="text" name="cnpj" id="cnpj">
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6">
            <div class="md-form form-group">
              <label for="email">E-mail
                <span>*</span>
              </label>
              <input class="form-control" type="text" name="email" id="email">
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6">
            <div class="md-form form-group">
              <label for="password">Senha
                <span>*</span>
              </label>
              <input class="form-control" type="password" name="password" id="password">
            </div>
          </div>
          <div class="col-md-6">
            <div class="md-form form-group">
              <label for="passwordRepeat">Confirmar senha
                <span>*</span>
              </label>
              <input class="form-control" type="password" name="passwordRepeat" id="passwordRepeat">
            </div>
          </div>
        </div>
        <div class="text-xs-center">
          <button class="btn btn-success">Salvar</button>
          <a href="/security/login" class="btn btn-info">Voltar</a>
        </div>
      </div>
    </div>
  </form>

  <p>
    (*) Campos obrigatórios
  </p>

  <style scoped>
    :scope {
      width: 55%;
      margin: 0 auto;
    }

    :scope h3 {
      text-align: center;
    }

  </style>

  <script>
    var self = this;
    self.messageSuccess = null;
    self.messageError = null;

    userAdd(e) {
      $.ajax({
        url: '/user/add',
        method: 'POST',
        data: {
          nomeFantasia: self.nomeFantasia.value,
          cnpj: self.cnpj.value,
          email: self.email.value,
          password: self.password.value,
          passwordRepeat: self.passwordRepeat.value
        },
        dataType: 'json',
        success: function (data, status, xhr) {
          self.messageError = null;
          self.messageSuccess = data.messageSuccess;
          clearFormFields();
          self.update();
        },
        error: function (data, status, xhr) {
          self.messageSuccess = null;
          self.messageError = data.responseJSON.messageError;
          self.update();
        }
      });
    }

    function clearFormFields() {
      self.nomeFantasia.value = '';
      self.cnpj.value = '';
      self.email.value = '';
      self.password.value = '';
      self.passwordRepeat.value = '';
    }
  </script>

</user_add>
