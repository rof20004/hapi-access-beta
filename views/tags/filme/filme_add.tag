<filme_add>

  <div class="alert alert-success" role="alert" show="{messageSuccess}">
    <strong>Ok: </strong>{messageSuccess}
  </div>

  <div class="alert alert-danger" role="alert" show="{messageError}">
    <strong>Erro: </strong>{messageError}
  </div>

  <div class="card">
    <div class="card-block">

      <div class="text-xs-center">
        <h3>Cadastrar Filme</h3>
        <hr class="mt-2 mb-2">
      </div>

      <form onsubmit="{add}">
        <div class="row">
          <div class="col-md-4">
            <div class="md-form form-group">
              <label for="nome">Nome<span>*</span></label>
              <input class="form-control" type="text" name="nome" id="nome">
            </div>
          </div>
          <div class="col-md-2">
            <div class="md-form form-group">
              <label for="classificacao">Classificação</label>
              <input class="form-control" type="number" name="classificacao" id="classificacao">
            </div>
          </div>
          <div class="col-md-2">
            <div class="md-form form-group">
              <label for="genero">Gênero<span>*</span></label>
              <input class="form-control" type="text" name="genero" id="genero">
            </div>
          </div>
          <div class="col-md-1">
            <div class="md-form form-group">
              <label for="ano">Ano<span>*</span></label>
              <input class="form-control" type="number" name="ano" id="ano">
            </div>
          </div>
          <div class="col-md-3">
            <div class="md-form form-group">
              <label for="cidade">Cidade<span>*</span></label>
              <input class="form-control" type="text" name="cidade" id="cidade">
              <p class="text-sm-left text-primary">Escolha uma cidade da lista</p>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-1">
            <div class="md-form form-group">
              <label for="sala">Sala<span>*</span></label>
              <input class="form-control" type="number" name="sala" id="sala">
            </div>
          </div>
          <div class="col-md-5">
            <div class="md-form form-group">
              <label for="lugar">Lugar<span>*</span></label>
              <input class="form-control" type="text" name="lugar" id="lugar">
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="md-form form-group">
              <label for="sinopse">Sinopse</label>
              <textarea type="text" id="sinopse" name="sinopse" class="md-textarea"></textarea>
            </div>
          </div>
        </div>
        <div class="md-form form-group">
          <button class="btn btn-success">Salvar</button>
        </div>
      </form>

    </div>
  </div>

  <p>
    (*) Campos obrigatórios
  </p>

  <style scoped>
    :scope button {
      margin-left: -1px !important;
    }
  </style>

  <script>
    var self = this;

    self.messageSuccess = null;
    self.messageError = null;

    add(e) {
      $.ajax({
        url: '/filme/add',
        method: 'POST',
        data: {
          nome: self.descricao.value,
          classificacao: self.classificacao.value,
          genero: self.genero.value,
          ano: self.ano.value,
          cidade: {nome: self.cidade.value},
          sala: self.sala.value,
          lugar: self.lugar.value,
          sinopse: self.sinopse.value,
          horarios_inicio: [self.horarios_inicio],
          horarios_fim: [self.horarios_fim]
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
          self.messageError = 'Ocorreu um erro no servidor';
          self.update();
        }
      });
    }

    function clearFormFields() {
      self.descricao.value = '';
      self.classificacao.value = '';
      self.genero.value = '';
      self.ano.value = '';
      self.cidade.value = '';
      self.sala.value = '';
      self.lugar.value = '';
      self.sinopse.value = '';
      self.horarios_inicio = null;
      self.horarios_fim = null;
    }
  </script>

</filme_add>
