<div class="main-form">
  <form action="vuelos.php" method="GET">
    <h3>Vuelos</h3>
    <div class="row-fluid clearfix mt-14">
      <div class="col-xs-12 ph-5">
        <div class="form-group">
          <label for="origen">Origen</label>
          <input id="origen" type="text" class="form-control lugar" name="origen" placeholder="Ingresa desde donde viajas">
        </div>
      </div>
      <div class="col-xs-12 ph-5">
        <div class="form-group">
          <label for="destino">Destino</label>
          <input id="destino" type="text" class="form-control lugar" name="destino" placeholder="Ingresa hasta dónde viajas">
        </div>
      </div>
    </div>
    <div class="row-fluid clearfix">
      <div class="col-xs-12 ph-5">
        <div class="form-group">
          <label>
            <input id="no-fechas" type="checkbox" name="nofecha" value="y">
            Todavía no he decidido mis fechas
          </label>
        </div>
      </div>
    </div>
    <div class="row-fluid clearfix">
      <div class="col-xs-6 ph-5">
        <div class="form-group">
          <label for="desde">¿En que fecha?</label>
          <input type="text" id="desde" class="form-control" name="desde" placeholder="Desde">
        </div>
      </div>
      <div class="col-xs-6 ph-5">
        <div class="form-group">
          <label class="only-ida"><input id="solo-ida" type="checkbox" name="soloida"> Solo ida</label>
          <input type="text" id="hasta" class="form-control" name="hasta" placeholder="Regreso">
        </div>
      </div>
      <div class="col-xs-6 ph-5">
        <div class="form-group">
          <label id="adultos">Adultos</label>
          <select name="adultos" id="adultos" class="form-control">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
          </select>
        </div>
      </div>
      <div class="col-xs-6 ph-5">
        <div class="form-group">
          <label id="menores">Menores</label>
          <select name="menores" id="menores" class="form-control">
            <option value="0">0</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
          </select>
        </div>
      </div>
    </div>
    <div class="row-fluid clearfix mt-14">
      <div class="col-xs-12">
        <button type="submit" class="btn btn-info btn-search">Buscar</button>
      </div>
      <div class="col-xs-12 low-cost">
        <span>Precios bajos garantizados</span>
      </div>
    </div>
  </form>
</div>