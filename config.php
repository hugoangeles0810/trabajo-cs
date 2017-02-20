<?php

define(BASEPATH, __DIR__);
define(DEBUG, true);

define(MYSQL_HOST, "localhost");
define(MYSQL_DB, "vuelos-cliente");
define(MYSQL_USER, "root");
define(MYSQL_PASS, "123456");

define(POSTG_HOST, "localhost");
define(POSTG_DB, "vuelos-cliente");
define(POSTG_USER, "root");
define(POSTG_PASS, "123456");


if (DEBUG) {
  ini_set('display_errors', 1);
  ini_set('display_startup_errors', 1);
  error_reporting(E_ALL);
}