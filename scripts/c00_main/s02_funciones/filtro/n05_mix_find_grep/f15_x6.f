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
#-- x6 - xl6
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- f - S_RCT
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Hace una busqueda por extension y filtrando por el contenido
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T filtrado extension filtro contenido seis
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P FUNCION
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E x6 java captura a b c d -- Devuelve las lineas de ficheros java que contienen captura
#-------------------------------------------------------------------
#E xl6 java captura a b c d -- Devuelve los ficheros java que contienen captura
#-==================================================================

x6()
{
IS_x6="Funciona similar a f6 pero en lugar de sacar los archivos, lista su contenido"
INFO_SCRIPT=${IS_x6}

EXTENSION=$1 ;
FILTRO=$2    ;
FILTRO2=$3    ;
CONTENIDO=$4   ;
CONTENIDO2=$5   ;
CONTENIDO3=$6   ;

if [ "${EXTENSION}" != "" -a "${FILTRO}" != "" -a "${FILTRO2}" != "" -a "${CONTENIDO}" != "" -a "${CONTENIDO2}" != "" -a "${CONTENIDO3}" != "" ] ; then


f ${EXTENSION} | grep ${FILTRO} |grep ${FILTRO2} | xargs grep ${CONTENIDO} {} \;  2> /dev/null | grep ${CONTENIDO2} | grep ${CONTENIDO3}  ;

else

e_pmi x6 "EXTENSION FILTRO FILTRO2 CONTENIDO CONTENIDO2 CONTENIDO3"

fi

}

#-------------------------------------------------------------------

xl6()
{
IS_xl6="Funciona igual que f6 pero con xargs. Obtiene los ficheros"
INFO_SCRIPT=${IS_xl6}

EXTENSION=$1 ;
FILTRO=$2    ;
FILTRO2=$3    ;
CONTENIDO=$4   ;
CONTENIDO2=$5   ;
CONTENIDO3=$6   ;

if [ "${EXTENSION}" != "" -a "${FILTRO}" != "" -a "${FILTRO2}" != "" -a "${CONTENIDO}" != "" -a "${CONTENIDO2}" != "" -a "${CONTENIDO3}" != "" ] ; then

f ${EXTENSION} | grep ${FILTRO} |grep ${FILTRO2} | xargs grep -l  ${CONTENIDO} {} \;  2> /dev/null | grep ${CONTENIDO2} | grep ${CONTENIDO2} ;

else

e_pmi xl6 "EXTENSION FILTRO FILTRO2 CONTENIDO CONTENIDO2 CONTENIDO3"

fi

}
