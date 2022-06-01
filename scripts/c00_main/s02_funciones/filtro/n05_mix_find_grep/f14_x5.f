#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="5.1" #  Version del Script actual
FECHA_SCRIPT="Mayo 2011"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="filtro"
CONCEPT_ARQUETIPO_04="trace"
CONCEPT_VARIANTE_04="nivel1"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- x5 - xl5
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- f
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Hace una busqueda por extension y filtrando por el contenido
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T filtrado extension filtro contenido cinco
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P FUNCION
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E x5 java captura a b c  -- Devuelve las lineas de ficheros java que contienen captura
#-------------------------------------------------------------------
#E xl5 java captura a b c -- Devuelve los ficheros java que contienen captura
#-==================================================================

x5()
{
IS_x5="Funciona similar a f5 pero en lugar de sacar los archivos, lista su contenido"
INFO_SCRIPT=${IS_x5}

EXTENSION=$1 ;
FILTRO=$2    ;
FILTRO2=$3    ;
CONTENIDO=$4   ;
CONTENIDO2=$5   ;

if [ "${EXTENSION}" != "" -a "${FILTRO}" != "" -a "${FILTRO2}" != "" -a "${CONTENIDO}" != "" -a "${CONTENIDO2}" != "" ] ; then


f ${EXTENSION} | grep ${FILTRO} |grep ${FILTRO2} | xargs grep ${CONTENIDO} {} \;  2> /dev/null | grep ${CONTENIDO2}  ;

else

e_pmi x5 "EXTENSION FILTRO FILTRO2 CONTENIDO CONTENIDO2"

fi

}

#-------------------------------------------------------------------

xl5()
{
IS_xl5="Funciona igual que f5 pero con xargs. Obtiene los ficheros"
INFO_SCRIPT=${IS_xl5}

EXTENSION=$1 ;
FILTRO=$2    ;
FILTRO2=$3    ;
CONTENIDO=$4   ;
CONTENIDO2=$5   ;

if [ "${EXTENSION}" != "" -a "${FILTRO}" != "" -a "${FILTRO2}" != "" -a "${CONTENIDO}" != "" -a "${CONTENIDO2}" != "" ] ; then

f ${EXTENSION} | grep ${FILTRO} |grep ${FILTRO2} | xargs grep -l  ${CONTENIDO} {} \;  2> /dev/null | grep ${CONTENIDO2}    ;

else

e_pmi xl5 "EXTENSION FILTRO FILTRO2 CONTENIDO CONTENIDO2"

fi

}
