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
$ruta_engine='/brqx/arquitectura/unix/scripts/depend/c02_cpanel/funciones/subdominios/php_ins/';
require_once($ruta_engine . 'xmlapi.php');

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
  printf("Demasiados parametros para tratar : 4 \n");
  exit(1);

  break;

case 4:
  $pasados='cuatro';
  // Nos pasan tres parametros : zb colecciones mistroncos
  printf("Demasiados parametros para tratar : 3 \n");
  
break;
case 3:
  $pasados='tres';	
  // Ejemplo : creasub zb mistroncos
  //-------------------------------------------------------------------

  // Parametros pasados :

  $usuario_pasado    = $argv[1];
  $subdominio_pasado = $argv[2];

  // Con esta informacion obtenemos :
  // - Dominio : accediendo al fichero principal
  // - Enfoque : accediendo al fichero de subdominios

  // Obtenemos el dominio
  //-------------------------------------------------------------------
  $linea_llamada= 'cat ' . $fich_serv . '| grep "' . $usuario_pasado . ':" | cut -d ":" -f2';
  $llamada = system( $linea_llamada, $retval);
  $dominio_pasado = $llamada ;

  // Obtenemos el enfoque
  //-------------------------------------------------------------------
  $ruta_subdominio='/home/' . $usuario_pasado . '/www/subdominios.dat';
  $linea_llamada= 'cat ' . $ruta_subdominio . '| grep ".*:' . $subdominio_pasado . '" | cut -d ":" -f1';
  $llamada = system( $linea_llamada, $retval);
  $enfoque_pasado = $llamada ;


  break;
case 2:
  $pasados='dos';	
  // Ejemplo : creasub mistroncos
  //-------------------------------------------------------------------
  // Usamos los valores por defecto de zd y dbrqx.com
  //------------------------------------------------------------------- 
  // Parametros pasados :
  $subdominio_pasado = $argv[1];

  // Obtenemos el enfoque
  //-------------------------------------------------------------------
  $ruta_subdominio='/home/' . $usuario_pasado . '/www/subdominios.dat';
  $linea_llamada= 'cat ' . $ruta_subdominio . '| grep "' . $subdominio_pasado . '" | cut -d ":" -f1';
  $llamada = system( $linea_llamada, $retval);
  $enfoque_pasado = $llamada ;

  // Se usaran los parametros por defecto
  break;
default:
  $pasados='uno';	
  // En este caso no se ha pasado parametro alguno, debe salir
  printf ("Formato: funcion [subdominio] [parametros] \n"); 
  exit(1);
}

printf ("Creando subdominio : $subdominio_pasado  \n");
 
//$acct_dom= "zb";
//$args = array(
//  domain=> "pelotas", 
//  rootdomain=> "bbrqx.com",
//  dir => "public_html/brqxng/proyectos/pelotas"
//); 

$acct_dom= $usuario_pasado;
$args = array(
  domain=> $subdominio_pasado,
  rootdomain=> $dominio_pasado,
  dir => "public_html/brqxng/proyectos/". $enfoque_pasado . "/" .  $subdominio_pasado
);

printf("Linea: $usuario_pasado  $dominio_pasado  $enfoque_pasado  $subdominio_pasado  \n");

print $xmlapi->api2_query($acct_dom, "SubDomain", "delsubdomain", $args );
print $xmlapi->api2_query($acct_dom, "SubDomain", "addsubdomain", $args );  

?>
