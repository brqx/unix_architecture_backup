#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.2"          #  Version del Script actual
FECHA_SCRIPT="Junio 2012"
STATUS_SCRIPT="checking"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="alias"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Script ${CONCEPT_MOLDE_05} ${CONCEPT_ARQUETIPO_05} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- release_update
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - cf_path_to_arqfull_core7a
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Actualiza la libreria en el servidor remoto
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T actualizar libreria ssh servidor remoto
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [version]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E subir_version_maven 11_2 -- Actualiza la librerias con la version 11_2
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-- Igual hay que preparar dos subidas una que indique que la version es snapshot
#- Posible alias arqupd
release_update()
{
IS_subir_version_maven="Subimos de version maven a todo arquitectura"
INFO_SCRIPT=${IS_subir_version_maven}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_subir_version_maven=${INFO_SCRIPT}

VERSION_MAV=${1}

SALIDA_subir_version_maven=0

NOMBRE_SCRIPT_subir_version_maven=subir_version_maven
PARAMETROS_SCRIPT_subir_version_maven="[VERSION]"


if [ "${VERSION}" == "" ]; then
	VERSION_MAV=${VERSION_ARQOS}
fi

#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${VERSION_MAV}" == "-?" ]; then
## Sistema de auto documentacion de funciones
e_pmt ${NOMBRE_SCRIPT_subir_version_maven} ${PARAMETROS_SCRIPT_subir_version_maven}


else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Instalar y asociar librerias CORE
#-- [2] Instalar y asociar librerias SOA
#-- [3] Instalar y asociar librerias FRONTAL
#--------========--------========--------========--------========---

ID_SERVER_01=core7a
ID_SERVER_02=core7b
ID_SERVER_03=frontal6a
ID_SERVER_04=frontal6b
ID_SERVER_05=soa7a
ID_SERVER_06=soa7b

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
get_current_timestamp
TIMESTAMP_release_update_01=${RETORNO_get_current_timestamp}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#-- Core 7a

posiciona "Nivel A:${ID_SERVER_01}-Asociando Librerias"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
cf_path_to_mavglobal_core7a ${VERSION_MAV} &
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#-- Core 7b

posiciona "Nivel B:${ID_SERVER_02}-Asociando Librerias"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
cf_path_to_mavglobal_core7b ${VERSION_MAV} &
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#-- Core 7b

posiciona "Nivel C:${ID_SERVER_03}-Asociando Librerias"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
cf_path_to_mavglobal_frontal6a ${VERSION_MAV} &
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#-- Frontal 6a

posiciona "Nivel D:${ID_SERVER_04}-Asociando Librerias"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
cf_path_to_mavglobal_frontal6b ${VERSION_MAV} &
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#-- Frontal 6a

posiciona "Nivel E:${ID_SERVER_05}-Asociando Librerias"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
cf_path_to_mavglobal_soa7a ${VERSION_MAV} &
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#-- Frontal 6a

posiciona "Nivel F:${ID_SERVER_06}-Asociando Librerias"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
cf_path_to_mavglobal_soa7b ${VERSION_MAV} &
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

LISTA_JOBS=6

while [ $LISTA_JOBS -ne 0 ]; do

LISTA_JOBS=$(jobs -l | wc -l )
sleep 10
posiciona "Nivel X:Jobs actuales : ${LISTA_JOBS} librerias en servidor/es reajustandose"
done

posiciona "Nivel H:Librerias Actualizadas"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
get_current_timestamp
TIMESTAMP_release_update_02=${RETORNO_get_current_timestamp}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#-Preparar la salida de la funcion

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
stamp2date ${TIMESTAMP_release_update_01}
HORA_INICIAL=${RETORNO_stamp2date}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
diffstamps ${TIMESTAMP_release_update_02} ${TIMESTAMP_release_update_01}
TIEMPO_TARDADO_01=${RETORNO_diffstamps}
TIEMPO_TARDADO_02=$(echo ${RETORNO_difffechas} | cut -d " " -f2 )
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

MOTIVO_FUNCION="Entorno Cosym Reajustado Correctamente (modo paralelo)"
PARAMETROS_MOTIVO_01="Hora Comienzo : ${HORA_INICIAL}"
PARAMETROS_MOTIVO_02="Tiempo tardado: ${TIEMPO_TARDADO_02} - ${TIEMPO_TARDADO_01} segundos"
PARAMETROS_MOTIVO_03="Version ARQOS : ${VERSION_MAV}"

#-Al lanzarlos en background igual no tenemos la salida
SALIDA_wcosym_restart=${SALIDA_wstop_remote_cluster}


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_subir_version_maven}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_subir_version_maven}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_subir_version_maven}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_subir_version_maven}
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
