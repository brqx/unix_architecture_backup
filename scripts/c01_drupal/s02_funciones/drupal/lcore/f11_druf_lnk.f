#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2016
#-------------------------------------------------------------------
VERSION_SCRIPT="2.4" #  Version del Script actual
FECHA_SCRIPT="Octubre 2016"
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
#-- druf
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
#E druf  - Genera estructura de carpetas
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-Si afecta a la estructura de enlaces BRQX : 
# /brqx/lnk/drupal/v${VERSION_DRUPAL}/phpfiles

druf()
{
IS_drul="Genera los links de una estructura de carpetas Drupal"
INFO_SCRIPT=${IS_drul}
VER="2.3"

VERSION_DRUPAL=$1
SITE_PATH=$2


if [ "${VERSION_DRUPAL}" == "" ] ; then
VERSION_DRUPAL=70
fi

if [ "${SITE_PATH}" == "" ] ; then
SITE_PATH="./"
fi

if [ "${VERSION_DRUPAL}" == "-?" ] ; then

e_pmp druf "version site_path"

else

RUTA_ACTUAL=${PWD}
ENFOQUE_DEFECTO=test
SITUACION=OK

# Lo primero que hay que ver es que se lanze o no desde el home o desde una 
# ruta de subdominio

#rm -f cron.php cron.x
#rm -f .htaccess robots.txt
#rm -f index.php info.php i.php mem.php
#rm -f server.php update.php xmlrpc.php
#rm -f rotate.php

PHP_FILES_PATH="/brqx/lnk/drupal/v${VERSION_DRUPAL}/phpfiles/"
DRUPAL_CORE_PATH="/brqx/lnk/drupal/v${VERSION_DRUPAL}/core/"


if 	[ "${VERSION_DRUPAL}" == "50" ] ; then
#-Links Drupal V5
lnk  ${PHP_FILES_PATH}cron.php        ${SITE_PATH}/cron.php     
lnk  ${PHP_FILES_PATH}robots.txt      ${SITE_PATH}/robots.php
lnk  ${PHP_FILES_PATH}update.php      ${SITE_PATH}/update.php
lnk  ${PHP_FILES_PATH}xmlrpc.php      ${SITE_PATH}/xmlrpc.php

elif [ "${VERSION_DRUPAL}" == "70" ] ; then
#-Links Drupal V7
lnk  ${PHP_FILES_PATH}cron.php        ${SITE_PATH}/cron.php     
lnk  ${PHP_FILES_PATH}robots.txt      ${SITE_PATH}/robots.txt
lnk  ${PHP_FILES_PATH}xmlrpc.php      ${SITE_PATH}/xmlrpc.php

lnk  ${PHP_FILES_PATH}authorize.php   ${SITE_PATH}/authorize.php
lnk  ${PHP_FILES_PATH}js.php          ${SITE_PATH}/js.php


elif [ "${VERSION_DRUPAL}" == "80_disabled" ] ; then
#-Links Drupal V8
echo "s" | cp -Lf	${PHP_FILES_PATH}autoload.php      		${SITE_PATH}				2> /dev/null
echo "s" | cp -Lf	${PHP_FILES_PATH}composer.json			${SITE_PATH}				2> /dev/null
echo "s" | cp -Lf	${PHP_FILES_PATH}composer.lock			${SITE_PATH}				2> /dev/null

lnk  ${PHP_FILES_PATH}web.config				${SITE_PATH}web.config
lnk  ${PHP_FILES_PATH}.gitignore				${SITE_PATH}.gitignore

#-Next level core
lnk  ${DRUPAL_CORE_PATH}composer.json    		${SITE_PATH}core/composer.json
lnk  ${DRUPAL_CORE_PATH}core.api.php    		${SITE_PATH}core/core.api.php
lnk  ${DRUPAL_CORE_PATH}globals.api.php    		${SITE_PATH}core/globals.api.php

lnk  ${DRUPAL_CORE_PATH}install.php    			${SITE_PATH}core/install.php
lnk  ${DRUPAL_CORE_PATH}rebuild.php    			${SITE_PATH}core/rebuild.php

lnk  ${DRUPAL_CORE_PATH}core.libraries.yml    	${SITE_PATH}core/autoload.php
lnk  ${DRUPAL_CORE_PATH}core.services.yml    	${SITE_PATH}core/autoload.php

lnk  ${DRUPAL_CORE_PATH}phpcs.xml.dist			${SITE_PATH}core/phpcs.xml.dist
lnk  ${DRUPAL_CORE_PATH}phpunit.xml.dist		${SITE_PATH}core/phpunit.xml.dist

echo "s" | cp -Lf 	${DRUPAL_CORE_PATH}core.libraries.yml    	${SITE_PATH}core/core.libraries.yml						2> /dev/null
echo "s" | cp -Lf 	${DRUPAL_CORE_PATH}core.services.yml    	${SITE_PATH}core/core.services.yml						2> /dev/null
echo "s" | cp -Lf 	${DRUPAL_CORE_PATH}authorize.php    		${SITE_PATH}core/authorize.php							2> /dev/null

#-De momento dejamos el site listo para instalar
echo "s" | cp -Lf 	${DRUPAL_CORE_PATH}default.settings.php    		${SITE_PATH}sites/default/settings.php		2> /dev/null
#echo "s" | cp -Lf 	${DRUPAL_CORE_PATH}settings.php    				${SITE_PATH}sites/default/settings_generated.php		2> /dev/null

fi

#-Enlaces independientes de la version de drupal

if [ "${VERSION_DRUPAL}" 	== "70" -o "${VERSION_DRUPAL}" 	== "50"  ] ; then

lnk  ${PHP_FILES_PATH}index.php       ${SITE_PATH}/index.php
lnk  ${PHP_FILES_PATH}update.php      ${SITE_PATH}/update.php

lnk  ${PHP_FILES_PATH}cron.x          ${SITE_PATH}/cron.x
lnk  ${PHP_FILES_PATH}.htaccess       ${SITE_PATH}/.htaccess

lnk  ${PHP_FILES_PATH}server.php      ${SITE_PATH}/server.php
lnk  ${PHP_FILES_PATH}info.php        ${SITE_PATH}/info.php
lnk  ${PHP_FILES_PATH}i.php           ${SITE_PATH}/i.php
lnk  ${PHP_FILES_PATH}mem.php         ${SITE_PATH}/mem.php

chown -R apache:apache  ${SITE_PATH}/*
chown -R apache:apache  ${SITE_PATH}/.htaccess

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
