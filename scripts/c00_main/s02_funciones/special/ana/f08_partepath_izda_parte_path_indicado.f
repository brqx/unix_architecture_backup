#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.3" #  Version del Script actual
FECHA_SCRIPT="Julio 2012"
STATUS_SCRIPT="checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="special"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#L-- partepath_izda
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- cleanpath
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Devuelve una ruta completa basandose en una ruta base de entrada
#-------------------------------------------------------------------
#+ Sistema de meta tags: 
#-------------------------------------------------------------------
#T generar ruta completa full path
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [palabra_de_la_ruta]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E partepath_dcha /a/c/d /d   -- Devuelve la parte /a/c
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

## - Elimina la doble barra de un path pasado

#-La idea es tenere un dirname mas potente
partepath_izda()
{
IS_partepath_izda="Parte el path indicado en razon a la parte pedida por la izquierda"
INFO_SCRIPT=${IS_partepath_izda}

RUTA_COMPLETA=${1}
PARTE_PASADA=${2}

if [ "${RUTA_COMPLETA}" == "" ] ; then
RUTA_COMPLETA="-?"
fi

if [ "${PARTE_PASADA}" == "" ] ; then
#-En caso de que no se indique se utilizara el home
PARTE_COMPLETA=${PWD} 
fi

if [ "${RUTA_COMPLETA}" == "-?" ] ;  then

e_pmt partepath_dcha "PATH PASADO"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

##Ruta completa : /home/ricabel/Videos/aaa_video
##Parte         : /home
##Resultado     : ricabel/Videos/aaa_video

#-Luego nos centraremos en quitar el home

##cleanpath "${RUTA_FINAL}"
##RUTA_FINAL=${SALIDA_cleanpath}


LONGITUD_RUTA_COMPLETA=$( echo ${RUTA_COMPLETA} | wc -c)
LONGITUD_RAIZ_SIN_BARRA=$( expr ${LONGITUD_RUTA_COMPLETA} - 1 )

LONGITUD_PARTE=$( echo ${PARTE_PASADA} |  wc -c )

LONGITUD_PEDIDA=$( expr ${LONGITUD_RUTA_COMPLETA} - ${LONGITUD_PARTE} )

SALIDA_partepath_izda=$( echo ${RUTA_COMPLETA} | cut -c${LONGITUD_PARTE}- )

#-Hay que asegurarse que la cadena esta contenida

let LONGITUD_PARTE--

INICIO_PARTE_COMPLETA=$( echo ${RUTA_COMPLETA} | cut -c1-${LONGITUD_PARTE} )

## echo "La salida es : ${SALIDA_partepath_izda} "
## echo "La parte pasada es : ${PARTE_PASADA}    "
## echo "La parte izda es   : ${INICIO_PARTE_COMPLETA}    "

if [ "${INICIO_PARTE_COMPLETA}" == "${PARTE_PASADA}" ] ; then
echo "Salida: ${SALIDA_partepath_izda} "
return 0
else
echo "Error : ${INICIO_PARTE_COMPLETA} != ${PARTE_PASADA} "
return 1
fi

#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------
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
