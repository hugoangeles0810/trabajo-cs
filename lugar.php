<?php 

require_once 'config.php';
require_once BASEPATH . '/service/MainService.php';


$term = "";
if (isset($_GET['term'])) {
  $term = $_GET['term'];
}


$service = new MainService();
$xml = $service->obtenerLugar($term);

header('Content-Type: application/xml');
echo $xml->saveXML();
