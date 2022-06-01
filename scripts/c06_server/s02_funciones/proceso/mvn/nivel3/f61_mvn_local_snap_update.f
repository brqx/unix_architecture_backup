#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2013
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.3"          #  Version del Script actual
FECHA_SCRIPT="Diciembre 2013"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="function"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- mvn_local_update_snapshot
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Actualiza una libreria/artefacto del servidor de Maven
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T obtener librerias mvn servidor maven actualizar 
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [version]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E mvn_local_update_snapshot 11_2 -- Oteniene la version 11_2 y actualiza los servidores
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Alias mvuarq
mvn_local_update_snapshot()
{
IS_mvn_local_update_snapshot="Descarga todas las librerias para la version indicada"
INFO_SCRIPT=${IS_mvn_local_update_snapshot}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_mvn_local_update_snapshot=${INFO_SCRIPT}

VERSION_MAV=${1}
RUTA_SERVIDORES=${2}

SALIDA_mvn_local_update_snapshot=0

NOMBRE_SCRIPT_mvn_local_update_snapshot=mvn_local_update_snapshot
PARAMETROS_SCRIPT_mvn_local_update_snapshot="[VERSION] [RUTA_DESCARGAS]"


if [ "${VERSION_MAV}" == "" ]; then
	VERSION_MAV=${VERSION_ARQOS_MVN_LIBS_SNAPSHOT}
fi

if [ "${RUTA_SERVIDORES}" == "" ] ;  then
RUTA_SERVIDORES=${RS_CONN}zservers_noproxy.dat
fi

if [ "${VERSION}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_mvn_local_update_snapshot} ${PARAMETROS_SCRIPT_mvn_local_update_snapshot}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Identificar el servidor
#-- [2] Descargar librerias de CORE SOA o FRONTAL en su caso
#--------========--------========--------========--------========---
#-Los links van con ajuste pero las descargas de librerias no

NOMBRE_SERVIDOR=$(uname -n |  tr '[:upper:]' '[:lower:]' )

LINEA_SERVIDOR_ACTUAL=$(cat ${RUTA_SERVIDORES} | grep -v "^#"  | grep -v "^ " | grep "${NOMBRE_SERVIDOR}" )
NOMBRE_SERVIDOR_ACTUAL=$(echo ${LINEA_SERVIDOR_ACTUAL} | cut -d ":" -f2 )

posiciona "Arquitectura:${NOMBRE_SERVIDOR}-Iniciando proceso"

if [ "${NOMBRE_SERVIDOR_ACTUAL}" != "" ] ; then
#----====----====----====----====----====----====----====----====---
#-- [1] Inicio bloque nombre servidor
#----====----====----====----====----====----====----====----====---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
get_current_timestamp
TIMESTAMP_mvn_local_update_snapshot_01=${RETORNO_get_current_timestamp}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

##NUMERO_SERVIDOR=202
NUMERO_SERVIDOR=$(echo ${NOMBRE_SERVIDOR_ACTUAL} | cut -c10- )

##echo "Llamando : ${NOMBRE_SERVIDOR_ACTUAL} - ${NUMERO_SERVIDOR}"

case ${NUMERO_SERVIDOR} in
'113' | '114' )
TIPO_SERVIDOR="Frontal"
posiciona "${TIPO_SERVIDOR}:${NUMERO_SERVIDOR}-Descargando Librerias"

echo "vamos a llamar : mvn_ufrontal_libraries_snapshot ${VERSION_MAV} "
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
mvn_ufrontal_libraries_snapshot ${VERSION_MAV} 
SALIDA_mvn_local_update_snapshot=${SALIDA_mvn_ufrontal_libraries_snapshot}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--
;;
'200' | '201' )
TIPO_SERVIDOR="Core"
posiciona "${TIPO_SERVIDOR}:${NUMERO_SERVIDOR}-Descargando Librerias"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
mvn_ucore_libraries_snapshot ${VERSION_MAV}
SALIDA_mvn_local_update_snapshot=${SALIDA_mvn_ucore_libraries_snapshot}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--
;;
'202' | '203' )
TIPO_SERVIDOR="SOA"
posiciona "${TIPO_SERVIDOR}:${NUMERO_SERVIDOR}-Descargando Librerias"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
mvn_usoa_libraries_snapshot ${VERSION_MAV}
SALIDA_mvn_local_update_snapshot=${SALIDA_mvn_usoa_libraries_snapshot}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--
;;
esac


posiciona "Nivel H:Librerias Actualizadas"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
get_current_timestamp
TIMESTAMP_02=${RETORNO_get_current_timestamp}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#-Preparar la salida de la funcion

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
stamp2date ${TIMESTAMP_mvn_local_update_snapshot_01}
HORA_INICIAL=${RETORNO_stamp2date}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
diffstamps ${TIMESTAMP_mvn_local_update_snapshot_02} ${TIMESTAMP_mvn_local_update_snapshot_01}
TIEMPO_TARDADO_01=${RETORNO_diffstamps}
TIEMPO_TARDADO_02=$(echo ${RETORNO_difffechas} | cut -d " " -f2 )
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

PARAMETROS_MOTIVO_01="Tipo de servidor : ${TIPO_SERVIDOR}"

if [ "${SALIDA_mvn_local_update_snapshot}" == "0" ] ; then
#--------========--------========--------========--------========---
#-- [2] Inicio bloque resultado actualizacion
#--------========--------========--------========--------========---

MOTIVO_FUNCION="Servidor ${NOMBRE_SERVIDOR} Reajustado Correctamente (modo paralelo)"
PARAMETROS_MOTIVO_02="Hora Comienzo    : ${HORA_INICIAL}"
PARAMETROS_MOTIVO_03="Tiempo tardado   : ${TIEMPO_TARDADO_02} - ${TIEMPO_TARDADO_01} segundos"
PARAMETROS_MOTIVO_04="Version ARQOS    : ${VERSION_MAV}"


else
MOTIVO_FUNCION="No hay librerias nuevas o hay errores al descargar librerias en servidor ${NOMBRE_SERVIDOR}"

#--------========--------========--------========--------========---
#-- [2] Fin bloque resultado actualizacion
#--------========--------========--------========--------========---
fi
else
MOTIVO_FUNCION="Servidor no se corresponde con la arquitectura"
SALIDA_mvn_local_update_snapshot=3

#----====----====----====----====----====----====----====----====---
#-- [1] Fin bloque nombre servidor
#----====----====----====----====----====----====----====----====---
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_mvn_local_update_snapshot}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_mvn_local_update_snapshot}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_mvn_local_update_snapshot}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_mvn_local_update_snapshot}
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
