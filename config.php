<?php

define(BASEPATH, __DIR__);
define(DEBUG, true);

define(MYSQL_HOST, "localhost");
define(MYSQL_DB, "vuelos-cliente");
define(MYSQL_USER, "root");
define(MYSQL_PASS, "123456");

define(POSTG_HOST, "localhost");
define(POSTG_DB, "vuelos-cliente");
define(POSTG_USER, "postgres");
define(POSTG_PASS, "123456");

define(SQLSRV_HOST, "sqlserver.cg1bl5rdezxs.us-west-2.rds.amazonaws.com");
define(SQLSRV_DB, "vuelos-cliente");
define(SQLSRV_USER, "sa");
define(SQLSRV_PASS, "12345678");


if (DEBUG) {
  ini_set('display_errors', 1);
  ini_set('display_startup_errors', 1);
  error_reporting(E_ALL);
}