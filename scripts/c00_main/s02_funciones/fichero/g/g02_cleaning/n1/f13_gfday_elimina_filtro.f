#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.2" #  Version del Script actual
FECHA_SCRIPT="Octubre 2012"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="fichero"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- gfday
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Elimina los archivos con informacion de fecha indicada
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T borra elimina ficheros ruta fecha
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [[FILTRO] [RUTA]]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E gfday 12 /tmp -- Vacia los ficheros que tengan un 12 en la ruta /tmp
#-------------------------------------------------------------------
#E gfday         -- Vacia los ficheros que tengan ano y mes actual en ruta actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

gfday()
{
IS_gfday="Vacia el los ficheros que contengan la cadena de fecha solicitada"
INFO_SCRIPT=${IS_gfday}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_gfday=${INFO_SCRIPT}

# Filtra por defecto por el parametro pasado por parameto
FILTRO_PASADO=$1 
RUTA_PASADA=$2

SALIDA_gfday=0

NOMBRE_SCRIPT_gfday=gfday
PARAMETROS_SCRIPT_gfday="[FILTRO] [RUTA]"

if [ "${FILTRO_PASADO}" == "" ]; then
## Activamos un filtro por defecto : YEAR-MES
MES=$(date '+%m' )
YEAR=$(date '+%Y' )
FILTRO_PASADO="${YEAR}-${MES}"
fi  

if [ "${RUTA_PASADA}" == "" ]; then
## Activamos una ruta por defecto
RUTA_PASADA="${PWD}"
fi  

if [ "${FILTRO_PASADO}" == "-?" ]; then

e_pmt ${NOMBRE_SCRIPT_gfday} ${PARAMETROS_SCRIPT_gfday}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Comprobar accesibilidad ruta
#-- [2] Comprobar permisos ficheros que cumplan filtro
#-- [3] Eliminar ficheros
#--------========--------========--------========--------========---

stat "${RUTA_PASADA}" &> /dev/null
SALIDA_stat=$?
SALIDA_gfday=${SALIDA_stat}

USUARIO_ACTUAL=$(whoami)

#-Parametros comunes
PARAMETROS_MOTIVO_01="Ruta pasada		  : ${RUTA_PASADA}"
PARAMETROS_MOTIVO_02="Filtro pasado       : ${FILTRO_PASADO}"
PARAMETROS_MOTIVO_03="Ruta actual         : ${PWD}"
PARAMETROS_MOTIVO_04="Propietario actual  : ${USUARIO_ACTUAL}"

if [ "${SALIDA_stat}" == "0" ] ; then
#--------========--------========--------========--------========---
#----- [1] Inicio comprobacion ruta
#--------========--------========--------========--------========---

# Vamos con el codigo del script

RUTA_ANTERIOR=$PWD

cd ${RUTA_PASADA}

NUM_FICHEROS=$(ls -1 | grep "${FILTRO_PASADO}" | wc -l )

if [ "${NUM_FICHEROS}" != "0" ] ; then
#---------=========---------=========---------=========---------====
#----- [2] Inicio cuenta ficheros cumplen ruta
#---------=========---------=========---------=========---------====

rm -f $( ls -1 | grep "${FILTRO_PASADO}" )
SALIDA_rm=$?
SALIDA_gfday=${SALIDA_rm}

if [ "${SALIDA_rm}" == "0" ] ; then
#----------==========----------==========----------==========-------
#----- [3] Inicio comprobacion permisos
#----------==========----------==========----------==========-------

MOTIVO_FUNCION="Ficheros que cumplen el filtro eliminados"

else

MOTIVO_FUNCION="Error de permisos"

#---------=========---------=========---------=========---------====
#----- [3] Fin comprobacion permisos
#---------=========---------=========---------=========---------====
fi
else

MOTIVO_FUNCION="No hay ficheros que cumplan el filtro"
SALIDA_gfday=2

#---------=========---------=========---------=========---------====
#----- [2] Fin cuenta ficheros cumplen ruta
#---------=========---------=========---------=========---------====
fi
else

MOTIVO_FUNCION="Ruta incorrecta"
SALIDA_gfday=3

#--------========--------========--------========--------========---
#----- [1] Fin comprobacion ruta
#--------========--------========--------========--------========---
fi

#-buscar su sitio
cd ${RUTA_ANTERIOR}


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_gfday}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_gfday}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_gfday}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_gfday}
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

