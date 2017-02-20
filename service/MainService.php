<?php

require_once BASEPATH . '/util/VuelosParams.php';
require_once BASEPATH . '/service/MySQLService.php';
require_once BASEPATH . '/service/POSTGService.php';
require_once BASEPATH . '/service/SQLSrvService.php';

class MainService{

  var $mysqlService;
  var $postgService;
  var $sqlSrvService;

  function __construct() {
    $this->mysqlService = new MySQLService();
    $this->postgService = new POSTGService();
    $this->sqlSrvService = new SQLSrvService();
  } 

  function buscarVuelos(VuelosParams $params){
    $domXml = new DOMDocument('1.0', 'UTF-8');

    $rootElem = $domXml->createElement('vuelos');
    $domXml->appendChild($rootElem);
    $this->mysqlService->buscarVuelos($params, $domXml, $rootElem);
	$this->postgService->buscarVuelos($params, $domXml, $rootElem);
  $this->sqlSrvService->buscarVuelos($params, $domXml, $rootElem);

    $domXml->formatOutput = true;
    return $domXml;
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

    $domXml->formatOutput = true;
    return $domXml;

  }
}