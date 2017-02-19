<?php


require_once 'config.php';
require_once BASEPATH . '/util/VuelosParams.php';
require_once BASEPATH . '/service/MainService.php';

$params = new VuelosParams();
$service = new MainService();
$xml = $service->buscarVuelos($params);

header('Content-Type: application/xml');
echo $xml->saveXML();