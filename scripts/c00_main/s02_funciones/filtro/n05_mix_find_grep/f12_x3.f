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
#-- x3 - xl3
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
#T filtrado extension filtro contenido tres
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P FUNCION
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E x3 java captura a  -- Devuelve las lineas de ficheros java que contienen captura
#-------------------------------------------------------------------
#E xl3 java captura a -- Devuelve los ficheros java que contienen captura
#-==================================================================


x3()
{
IS_x3="Funciona similar a f3 pero en lugar de sacar los archivos, lista su contenido"
INFO_SCRIPT=${IS_x3}


EXTENSION=$1 ;
FILTRO=$2    ;
CONTENIDO=$3   ;

if [ "${EXTENSION}" != "" -a "${FILTRO}" != "" -a "${CONTENIDO}" != "" ] ; then

f ${EXTENSION} | grep ${FILTRO} | xargs grep ${CONTENIDO} {} \;  2> /dev/null   ;

else

e_pmi x3 "EXTENSION FILTRO CONTENIDO"

fi

}

#-------------------------------------------------------------------

xl3()
{
IS_xl3="Funciona igual que f3 pero con xargs. Obtiene los ficheros"
INFO_SCRIPT=${IS_xl3}


EXTENSION=$1 ;
FILTRO=$2    ;
CONTENIDO=$3   ;

if [ "${EXTENSION}" != "" -a "${FILTRO}" != "" -a "${CONTENIDO}" != "" ] ; then

f ${EXTENSION} | grep ${FILTRO} | xargs grep -l  ${CONTENIDO} {} \;  2> /dev/null   ;

else

e_pmi xl3 "EXTENSION FILTRO CONTENIDO"

fi

}
