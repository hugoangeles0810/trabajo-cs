<?php
  require_once 'config.php';
?>

<?php
  include BASEPATH . '/partials/header.php';
?>

<!-- Main Content -->
<section class="container-fluid main-content">
  <div class="row">
    <div class="col-md-3 col-xs-12">
      <?php
        include BASEPATH . '/partials/formulario2.php';
      ?>
    </div>
    <div ng-app="app" class="col-md-6 col-xs-12">
      <h3>Tus resultados</h3>
      <hr>
      <div class="results" ng-controller="vuelosCtrl">
        <div class="loader" ng-if="loader">
          <img src="assets/img/pacman.gif" alt="Cargando..."> 
          <p>Cargando ...</p>
        </div>

        <div class="norecords" ng-if="!loader && !vuelos.length">
          <p>No se encontraron vuelos</p>
        </div>
        

        <div class="vuelos" ng-if="!loader">
          <div class="row vuelo" ng-repeat="vuelo in vuelos">
            <div class="col-xs-8">
              <div class="row item-row bg-gray">
                <div class="col-xs-6">
                  <span class="fecha">{{ vuelo.fecha | fecha }}</span>
                </div>
                <div class="col-xs-3">
                  <span class="lugar-short">{{ vuelo.origen | lugar }}</span>
                  <span class="lugar-large">{{ vuelo.origen }}</span>
                </div>
                <div class="col-xs-3">
                  <span class="lugar-short">{{ vuelo.destino | lugar }}</span>
                  <span class="lugar-large">{{ vuelo.destino }}</span>
                </div>
              </div>
              <div class="row item-row">
                <div class="col-xs-6">
                  <span class="aerolinea">Latam Airlines</span>
                </div>
                <div class="col-xs-4">
                  <span class="horario">{{ vuelo.fecha | hora }}</span>
                </div>
              </div>
            </div>
            <div class="col-xs-4 comprar-div">
              <p class="text-center"><span class="currency">US$</span> 165</p>
              <button class="btn btn-block btn-comprar">Comprar</button>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <!-- Banners publicitarios -->
        <div class="col-xs-12">
          <img src="assets/img/cuzco.png" class="img-responsive banner" alt="Cuzco">
        </div>

        <div class="col-xs-12 mt-14">
          <img src="assets/img/outlet.png" class="img-responsive banner" alt="Outlet">
        </div>
        <!-- Fin: Banners publicitarios -->
    </div>
  </div>
</section>
<?php
  include BASEPATH . '/partials/footer.php';
?>