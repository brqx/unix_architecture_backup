#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.3" #  Version del Script actual
FECHA_SCRIPT="Junio 2012"
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
#-- wcosym_parallel_restart
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- wrestart_remote_cluster - wrestart_remote_standalone
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
#P [-?]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E wcosym_parallel_restart		-- Reinicia el cluster indicado
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

wcosym_parallel_restart_prueba_parallel()
{
IS_wcosym_parallel_restart="Reinicia un cluster remoto con un solo nodo"
INFO_SCRIPT=${IS_wcosym_parallel_restart}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_wcosym_parallel_restart=${INFO_SCRIPT}

ID_WAS=${1}

SALIDA_wcosym_parallel_restart=0

NOMBRE_SCRIPT_wcosym_parallel_restart=wcosym_parallel_restart
PARAMETROS_SCRIPT_wcosym_parallel_restart="ID_WAS"


#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${ID_WAS}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_wcosym_parallel_restart} ${PARAMETROS_SCRIPT_wcosym_parallel_restart}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Reiniciar CORE
#-- [2] Reiniciar SOA
#-- [3] Reiniciar FRONTAL
#--------========--------========--------========--------========---

#-Vamos a ver la paralelizacion
#-Debemos hacerla manual porque no todo son clusters sino montariamos un array

ID_SERVER_01=frontal6b
ID_SERVER_02=core7b
ID_SERVER_03=core7a


let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
get_current_timestamp
TIMESTAMP_wcosym_parallel_restart_prueba_parallel_01=${RETORNO_get_current_timestamp}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

posiciona "Nivel A:${ID_SERVER_02}-${ID_SERVER_01}-Re-Iniciando Paralelo"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
FICHERO_SERVIDORES=./parallel_servx.dat

> ${FICHERO_SERVIDORES}
echo "wrestart_su_remote_cluster  ${ID_SERVER_01}" >>  ${FICHERO_SERVIDORES}
echo "wrestartsudo_remote_cluster  ${ID_SERVER_02}  " >>  ${FICHERO_SERVIDORES}

echo $FICHERO_SERVIDORES | parallel

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

posiciona "Nivel C:Servidores Iniciados"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
get_current_timestamp
TIMESTAMP_wcosym_parallel_restart_prueba_parallel_02=${RETORNO_get_current_timestamp}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#-Preparar la salida de la funcion

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
stamp2date ${TIMESTAMP_01}
HORA_INICIAL=${RETORNO_stamp2date}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
diffstamps ${TIMESTAMP_wcosym_parallel_restart_prueba_parallel_02} ${TIMESTAMP_wcosym_parallel_restart_prueba_parallel_01}
TIEMPO_TARDADO_01=${RETORNO_diffstamps}
TIEMPO_TARDADO_02=$(echo ${RETORNO_difffechas} | cut -d " " -f2 )
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

MOTIVO_FUNCION="Entorno Cosym re-iniciado correctamente (modo secuencial)"
PARAMETROS_MOTIVO_01="Hora Comienzo : ${HORA_INICIAL}"
PARAMETROS_MOTIVO_02="Tiempo tardado: ${TIEMPO_TARDADO_02} - ${TIEMPO_TARDADO_01} segundos"

#-Al lanzarlos en background igual no tenemos la salida
SALIDA_wcosym_restart=${SALIDA_wstop_remote_cluster}


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_wcosym_parallel_restart}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_wcosym_parallel_restart}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_wcosym_parallel_restart}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_wcosym_parallel_restart}
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

