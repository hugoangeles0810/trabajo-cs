<?php

require_once BASEPATH . '/service/VuelosService.php';

class SQLSrvService implements VuelosService {
  function buscarVuelos(VuelosParams $params, DOMDocument $doc, DomElement $rootElem){
    try {
      $con = $this->getConnection();

      if (!$con) return;

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

      $result = mssql_query($query);

      if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
          $vueloElem = $doc->createElement('vuelo');
          $vueloElem->appendChild($doc->createElement('id', $row['id']));
          $vueloElem->appendChild($doc->createElement('origen', $row['origen']));
          $vueloElem->appendChild($doc->createElement('destino', $row['destino']));
          $vueloElem->appendChild($doc->createElement('fecha', $row['fecha']));
          $vueloElem->appendChild($doc->createElement('aerolinea', 'Taca Perú'));

          $rootElem->appendChild($vueloElem);
        }
      }
    } catch (Exception $e) {
      
    }

  }

  function obtenerLugar($term) {
    $data = array();
    try {
      $con = $this->getConnection();
      $result = $con->query("SELECT * FROM lugar WHERE nombre LIKE '$term%'");

      if (!$con) return $data;
      
      if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            $lugar = array(
              'id' => $row['id'],
              'nombre' => $row['nombre']
            );

            $data[] = $lugar;
        }
      }
    } catch (Exception $e) {
      
    }

    return $data;

  }

  private function getConnection() {
    if (function_exists("mssql_connect")) {
      $con = mssql_connect(SQLSRV_HOST, SQLSRV_USER, SQLSRV_PASS);
      msql_select_db(SQLSRV_DB, $con);
      return $con; 
    }
    return false;
  }
}