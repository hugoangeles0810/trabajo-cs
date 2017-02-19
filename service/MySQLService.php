<?php

require_once BASEPATH . '/service/VuelosService.php';

class MySQLService implements VuelosService {
  function buscarVuelos(VuelosParams $vuelosParams){
    echo "Holi";
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