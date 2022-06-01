#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="2.3" #  Version del Script actual
FECHA_SCRIPT="Septiembre 2012"
STATUS_SCRIPT="testing"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="websphere"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="proceso"
CONCEPT_VARIANTE_04="admin"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- wsadmin_run_jacl
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Lanza el wsadmin del websphere indicado
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T wsadmin scripts was websphere config server
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E wsr scrip.jacl	-- Lanza el script indicado
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Mini alias wsr
#- Alias wsjacl
wsadmin_run_jacl()
{
IS_wsadmin_run_jacl="Saca las variables definidas en la celda"
INFO_SCRIPT=${IS_wsadmin_run_jacl}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_wsadmin_run_jacl=${INFO_SCRIPT}

ARCHIVO_JACL=$1
RUTA_VARIABLES=$2

SALIDA_wsadmin_run_jacl=0

NOMBRE_SCRIPT_wsadmin_run_jacl=wsadmin_run_jacl
PARAMETROS_SCRIPT_wsadmin_run_jacl="ARCHIVO_JACL [RUTA_WAS]"

if [ "${ARCHIVO_JACL}" == "" ]; then
ARCHIVO_JACL="-?"
fi  

if [ "${RUTA_VARIABLES}" == "" ] ; then
#- Solo se ha pasado un parametro
RUTA_VARIABLES=${WPS_PD}bin/
fi

#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${FILTRO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_wsadmin_run_jacl} ${PARAMETROS_SCRIPT_wsadmin_run_jacl}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#- Lanzamos la aplicacion
${RUTA_VARIABLES}wsadmin.sh -f ${ARCHIVO_JACL}


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_wsadmin_run_jacl}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_wsadmin_run_jacl}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_wsadmin_run_jacl}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_wsadmin_run_jacl}
#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------
fi

}


