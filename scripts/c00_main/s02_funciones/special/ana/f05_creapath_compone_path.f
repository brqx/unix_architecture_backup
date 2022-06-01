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
#L-- creapath
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
#E creapath /a/c /pepito/menganito   -- Devuelve la ruta /pepito/menganito/a/c
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

## - Elimina la doble barra de un path pasado

creapath()
{
IS_creapath="Devuelve la ruta completa basandose en una ruta base"
INFO_SCRIPT=${IS_creapath}

PATH_PASADO=${1}
RUTA_BASE=${2}

if [ "${PATH_PASADO}" == "" ] ; then
PATH_PASADO="-?"
fi


if [ "${RUTA_BASE}" == "" ] ; then
#-En caso de que no se indique se utilizara el home
RUTA_BASE="${HOME}"
fi


if [ "${PATH_PASADO}" == "-?" ] ;  then

e_pmt creapath "PATH PASADO"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#-Primero debemos saber si la ruta existe, pero claro antes hay qu componerla
#-El home es sin barra

LONGITUD_RAIZ=$( echo ${RUTA_BASE} | wc -c)
LONGITUD_RAIZ_SIN_BARRA=$( expr $LONGITUD_RAIZ - 1 )

#-Hacemos dos partes de la supuesta ruta
RUTA_RAIZ=$( echo ${PATH_PASADO} | cut -c1-${LONGITUD_RAIZ_SIN_BARRA} )
RUTA_SIN_RAIZ=$( echo ${PATH_PASADO} | cut -c${LONGITUD_RAIZ}- )

if [ "${RUTA_RAIZ}" == "${RUTA_BASE}" ] ; then
#-La ruta contiene el home
## echo "La ruta contiene el home"
RUTA_FINAL=${PATH_PASADO}
else
#-En este caso tenemos que componerla y ver si existe
## echo "La ruta no contiene el home"
RUTA_FINAL=${RUTA_BASE}/${PATH_PASADO}
fi

cleanpath "${RUTA_FINAL}"
RUTA_FINAL=${SALIDA_cleanpath}

#-Segunda iteracion
cleanpath "${RUTA_FINAL}"
RUTA_FINAL=${SALIDA_cleanpath}

#-En principio aqui termina la funcion

SALIDA_creapath=${RUTA_FINAL}

echo "Salida: ${SALIDA_creapath} "

#-Efectos laterales

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
