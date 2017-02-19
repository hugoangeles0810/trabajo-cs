<?php

class VuelosParams {
  private $origen, $destino, $noFechas, $soloIda, $desde, $hasta, 
      $cantAdultos, $cantMenores;

  function __construct() {
    $this->origen = isset($_GET['origen']) ? $_GET['origen'] : null;
    $this->destino = isset($_GET['destino']) ? $_GET['destino'] : null;
    
    $this->noFechas = false;
    if (isset($_GET['nofechas'])) {
      $this->noFechas = true;
    } else {
      $this->noFechas = false;
      $this->desde = isset($_GET['desde']) ? $_GET['desde'] : null;
    }

    $this->soloIda = false;
    if (isset($_GET['soloida'])) {
      $this->soloIda = true;
    } else {
      $this->soloIda = false;
      $this->hasta = isset($_GET['hasta']) ? $_GET['hasta'] : null;
    }

    $this->cantAdultos = isset($_GET['adultos']) ? $_GET['adultos'] : null;
    $this->cantMenores = isset($_GET['menores']) ? $_GET['menores'] : null;
  } 

  public function getOrigen() {
    return $this->origen;
  }

  public function getDestino() {
    return $this->destino;
  }

  public function getDesde() {
    return $this->desde;
  }


  public function getHasta() {
    return $this->hasta;
  }

  public function getNoFechas() {
    return $this->noFechas;
  }

  public function getSoloIda() {
    return $this->soloIda;
  }


  public function getCantAdultos() {
    return $this->cantAdultos;
  }


  public function getCantMenores() {
    return $this->cantMenores;
  }
}