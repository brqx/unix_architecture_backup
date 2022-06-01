#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 5.2"          #  Version del Script actual
FECHA_SCRIPT="Marzo 2011"
STATUS_SCRIPT="Pendiente"
#-------------------------------------------------------------------
LEVEL_NIVEL=04
CONCEPT_MOLDE="funcion"
CONCEPT_ARQUETIPO="drush"
CONCEPT_LEVEL="Script $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} ${CONCEPT_CARACTER}"
#-==================================================================
#+ Funciones definidos:
#-------------------------------------------------------------------
#-- gdl		--> Goto and Auto Drush download and adjust to Brqx Architecture
#-====----========----========----========----========----========--
#- Drupal Drush - La shell de drupal (requiere que esté instalada )
#-====----========----========----========----========----========--
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- adl 
#-------------------------------------------------------------------
#-- Ejemplos :
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- gdl cck	--> Baja la ultima version de la carpeta y la enlaza a links
#-------------------------------------------------------------------
#-- gdl cck 5 --> Baja cck-5.x-1.x-dev
#-------------------------------------------------------------------
#-- gdl cck 6 3 --> Baja cck-6.x-3.x-dev
#-==================================================================

#- Automatiza la descarga y generacion de la estructura, pero debe estar en la carpeta.
gdl()
{
INFO_SCRIPT="Accede a la ruta del modulo y Descarga via drush el módulo/tema y genera la estructura necesaria"

# La idea es generar drush ddl ampliado
#
#- Como minimo debe recibir 1 parametro
#- Necesitamos  :

#--1 Componente a actualizar
#--2 Tipo de Componente
#--3 Version del Componente
#--4 Subversión del Componente

#- Vamos a obtener el nombre de la carpeta

COMPONENTE=${1}
INICIAL_COMPONENTE=${2}
VERSION_SIMPLE=${3}
SUB_VERSION=${4}

#-====----========----========----========----========----========--
if [ "${COMPONENTE}" != "" ] ; then

#-Guardamos la ruta actual
RUTA_ACTUAL=$PWD

if [ "${INICIAL_COMPONENTE}" = "m" ] ; then
TIPO_COMPONENTE=modules

elif [ "${INICIAL_COMPONENTE}" = "t" ] ; then
#- xnb t activesite
TIPO_COMPONENTE=themes
fi


if [ "${VERSION_SIMPLE}" == "" ] ; then
VERSION_SIMPLE=7
fi

if [ "${SUB_VERSION}" == "" ] ; then
SUB_VERSION=1.x
fi

VERSION_COMPONENTE=${VERSION_SIMPLE}0

RUTA_PROD=/brqx/base/drupal/v${VERSION_COMPONENTE}/${TIPO_COMPONENTE}/abc/

LETRA=$( echo ${COMPONENTE} | cut -c1 )

RUTA_COMPONENTE=${RUTA_PROD}${LETRA}/${COMPONENTE}/

##cd ${RUTA_COMPONENTE}

##adl ${VERSION_SIMPLE} ${SUB_VERSION}

echo "adl ${VERSION_SIMPLE} ${SUB_VERSION} "

#-Volvemos a la ruta inicial

##cd ${RUTA_ACTUAL}

else

e_pmi adl "componente version_drupal version"


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

