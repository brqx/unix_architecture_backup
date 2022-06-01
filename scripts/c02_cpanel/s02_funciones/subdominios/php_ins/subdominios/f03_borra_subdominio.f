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
#- Crea o actualiza un subdominio pasado como parametro
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#- creasub  zb bbrqx.com pelotero colecciones
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

switch($parametros_pasados)
{
case 5:
  $pasados='cinco';
  // Nos pasan cuatro parametros : zb bbrqx.com colecciones mistroncos
  printf("Demasiados parametros para la orden \n");

  break;

case 4:
  $pasados='cuatro';
  // Nos pasan tres parametros : zb colecciones mistroncos
  // No puede ser, es un error, no te peuden pasar tres parametros
  // Vamos a crear un ficheo de subdominios y cuentas con lo cual si podra ser esta opcion
  printf("Creando subdominio con parametro \n");

  $usuario_pasado = $argv[1];

  #- Hay que llamar al sistema
  $linea_llamada= 'cat ' . $fich_serv . '| grep "' . $usuario_pasado . ':" | cut -d ":" -f2';
  $llamada = system( $linea_llamada, $retval);

  $dominio_pasado = $llamada ;
  $enfoque_pasado = $argv[2];
  $subdominio_a_crear = $argv[3];  
  break;
case 3:
  $pasados='tres';	
  // En esta situacion nos pasan dos parametros colecciones mistroncos 
  $enfoque_pasado=$argv[1] ;
  $subdominio_a_crear = $argv[2];
  break;
case 2:
  $pasados='dos';	
  $subdominio_a_crear = $argv[1]; 
  // Se usaran los parametros por defecto
  break;
default:
  $pasados='uno';	
  // En este caso no se ha pasado parametro alguno, debe salir
  printf ("Formato: funcion [subdominio] [parametros] \n"); 
  exit(1);
}

printf ("Borrando subdominio : $subdominio_a_crear  \n");
 

$acct_dom= $usuario_pasado;
$args = array(
  domain=> $subdominio_a_crear,
  rootdomain=> $dominio_pasado,
  dir => "public_html/brqxng/proyectos/". $enfoque_pasado . "/" .  $subdominio_a_crear
);

printf("Borra Linea: $usuario_pasado  $dominio_pasado  $enfoque_pasado  $subdominio_a_crear  \n");

print $xmlapi->api2_query($acct_dom, "SubDomain", "delsubdomain", $args );

?>
