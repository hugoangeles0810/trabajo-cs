<?php
  require_once 'config.php';
?>

<?php
  include BASEPATH . '/partials/header.php';
?>

    <!-- Main Content -->
    <section class="container-fluid main-content">
      <div class="row">

        <!-- Formulario de vuelos -->
        <div class="col-md-6 col-xs-12">
          <?php
            include BASEPATH . '/partials/formulario1.php';
          ?>
        </div>
        <!-- Fin: Formulario de vuelos -->
        
        <!-- Banners publicitarios -->
        <div class="col-md-3">
          <img src="assets/img/cuzco.png" class="img-responsive banner" alt="Cuzco">
        </div>
        <div class="col-md-3">
          <img src="assets/img/outlet.png" class="img-responsive banner" alt="Outlet">
        </div>
        <!-- Fin: Banners publicitarios -->
      </div>

      <!-- Vuelos recomendados -->
      <?php
        include BASEPATH . '/partials/recomendados.php';
      ?>
      <!-- Fin: Vuelos recomendados -->
    </section>
    <!-- Fin: Main Content -->

<?php
  include BASEPATH . '/partials/footer.php';
?>