<?php
/*
#!/usr/bin/php
/*
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2010
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.0"          #  Version del Script actual
FECHA_SCRIPT="Enero 2010"
#-==================================================================
#+ Funcion:
#-------------------------------------------------------------------
#- Prueba de paso de parametros
#- subdominio_out  : Inserta en un archivo la memoria libre
#-------------------------------------------------------------------
*/
require_once('xmlapi.php');
$db_host = "ebrqx.com";
$cpuser = "root";
$cppass = "Yh&7EgfsP0"; 
$dbname= "ricardito";


$xmlapi = new xmlapi('204.61.222.61');
$xmlapi->password_auth($cpuser, $cppass);

$xmlapi->set_debug(1);

printf ("Recogida de parametros \n");
printf ("Paranetro1   " . $argv[1] . "\n");
// var_dump($argv)

?>
