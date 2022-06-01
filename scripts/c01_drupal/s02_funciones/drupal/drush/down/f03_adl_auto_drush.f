#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2010
#-------------------------------------------------------------------
VERSION_SCRIPT="V 5.2"          #  Version del Script actual
FECHA_SCRIPT="Marzo 2010"
STATUS_SCRIPT="Pendiente"
#-------------------------------------------------------------------
LEVEL_NIVEL=04
CONCEPT_MOLDE="funcion"
CONCEPT_ARQUETIPO="drush"
CONCEPT_LEVEL="Script $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} ${CONCEPT_CARACTER}"
#-==================================================================
#+ Funciones definidos:
#-------------------------------------------------------------------
#-- adl		--> Auto Drush download and adjust to Brqx Architecture
#-====----========----========----========----========----========--
#- Drupal Drush - La shell de drupal (requiere que este instalada )
#-====----========----========----========----========----========--
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- d2l - xnb - xne
#-------------------------------------------------------------------
#-- Ejemplos :
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- adl	--> Baja la ultima version de la carpeta y la enlaza a links
#-------------------------------------------------------------------
#-- adl 5 --> Baja cck-5.x-1.x-dev
#-------------------------------------------------------------------
#-- adl 6 3 --> Baja cck-6.x-3.x-dev
#-------------------------------------------------------------------
#-- adl 6 3.1 --> Baja cck-6.x-3.1
#-==================================================================

#- Automatiza la descarga y generacion de la estructura, pero debe estar en la carpeta.
adl()
{
INFO_SCRIPT="Descarga via drush el modulo/tema y genera la estructura necesaria"

#-- La carpeta correspondiente
#-- En principio con eso vale , obtendremos la letra

NUMERO_PARAMETROS=$#
VERSION=${1}
SUBVERSION=${2}
DIVISION=${3}

if [ "${VERSION}" == "" ] ; then
#-Por defecto la version 7
VERSION=7
fi

if [ "${SUBVERSION}" == "" ] ; then
#-Por defecto la version 7
SUBVERSION=1.x
fi

if [ "${DIVISION}" == "" ] ; then
#-Por defecto la version 7
DIVISION=bas
fi


#- Vamos a obtener el nombre de la carpeta
RUTA_COMPONENTE=${PWD}
NOMBRE_COMPONENTE=$( basename $PWD )
LETRA=$( echo ${NOMBRE_COMPONENTE} | cut -c1 )

VERSION_DRUPAL=${VERSION}0

#- Vamos a obtener la fecha

FECHA_VERSION=$( date +%y%m )


#- Ya tenemos la informacion
#  Queremos hacer : 
#-  d2l captcha 7 1.x
#-  mv captcha captcha_1_x_dev_1106

#-Opcionalmente borramos la carpeta que exista en la ruta

rm -rf ${PWD}/*

d2l ${NOMBRE_COMPONENTE} ${VERSION} ${SUBVERSION}

#-  Necesitamos la version sin en punto

VERSION_SIN_PUNTO=$( echo ${SUBVERSION} | tr "." "_" )

mv ${NOMBRE_COMPONENTE} ${NOMBRE_COMPONENTE}_${VERSION_SIN_PUNTO}_dev_${FECHA_VERSION}

#- Ahora vamos a enlazar

xnb ${NOMBRE_COMPONENTE} ${VERSION_DRUPAL}

xne ${NOMBRE_COMPONENTE} ${DIVISION} ${VERSION_DRUPAL}


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
