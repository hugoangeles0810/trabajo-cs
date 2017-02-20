<?php

require_once BASEPATH . '/service/VuelosService.php';

class POSTGService implements VuelosService {
	
  function buscarVuelos(VuelosParams $params, DOMDocument $doc, DomElement $rootElem){
    $con = $this->getConnection();
    $query = "SELECT " . 
             "v.id id, ". 
             "origen.nombre origen, " . 
             "destino.nombre destino, " . 
             "v.fecha fecha " .
             "FROM vuelo v " .
             "INNER JOIN lugar origen on origen.id = v.origen " . 
             "INNER JOIN lugar destino  on destino.id = v.destino " .
             "where TRUE ";


    if ($params->getOrigen() != null && 
        $params->getDestino() != null) {
      $query = $query . 
              "and origen.nombre = '" . $params->getOrigen() . "' " .
              "and destino.nombre = '" . $params->getDestino() . "' ";

    }

    if (!$params->getNoFechas() && 
        $params->getDesde() != null) {
        $query = $query . "and v.fecha >= '" . $params->getDesde() . "' ";
      if (!$params->getSoloIda() && 
          $params->getHasta() != null) {
        $query = $query . "and v.fecha <= '" . $params->getHasta() . "' ";
      }
    }

    $result = pg_query($con, $query);

    if ($result) {
      while($row = pg_fetch_row($result)) {
        $vueloElem = $doc->createElement('vuelo');
        $vueloElem->appendChild($doc->createElement('id', $row[0]));
        $vueloElem->appendChild($doc->createElement('origen', $row[1]));
        $vueloElem->appendChild($doc->createElement('destino', $row[2]));
        $vueloElem->appendChild($doc->createElement('fecha', $row[3]));
        $vueloElem->appendChild($doc->createElement('aerolinea', 'Latam Airlines'));

        $rootElem->appendChild($vueloElem);
      }
    }

  }

  function obtenerLugar($term) {
    $data = array();
    $con = $this->getConnection();
    $result = $con->query("SELECT * FROM lugar WHERE nombre LIKE '$term%'");

    if ($result->num_rows > 0) {
      while($row = $result->fetch_assoc()) {
          $lugar = array(
            'id' => $row['id'],
            'nombre' => $row['nombre']
          );

          $data[] = $lugar;
      }
    }

    return $data;

  }

  private function getConnection() {
    $conn_string = "host=" . POSTG_HOST . 
                  " port=5432" . 
                  " dbname=" . POSTG_DB .
                  " user=" . POSTG_USER . 
                  " password=" . POSTG_PASS;
    return pg_connect($conn_string);
  }
}