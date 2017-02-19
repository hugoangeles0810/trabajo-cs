<?php

require_once BASEPATH . '/util/VuelosParams.php';

interface VuelosService {
  function buscarVuelos(VuelosParams $vuelosParams, DOMDocument $doc, DOMElement $rootElems);

  function obtenerLugar($term);
}