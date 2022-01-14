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
#-- x2 - xl2
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
#T filtrado extension filtro contenido
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P EXTENSION CONTENIDO
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E x2 java captura -- Devuelve las lineas de ficheros java que contienen captura
#-------------------------------------------------------------------
#E xl2 java captura -- Devuelve los ficheros java que contienen captura
#-==================================================================

x2()
{
IS_x2="Funciona similar a f2 pero en lugar de sacar los archivos, lista su contenido"
INFO_SCRIPT=${IS_x2}

EXTENSION=$1 ;
CONTENIDO=$2    ;

if [ "${EXTENSION}" != "" -a "${CONTENIDO}" != "" ] ; then

f ${EXTENSION} | xargs grep ${CONTENIDO}  2> /dev/null   ;

else

e_pmi x2 "EXTENSION CONTENIDO"

fi

}

#-------------------------------------------------------------------


xl2()
{
IS_xl2="Funciona igual que f2 pero con xargs. Obtiene los ficheros"
INFO_SCRIPT=${IS_xl2}

EXTENSION=$1 ;
CONTENIDO=$2    ;

if [ "${EXTENSION}" != "" -a "${CONTENIDO}" != "" ] ; then


f ${EXTENSION} | xargs grep -l  ${CONTENIDO}  2> /dev/null   ;

else

e_pmi xl2 "EXTENSION CONTENIDO"

fi

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
