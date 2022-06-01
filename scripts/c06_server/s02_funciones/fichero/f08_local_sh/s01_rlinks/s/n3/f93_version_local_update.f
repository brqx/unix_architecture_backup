#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2013
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.2"          #  Version del Script actual
FECHA_SCRIPT="Enero 2013"
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
#-- version_local_update
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- cp_path_to_mavlocal_frontal - cp_path_to_mavlocal_soa - cp_path_to_mavlocal_core 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Actualiza la libreria en el servidor local
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T actualizar libreria servidor loacal
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [LINK_NAME] [VERSION]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E version_local_update 11_2 -- Actualiza la librerias con la version 11_2
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

version_local_update()
{
IS_version_local_update="Subimos de version maven al servidor indicado"
INFO_SCRIPT=${IS_version_local_update}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_version_local_update=${INFO_SCRIPT}

LINK_NAME=${1}
VERSION_MAV=${2}
RUTA_SERVIDORES=${3}

SALIDA_version_local_update=0

NOMBRE_SCRIPT_version_local_update=version_local_update
PARAMETROS_SCRIPT_version_local_update="[LINK_NAME] [VERSION]"

if [ "${LINK_NAME}" == "" ]; then
	LINK_NAME=lastversion
fi

if [ "${VERSION_MAV}" == "" ]; then
	VERSION_MAV=${VERSION_ARQOS}
fi

if [ "${RUTA_SERVIDORES}" == "" ] ;  then
RUTA_SERVIDORES=${RS_CONN}zservers_noproxy.dat
fi

#-Esta parte no encaja
if [ "${RUTA_DESCARGAS}" == "" ] ;  then
RUTA_DESCARGAS=${LIBRERIAS_MAVEN}
fi


#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${LINK_NAME}" == "-?" ]; then
## Sistema de auto documentacion de funciones
e_pmt ${NOMBRE_SCRIPT_version_local_update} ${PARAMETROS_SCRIPT_version_local_update}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Identificar el servidor
#-- [2] Instalar y asociar librerias de CORE SOA o FRONTAL en su caso
#--------========--------========--------========--------========---

#-Debe averiguar el servidor y en funcion a ello actualizar. Vamos a jugar para que tenga el ubuntu

AJUSTE_VERSION=$(echo ${LINK_NAME} | cut -c1 | tr '[:upper:]' '[:lower:]' )

VERSION_AJUSTADA=${AJUSTE_VERSION}${VERSION_MAV}

#-Devuelve el LES000900XXX
##NOMBRE_SERVIDOR=202 #$(uname -n)
NOMBRE_SERVIDOR=$(uname -n |  tr '[:upper:]' '[:lower:]' )

LINEA_SERVIDOR_ACTUAL=$(cat ${RUTA_SERVIDORES} | grep -v "^#"  | grep -v "^ " | grep "${NOMBRE_SERVIDOR}" )
NOMBRE_SERVIDOR_ACTUAL=$(echo ${LINEA_SERVIDOR_ACTUAL} | cut -d ":" -f2  )


posiciona "Arquitectura:${NOMBRE_SERVIDOR}-Iniciando proceso"

if [ "${NOMBRE_SERVIDOR_ACTUAL}" != "" ] ; then
#----====----====----====----====----====----====----====----====---
#-- [1] Inicio bloque nombre servidor
#----====----====----====----====----====----====----====----====---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
get_current_timestamp
TIMESTAMP_version_local_update_01=${RETORNO_get_current_timestamp}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


##NUMERO_SERVIDOR=202
NUMERO_SERVIDOR=$(echo ${NOMBRE_SERVIDOR_ACTUAL} | cut -c10- )

##echo "Llamando : ${NOMBRE_SERVIDOR_ACTUAL} - ${NUMERO_SERVIDOR}"

case ${NUMERO_SERVIDOR} in
'113' | '114' )
posiciona "Frontal:${NUMERO_SERVIDOR}-Asociando Librerias"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
cp_path_to_mavlocal_frontal ${LINK_NAME} ${VERSION_AJUSTADA}
SALIDA_version_local_update=${SALIDA_cp_path_to_mavlocal_frontal}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--
;;
'200' | '201' )
posiciona "Core:${NUMERO_SERVIDOR}-Asociando Librerias"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
cp_path_to_mavlocal_core ${LINK_NAME} ${VERSION_AJUSTADA}
SALIDA_version_local_update=${SALIDA_cp_path_to_mavlocal_core}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--
;;
'202' | '203' )
posiciona "SOA:${NUMERO_SERVIDOR}-Asociando Librerias"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
cp_path_to_mavlocal_soa ${LINK_NAME} ${VERSION_AJUSTADA}
SALIDA_version_local_update=${SALIDA_cp_path_to_mavlocal_soa}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--
;;
esac


posiciona "Nivel H:Librerias Actualizadas"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
get_current_timestamp
TIMESTAMP_version_local_update_02=${RETORNO_get_current_timestamp}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#-Preparar la salida de la funcion

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
stamp2date ${TIMESTAMP_version_local_update_01}
HORA_INICIAL=${RETORNO_stamp2date}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
diffstamps ${TIMESTAMP_version_local_update_02} ${TIMESTAMP_version_local_update_01}
TIEMPO_TARDADO_01=${RETORNO_diffstamps}
TIEMPO_TARDADO_02=$(echo ${RETORNO_difffechas} | cut -d " " -f2 )
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_version_local_update}" == "0" ] ; then
#--------========--------========--------========--------========---
#-- [2] Inicio bloque resultado actualizacion
#--------========--------========--------========--------========---

MOTIVO_FUNCION="Servidor ${NOMBRE_SERVIDOR} Reajustado Correctamente (modo paralelo)"
PARAMETROS_MOTIVO_01="Hora Comienzo    : ${HORA_INICIAL}"
PARAMETROS_MOTIVO_02="Tiempo tardado   : ${TIEMPO_TARDADO_02} - ${TIEMPO_TARDADO_01} segundos"
PARAMETROS_MOTIVO_03="Version ARQOS    : ${VERSION_MAV}"
PARAMETROS_MOTIVO_04="Link actualizado : ${LINK_NAME}"


else
MOTIVO_FUNCION="Error al actualizar servidor ${NOMBRE_SERVIDOR}"

#--------========--------========--------========--------========---
#-- [2] Fin bloque resultado actualizacion
#--------========--------========--------========--------========---
fi

else
MOTIVO_FUNCION="Servidor no se corresponde con la arquitectura"
SALIDA_version_local_update=3

#----====----====----====----====----====----====----====----====---
#-- [1] Fin bloque nombre servidor
#----====----====----====----====----====----====----====----====---
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_version_local_update}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_version_local_update}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_version_local_update}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_version_local_update}
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
