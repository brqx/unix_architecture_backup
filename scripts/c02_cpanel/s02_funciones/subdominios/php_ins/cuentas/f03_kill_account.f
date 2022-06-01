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
#+ Funciones:
#-------------------------------------------------------------------
#- versub      : Devuelve las instancias de Apache en un momento dado
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

//$xmlapi->set_port(2083);
$xmlapi->set_debug(1);

//$xmlapi->password_auth("root",$cppass);

printf ("Preparado para terminar cuenta : $cuenta \n");

$acct = array( username => "suuser");
$acct_kill = "suuser";
print $xmlapi->removeacct($acct_kill); 

?>
