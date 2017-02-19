<?php

require_once BASEPATH . '/service/MySQLService.php';

class MainService{

  var $mysqlService;

  function __construct() {
    $this->mysqlService = new MySQLService();
  } 

  function buscarVuelos(VuelosParams $vuelosParams){
    echo "Holi";
  }

  function obtenerLugar($term) {
    $data = $this->mysqlService->obtenerLugar($term);

    $domXml = new DOMDocument('1.0', 'UTF-8');
    $xmlRoot = $domXml->createElement('lugares');
    $domXml->appendChild($xmlRoot);
    foreach ($data as $lugar) {
      $xmlLugar = $domXml->createElement('lugar');
      $xmlLugar->appendChild($domXml->createElement('id', $lugar['id']));
      $xmlLugar->appendChild($domXml->createElement('nombre', $lugar['nombre']));
      $xmlRoot->appendChild($xmlLugar);
    }

    return $domXml;

  }
}