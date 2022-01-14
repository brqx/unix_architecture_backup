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
#-- snap_local_update
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - mvn_local_update_snapshot - version_local_update
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
#E snap_local_update release 11_2 -- Actualiza la librerias con la version 11_2
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

snap_local_update()
{
IS_snap_local_update="Subimos de version maven a todo arquitectura"
INFO_SCRIPT=${IS_snap_local_update}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_snap_local_update=${INFO_SCRIPT}

#-La version de las librerias es sin la v
LINK_NAME=${1}
VERSION_MAV=${2}
RUTA_DESCARGAS=${3}

SALIDA_snap_local_update=0

NOMBRE_SCRIPT_snap_local_update=snap_local_update
PARAMETROS_SCRIPT_snap_local_update="[VERSION]"


if [ "${LINK_NAME}" == "" ]; then
	LINK_NAME=lastversion
fi

if [ "${VERSION_MAV}" == "" ]; then
	VERSION_MAV=${VERSION_ARQOS_MVN_LIBS_SNAPSHOT}
fi

if [ "${RUTA_DESCARGAS}" == "" ] ;  then
RUTA_DESCARGAS=${LIBRERIAS_MAVEN}
fi

#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${VERSION_MAV}" == "-?" ]; then
## Sistema de auto documentacion de funciones
e_pmt ${NOMBRE_SCRIPT_snap_local_update} ${PARAMETROS_SCRIPT_snap_local_update}


else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Situarse en ruta
#-- [2] Descargar librerias nuevas
#-- [3] Actualizar las librerias locales
#--------========--------========--------========--------========---

AJUSTE_VERSION=$(echo ${LINK_NAME} | cut -c1 | tr '[:upper:]' '[:lower:]' )

RUTA_ACTUAL_UPD=${PWD}

#-Vamos a la ruta de descargas
cd ${RUTA_DESCARGAS}

#-Descargar ultima snapshot - va sin ajuste - snapshot_download

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
mvn_local_update_snapshot ${VERSION_MAV} 
SALIDA_snap_local_update=${SALIDA_mvn_local_update_snapshot}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


PARAMETROS_MOTIVO_01="Link Name      : ${LINK_NAME}"
PARAMETROS_MOTIVO_02="Version        : ${VERSION_MAV}"
PARAMETROS_MOTIVO_03="Ruta Descargas : ${RUTA_DESCARGAS}"

if [ "${SALIDA_mvn_local_update_snapshot}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#-- [1] Inicio bloque descarga librerias
#----====----====----====----====----====----====----====----====---

#-Actualizacion librerias locales con la nueva version de nexus
#-Esta pare no se si va con ajuste

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
version_local_update ${LINK_NAME} ${VERSION_MAV}
SALIDA_snap_local_update=${SALIDA_version_local_update}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_version_local_update}" == "0" ] ; then
#--------========--------========--------========--------========---
#-- [2] Inicio bloque actualizacion servidores
#--------========--------========--------========--------========---
MOTIVO_FUNCION="Servidor Actualizado Correctamente (modo paralelo)"

else

MOTIVO_FUNCION="No hay librerias nuevas o hay errores al descargar librerias"
#--------========--------========--------========--------========---
#-- [2] Inicio bloque actualizacion servidores
#--------========--------========--------========--------========---
fi
else

MOTIVO_FUNCION="No hay cambios en librerias o hay error al descargarlas"

#----====----====----====----====----====----====----====----====---
#-- [1] Inicio bloque descarga librerias
#----====----====----====----====----====----====----====----====---
fi
#-Vuelta a la ruta actual

cd ${RUTA_ACTUAL_UPD}

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_snap_local_update}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_snap_local_update}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_snap_local_update}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_snap_local_update}
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
