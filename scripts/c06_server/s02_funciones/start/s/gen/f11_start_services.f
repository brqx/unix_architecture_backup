#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.2"          #  Version del Script actual
FECHA_SCRIPT="Octubre 2012"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="function"
CONCEPT_ARQUETIPO_05="start"
CONCEPT_LEVEL_05="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- start_services
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Inicia todos los servicios del servidor
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T iniciar servicios servidor server start services
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E start_services -- Inicia los servicios del servidor
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Mini Alias sts
start_services()
{
IS_start_services="Inicia los servicios del servidor"
INFO_SCRIPT=${IS_start_services}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_start_services=${INFO_SCRIPT}

INFO=${1}

SALIDA_start_services=0

NOMBRE_SCRIPT_start_services=start_services
PARAMETROS_start_services="[-?]"


if [ "${INFO}" == "" ]; then
INFO="-?"
fi

if [ "${INFO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_start_services} ${PARAMETROS_SCRIPT_start_services}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Parar Varnish
#-- [2] Parar Solr
#-- [3] Parar Apache
#-- [4] Parar Mysql
#--------========--------========--------========--------========---

parar_varnish;
parar_solr;
parar_apache;
parar_mysql;

#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------
fi
}

#-------------------------------------------------------------------
#+ Sistema de trazado N5 - parametrizado
#-------------------------------------------------------------------
if [ "${N5}" != "" ] ; then
echo "${LEVEL_NIVEL_05}/${LEVEL_NIVEL}--${CONCEPT_LEVEL_05}"
fi
#-------------------------------------------------------------------

#-==================================================================
#+ Vaciado de Variables
#-------------------------------------------------------------------
limpia_variables;
#-==================================================================
