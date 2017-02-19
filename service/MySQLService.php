<?php

require_once BASEPATH . '/service/VuelosService.php';

class MySQLService implements VuelosService {
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
             "where 1 ";

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

    $result = $con->query($query);

    if ($result->num_rows > 0) {
      while($row = $result->fetch_assoc()) {
        $vueloElem = $doc->createElement('vuelo');
        $vueloElem->appendChild($doc->createElement('id', $row['id']));
        $vueloElem->appendChild($doc->createElement('origen', $row['origen']));
        $vueloElem->appendChild($doc->createElement('destino', $row['destino']));
        $vueloElem->appendChild($doc->createElement('fecha', $row['fecha']));

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
    return new mysqli(MYSQL_HOST, MYSQL_USER, MYSQL_PASS, MYSQL_DB);
  }
}