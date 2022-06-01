#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="2.2" #  Version del Script actual
FECHA_SCRIPT="Marzo 2016"
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
#-- drul
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmp
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Drupal Link - Enlace versiones certificads de drupal en proyectos
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
#E drul  - Genera estructura de carpetas
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-Si afecta a la estructura de enlaces BRQX : 
# /brqx/lnk/drupal/v${VERSION_DRUPAL}/core/modules

drul()
{
IS_drul="Genera los links de una estructura de carpetas Drupal"
INFO_SCRIPT=${IS_drul}

VERSION_DRUPAL=$1
SITE_PATH=$2

if [ "${VERSION_DRUPAL}" 	== "" ] ; then
VERSION_DRUPAL=70
fi

if [ "${SITE_PATH}" 		== "" ] ; then
SITE_PATH="./"
fi

if [ "${VERSION_DRUPAL}" == "-?" ] ; then

e_pmp drul "version"

else

RUTA_ACTUAL=${PWD}
ENFOQUE_DEFECTO=test
SITUACION=OK

# Lo primero que hay que ver es que se lanze o no desde el home o desde una 
# ruta de subdominio

DRUPAL_CORE_PATH="/brqx/lnk/drupal/v${VERSION_DRUPAL}/core/"

DRUPAL_VENDOR_PATH="${DRUPAL_CORE_PATH}vendor/"


if [ "${VERSION_DRUPAL}" 	== "80_disabled" ] ; then
echo "enlazando 80"

mkdir -p 			${SITE_PATH}/vendor		2> 	/dev/null		

cp -Lr ${DRUPAL_CORE_PATH}core					${SITE_PATH}/core

#-Da problemas raros si hago enlaces
#lnk 	${DRUPAL_CORE_PATH}core/modules        	${SITE_PATH}/core/modules
#lnk 	${DRUPAL_CORE_PATH}core/themes      	${SITE_PATH}/core/themes
#lnk  	${DRUPAL_CORE_PATH}core/includes    	${SITE_PATH}/core/includes
#lnk  	${DRUPAL_CORE_PATH}core/profiles    	${SITE_PATH}/core/profiles
#lnk  	${DRUPAL_CORE_PATH}core/scripts     	${SITE_PATH}/core/scripts
#lnk  	${DRUPAL_CORE_PATH}core/misc        	${SITE_PATH}/core/misc
#lnk  	${DRUPAL_CORE_PATH}core/lib   	     	${SITE_PATH}/core/lib
#lnk  	${DRUPAL_CORE_PATH}core/assets        	${SITE_PATH}/core/assets

mkdir -p 			${SITE_PATH}/vendor		2> 	/dev/null		

#-Folders what can be symblinks
cp -Lr ${DRUPAL_VENDOR_PATH}autoload.php		${SITE_PATH}vendor
cp -Lr ${DRUPAL_VENDOR_PATH}bin					${SITE_PATH}vendor
cp -Lr ${DRUPAL_VENDOR_PATH}composer			${SITE_PATH}vendor

lnk ${DRUPAL_VENDOR_PATH}behat					${SITE_PATH}vendor/behat						
lnk ${DRUPAL_VENDOR_PATH}doctrine 				${SITE_PATH}vendor/doctrine
lnk ${DRUPAL_VENDOR_PATH}easyrdf 				${SITE_PATH}vendor/easyrdf
lnk ${DRUPAL_VENDOR_PATH}egulias 				${SITE_PATH}vendor/egulias
lnk ${DRUPAL_VENDOR_PATH}fabpot 				${SITE_PATH}vendor/fabpot
lnk ${DRUPAL_VENDOR_PATH}guzzlehttp 			${SITE_PATH}vendor/guzzlehttp
lnk ${DRUPAL_VENDOR_PATH}ircmaxell 				${SITE_PATH}vendor/ircmaxell
lnk ${DRUPAL_VENDOR_PATH}jcalderonzumba 		${SITE_PATH}vendor/jcalderonzumba
lnk ${DRUPAL_VENDOR_PATH}masterminds 			${SITE_PATH}vendor/masterminds
lnk ${DRUPAL_VENDOR_PATH}mikey179 				${SITE_PATH}vendor/mikey179
lnk ${DRUPAL_VENDOR_PATH}paragonie 				${SITE_PATH}vendor/paragonie
lnk ${DRUPAL_VENDOR_PATH}phpdocumentor 			${SITE_PATH}vendor/phpdocumentor
lnk ${DRUPAL_VENDOR_PATH}phpspec 				${SITE_PATH}vendor/phpspec
lnk ${DRUPAL_VENDOR_PATH}phpunit 				${SITE_PATH}vendor/phpunit
lnk ${DRUPAL_VENDOR_PATH}psr 					${SITE_PATH}vendor/psr
lnk ${DRUPAL_VENDOR_PATH}sebastian 				${SITE_PATH}vendor/sebastian
lnk ${DRUPAL_VENDOR_PATH}stack 					${SITE_PATH}vendor/stack
lnk ${DRUPAL_VENDOR_PATH}symfony 				${SITE_PATH}vendor/symfony
lnk ${DRUPAL_VENDOR_PATH}symfony-cmf 			${SITE_PATH}vendor/symfony-cmf
lnk ${DRUPAL_VENDOR_PATH}twig 					${SITE_PATH}vendor/twig
lnk ${DRUPAL_VENDOR_PATH}web.config 			${SITE_PATH}vendor/web.config
lnk ${DRUPAL_VENDOR_PATH}wikimedia 				${SITE_PATH}vendor/wikimedia
lnk ${DRUPAL_VENDOR_PATH}zendframework 			${SITE_PATH}vendor/zendframework


elif [ "${VERSION_DRUPAL}" 	== "70" -o "${VERSION_DRUPAL}" 	== "50"  ] ; then
#- Enlaces Drupal 7
lnk 	${DRUPAL_CORE_PATH}modules     ${SITE_PATH}/modules
lnk 	${DRUPAL_CORE_PATH}themes      ${SITE_PATH}/themes
lnk  	${DRUPAL_CORE_PATH}includes    ${SITE_PATH}/includes
lnk  	${DRUPAL_CORE_PATH}profiles    ${SITE_PATH}/profiles
lnk  	${DRUPAL_CORE_PATH}scripts     ${SITE_PATH}/scripts
lnk  	${DRUPAL_CORE_PATH}misc        ${SITE_PATH}/misc

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
#-------------------------------------------------------------------
limpia_variables;
#-==================================================================
