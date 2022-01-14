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

wcosym_parallel_restart()
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

ID_SERVER_01=frontal6a
ID_SERVER_02=frontal6b
ID_SERVER_03=core7a
ID_SERVER_04=core7b
ID_SERVER_05=soa7a
ID_SERVER_06=soa7b


let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
get_current_timestamp
TIMESTAMP_01_wcosym_parallel_restart=${RETORNO_get_current_timestamp}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


#-- Frontal 6a

posiciona "Nivel A:${ID_SERVER_01}-Re-Iniciando"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
wrestart_su_remote_cluster  ${ID_SERVER_01} &
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#-- Frontal 6b

posiciona "Nivel B:${ID_SERVER_02}-Re-Iniciando"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
wrestart_su_remote_cluster  ${ID_SERVER_02} &
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#-- Core 7a

posiciona "Nivel C:${ID_SERVER_03}-Re-Iniciando"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
wrestartsudo_remote_cluster  ${ID_SERVER_03} &
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#-- Core 7b

posiciona "Nivel D:${ID_SERVER_04}-Re-Iniciando"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
wrestartsudo_remote_cluster  ${ID_SERVER_04} &
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#-- Soa 7a

posiciona "Nivel E:${ID_SERVER_05}-Re-Iniciando"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
wrestartsudo_remote_standalone  ${ID_SERVER_05} &
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#-- Soa 7b

posiciona "Nivel F:${ID_SERVER_06}-Re-Iniciando"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
wrestartsudo_remote_soa_cluster  ${ID_SERVER_06} &
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

LISTA_JOBS=6

while [ $LISTA_JOBS -ne 0 ]; do

LISTA_JOBS=$(jobs -l | wc -l )
sleep 10
posiciona "Nivel X:Jobs actuales : ${LISTA_JOBS} servidor/es reiniciandose"
done

posiciona "Nivel H:Servidores Re-Iniciados"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
get_current_timestamp
TIMESTAMP_02_wcosym_parallel_restart=${RETORNO_get_current_timestamp}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#-Preparar la salida de la funcion

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
stamp2date ${TIMESTAMP_01_wcosym_parallel_restart}
HORA_INICIAL_wcosym_parallel_restart=${RETORNO_stamp2date}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
diffstamps ${TIMESTAMP_02_wcosym_parallel_restart} ${TIMESTAMP_01_wcosym_parallel_restart}
TIEMPO_TARDADO_01_wcosym_parallel_restart=${RETORNO_diffstamps}
TIEMPO_TARDADO_02_wcosym_parallel_restart=$(echo ${RETORNO_difffechas} | cut -d " " -f2 )
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

MOTIVO_FUNCION="Entorno Cosym re-iniciado correctamente (modo paralelo)"
PARAMETROS_MOTIVO_01="Hora Comienzo : ${HORA_INICIAL_wcosym_parallel_restart}"
PARAMETROS_MOTIVO_02="Tiempo tardado: ${TIEMPO_TARDADO_02_wcosym_parallel_restart} - ${TIEMPO_TARDADO_01_wcosym_parallel_restart} segundos"

#-Al lanzarlos en background igual no tenemos la salida
SALIDA_wcosym_parallel_restart=${SALIDA_wstop_remote_cluster}


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

