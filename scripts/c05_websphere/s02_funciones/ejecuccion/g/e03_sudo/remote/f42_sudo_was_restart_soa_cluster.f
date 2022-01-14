#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.3" #  Version del Script actual
FECHA_SCRIPT="Mayo 2012"
STATUS_SCRIPT="all checked"
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
#-- wrestartsudo_remote_soa_cluster
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- wrunsudo_remote_cluster  wstopsudo_remote_cluster
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Reinicia el servidor cluster websphere indicado
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T was websphere cluster restart inicio server parada
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P ID_SERVER
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E wrestartsudo_remote_cluster soa7a 	-- Reinicia el cluster indicado
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

wrestartsudo_remote_soa_cluster()
{
IS_wrestartsudo_remote_soa_cluster="Reinicia un cluster SOA remoto con un solo nodo"
INFO_SCRIPT=${IS_wrestartsudo_remote_soa_cluster}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_wrestartsudo_remote_soa_cluster=${INFO_SCRIPT}

ID_WAS=${1}

SALIDA_wrestartsudo_remote_soa_cluster=0

NOMBRE_SCRIPT_wrestartsudo_remote_soa_cluster=wrestartsudo_remote_soa_cluster
PARAMETROS_SCRIPT_wrestartsudo_remote_soa_cluster="ID_WAS"


if [ "${ID_WAS}" == "" ]; then
	ID_WAS="-?"
fi  


#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${ID_WAS}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_wrestartsudo_remote_soa_cluster} ${PARAMETROS_SCRIPT_wrestartsudo_remote_soa_cluster}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Parar Cluster
#-- [2] Arrancar Cluster
#--------========--------========--------========--------========---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
wstopsudo_remote_soa_cluster  ${ID_WAS}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

SALIDA_wrestartsudo_remote_soa_cluster=${SALIDA_wstopsudo_remote_soa_cluster}

if [ "${SALIDA_wstopsudo_remote_soa_cluster}" == "0" ] ; then
#--------========--------========--------========--------========---
#----- [1] Inicio parada de Cluster
#--------========--------========--------========--------========---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
wrunsudo_remote_soa_cluster  ${ID_WAS}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

SALIDA_wrestartsudo_remote_soa_cluster=${SALIDA_wrunsudo_remote_soa_cluster}

if [ "${SALIDA_wrunsudo_remote_soa_cluster}" == "0" ] ; then
#--------========--------========--------========--------========---
#------- [2] Inicio arranque de cluster
#--------========--------========--------========--------========---

MOTIVO_FUNCION="Reinicio del cluster correcto"
PARAMETROS_MOTIVO_01="Conexion: ${USUARIO_CONEXION} ${SERVER} ${PORT}"


else
MOTIVO_FUNCION="Error al arrancar el cluster"
PARAMETROS_MOTIVO_01="Conexion: ${USUARIO_CONEXION} ${SERVER} ${PORT}"

SALIDA_wrestartsudo_remote_cluster=1
#--------========--------========--------========--------========---
#------- [2] Fin arranque de cluster
#--------========--------========--------========--------========---
fi
else
MOTIVO_FUNCION="Error al parar el cluster.Puede ser que no este iniciado."
PARAMETROS_MOTIVO_01="Conexion: ${USUARIO_CONEXION} ${SERVER} ${PORT}"

SALIDA_wrestartsudo_remote_cluster=2

#--------========--------========--------========--------========---
#----- [1] Fin parada de Cluster
#--------========--------========--------========--------========---
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_wrestartsudo_remote_soa_cluster}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_wrestartsudo_remote_soa_cluster}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_wrestartsudo_remote_soa_cluster}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_wrestartsudo_remote_soa_cluster}
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

