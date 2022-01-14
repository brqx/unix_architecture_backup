#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2015
#-------------------------------------------------------------------
VERSION_SCRIPT="2.2" #  Version del Script actual
FECHA_SCRIPT="Junio 2011"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="drupal"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="lcore"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- udruf
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmp
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Drupal Link - DesEnlace versiones certificads de drupal en proyectos
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T generacion esctructura drupal
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P Version_Drupal
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E udruf  - Genera estructura de carpetas
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-Si afecta a la estructura de enlaces BRQX : 
# /brqx/lnk/drupal/v${VERSION_DRUPAL}/phpfiles

udruf()
{
IS_drul="Genera los links de una estructura de carpetas Drupal"
INFO_SCRIPT=${IS_drul}

VERSION_DRUPAL=$1


if [ "${VERSION_DRUPAL}" == "" ] ; then
VERSION_DRUPAL=50
fi

if [ "${VERSION_DRUPAL}" == "-?" ] ; then

e_pmp drul "user version"

else

RUTA_ACTUAL=${PWD}
ENFOQUE_DEFECTO=test
SITUACION=OK

# Lo primero que hay que ver es que se lanze o no desde el home o desde una 
# ruta de subdominio

if [ "${RUTA_ACTUAL}" = "/home" ] ; then
#-====----========----========----========----========----========--
#-echo "Se lanza desde el home"
#- Se lanza desde el home y no se ha pasado parametro, es un error
SITUACION=FALLO

#-====----========----========----========----========----========--
fi

if [ "${SITUACION}" = "FALLO"  ] ; then
#-====----========----========----========----========----========--
echo "No se puede enlazar proyectos desde el home del servidor"

#-------------------------------------------------------------------
else
#-------------------------------------------------------------------

unlink cron.php
unlink cron.x
unlink .htaccess
unlink index.php
unlink info.php
unlink i.php
unlink mem.php
unlink robots.txt
unlink rotate.php
unlink server.php
unlink update.php
unlink xmlrpc.php

if [ "${VERSION_DRUPAL}" == "70" ] ; then
unlink authorize.php
unlink js.php
fi


fi

fi
#-====----========----========----========----========----========--

}

#-------------------------------------------------------------------
#+ Sistema de trazado N4 - desactivado
#-------------------------------------------------------------------
#N4# echo "$LEVEL_NIVEL	-	Ejecutadas $CONCEPT_LEVEL"
#-------------------------------------------------------------------

#-==================================================================
#+ Vaciado de Variables
#-==================================================================
