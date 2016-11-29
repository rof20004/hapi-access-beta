<header>
  <nav class="navbar navbar-light navbar-fixed-top bg-faded">
    <button class="navbar-toggler hidden-lg-up" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"></button>
    <div class="collapse navbar-toggleable-md" id="navbarResponsive">
      <a class="navbar-brand" href="#">GNC</a>
      <ul class="nav navbar-nav">
        <li class="nav-item active">
          <a class="nav-link" href="/">Home
            <span class="sr-only">(current)</span>
          </a>
        </li>
        <li class="nav-item btn-group">
            <a class="nav-link dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Filme</a>
            <div class="dropdown-menu" aria-labelledby="dropdownMenu1">
              <a href="/filme" class="dropdown-item">Cadastro de Filme</a>
              <a class="dropdown-item">Lista de Filmes</a>
            </div>
        </li>
      </ul>
      <ul class="nav navbar-nav float-md-right">
        <li class="nav-item">
          <button_logout></button_logout>
        </li>
      </ul>
    </div>
  </nav>

  <style scoped>
    :scope .navbar {
      background-color: #64B5F6;
    }
  </style>

  <script>
    var self = this;

  </script>
</header>
