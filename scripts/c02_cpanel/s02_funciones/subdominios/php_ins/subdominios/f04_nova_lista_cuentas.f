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
#- Lista subdominio pasado como parametro para ver si existe
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#- listasub  zb bbrqx.com pelotero colecciones
#-------------------------------------------------------------------
# Por defecto los entornos son :
#-------------------------------------------------------------------
#-- Usuario : zd ( en servidor 2 )
#-- Enfoque : test 
# ( profesionales personales colecciones proyeccion metodologias )
#-- Dominio : dbrqx.com ( en servidor 2 )
#-==================================================================
*/
require_once('../xmlapi.php');
$db_host = "ebrqx.com";
$cpuser = "root";
$cppass = "Yh&7EgfsP0"; 
$dbname= "ricardito";

$xmlapi = new xmlapi('204.61.222.61');
$xmlapi->password_auth($cpuser, $cppass);
$xmlapi->set_debug(1);


$parametros_pasados=$argc;

$dominio_pasado="dbrqx.com";
$usuario_pasado="zd";
$enfoque_pasado="test";

$fich_serv='/brqx/zdominios_servidor.dat';

$acct_dom="zd";


$args =array(
  domain=> "bbrqx.com",
  rootdomain=> "",
  dir => ""
);

print $xmlapi->api2_query($acct_dom, "DomainLookup", "getbasedomains", $args );

?>
