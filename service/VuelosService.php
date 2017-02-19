<?php

require_once BASEPATH . '/util/VuelosParams.php';

interface VuelosService {
  function buscarVuelos(VuelosParams $vuelosParams);

  function obtenerLugar($term);
}