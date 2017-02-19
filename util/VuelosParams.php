<?php

class VuelosParams {
  private $origen, $destino, $desde, $hasta, 
      $cantAdultos, $cantMenores;

  public function setOrigen($origen) {
    $this->origen = $origen;
  }

  public function getOrigen() {
    return $this->origen;
  }

  public function setDestino($destino) {
    $this->destino = $destino;
  }

  public function getDestino() {
    return $this->destino;
  }

  public function setDesde($desde) {
    $this->desde = $desde;
  }

  public function getDesde() {
    return $this->desde;
  }

  public function setHasta($hasta) {
    $this->hasta = $hasta;
  }

  public function getHasta() {
    return $this->hasta;
  }

  public function setCantAdultos($cantAdultos) {
    $this->cantAdultos = $cantAdultos;
  }

  public function getCantAdultos() {
    return $this->cantAdultos;
  }

  public function setCantMenores($cantMenores) {
    $this->cantMenores = $cantMenores;
  }

  public function getCantMenores() {
    return $this->cantMenores;
  }
}