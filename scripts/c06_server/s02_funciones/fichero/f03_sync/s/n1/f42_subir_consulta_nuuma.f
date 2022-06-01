#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.3"          #  Version del Script actual
FECHA_SCRIPT="Septiembre 2012"
STATUS_SCRIPT="testing"
#-------------------------------------------------------------------
LEVEL_NIVEL=05		# Variable control profundidad alcanzada
LEVEL_NIVEL_05=05	# Variable control script
CONCEPT_FORMATO_05="script"
CONCEPT_MOLDE_05="funciones"
CONCEPT_PRODUCTO_05="server"
CONCEPT_ARQUETIPO_05="sync"
#-------------------------------------------------------------------
CONCEPT_LEVEL_05="${CONCEPT_FORMATO_05} ${CONCEPT_MOLDE_05} ${CONCEPT_ARQUETIPO_05}"
CONCEPT_LEVEL_05="${CONCEPT_LEVEL_05} ${CONCEPT_PRODUCTO_05} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- syncerase_local_to_custom
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - sync_local_path_to_server_path
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Sincroniza carpeta de un servidor a otro borrando previamente
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T sincronismo carpetas distintas servidores borrado
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P filtro [ruta_destino] [ruta_origen]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E syncerase_local_to_custom soa7a -- Sincroniza borrando soa7a ruta actual
#-------------------------------------------------------------------
#E syncerase_local_to_custom soa7a /a/b/c -- Sincroniza borrando previament en soa7a la ruta /a/b/c
#-------------------------------------------------------------------
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-==================================================================
#- La idea es auto sincronizar rutas entre servidores
#-==================================================================

#- Mini alias sylocu
subir_constulta_nuuma()
{
IS_sync_local_to_custom="Sincroniza borrando previamente una ruta con servidor destino."
INFO_SCRIPT=${IS_syncerase_local_to_custom}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_syncerase_local_to_custom=${INFO_SCRIPT}

FILTRO=${1}
RUTA_DESTINO=${2}
RUTA_ORIGEN=${3}
RUTA_SERVIDORES=${4}

SALIDA_syncerase_local_to_custom=0

NOMBRE_SCRIPT_syncerase_local_to_custom=syncerase_local_to_custom
PARAMETROS_SCRIPT_sync_local_to_custom="SERVIDOR/FILTRO [RUTA_DESTINO] [RUTA_ORIGEN]"

RUTA_ACTUAL=${PWD}

if [ "${FILTRO}" == "" ]; then
#-Podemos activar una sincronizacion por defecto
FILTRO="-?"
fi  

if [ "${RUTA_DESTINO}" == "" ]; then
RUTA_DESTINO=${RUTA_ACTUAL}
fi  

if [ "${RUTA_ORIGEN}" == "" ]; then
#- Si no indicamos origen queremos que sincronize - copie - contra la ruta actual
RUTA_ORIGEN=${RUTA_ACTUAL}
fi  

if [ "${RUTA_SERVIDORES}" == "" ] ;  then
RUTA_SERVIDORES=${RS_CONN}zservers_noproxy.dat
fi

#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${FILTRO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_syncerase_local_to_custom} ${PARAMETROS_SCRIPT_syncerase_local_to_custom}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------
#- En esta funcion queremos /a/b/c/  ---> /c/d/h
#
#- Para poder conseguirlo debemos obligar a que la ruta origen sea con barra

nombre_servidor=$(cat ${RUTA_SERVIDORES} | grep -v "^#"  | grep -v "^ " | grep "${FILTRO}" )

#- El nombre del servidor puede venir vacio. Lo indicamos. No debe hacer nada



if [ "${nombre_servidor}" == "" ] ; then
#--------========--------========--------========--------========---
#-- [2] Inicio bloque nombre servidor
#--------========--------========--------========--------========---

MOTIVO_FUNCION="Error al resolver el nombre del servidor via filtro"

PARAMETROS_MOTIVO_01="Filtro pasado    : ${FILTRO}"
PARAMETROS_MOTIVO_02="Ruta Origen      : ${RUTA_ORIGEN}"
PARAMETROS_MOTIVO_03="Ruta Destino     : ${RUTA_DESTINO}"
#PARAMETROS_MOTIVO_04="$(linea_normal)"
PARAMETROS_MOTIVO_04="Ruta Servidores  : ${RUTA_SERVIDORES}"

SALIDA_sync_local_to_custom=2
else

NOMBRE_SERVIDOR_CORTO=$(echo ${nombre_servidor} | cut -d ":" -f1)
SERVIDOR_SIN_PUERTO=$(echo ${nombre_servidor} | cut -d ":" -f2)
USUARIO_CONEXION=$(echo ${nombre_servidor} | cut -d ":" -f3)
PUERTO=$(echo ${nombre_servidor} | cut -d ":" -f4)

#-Parametros comunes
PARAMETROS_MOTIVO_01="Conexion         : ${USUARIO_CONEXION} ${SERVIDOR_SIN_PUERTO} ${PUERTO}"
PARAMETROS_MOTIVO_02="Ruta Origen      : ${RUTA_ORIGEN}"
PARAMETROS_MOTIVO_03="Ruta Destino     : ${RUTA_DESTINO}"
PARAMETROS_MOTIVO_04="Ruta Servidores  : ${RUTA_SERVIDORES}"

echo "Llamada A Correcta: ${USUARIO_CONEXION} ${SERVIDOR_SIN_PUERTO} ${PUERTO} ${RUTA_ORIGEN} ${RUTA_DESTINO}"

#- Borrado remoto


#- 3.Borramos

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
ssh_rmdir ${USUARIO_CONEXION} ${SERVIDOR_SIN_PUERTO} ${PORT} ${RUTA_DESTINO}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
sync_local_path_to_server_path ${USUARIO_CONEXION} ${SERVIDOR_SIN_PUERTO} ${PUERTO} ${RUTA_DESTINO} ${RUTA_ORIGEN}
SALIDA_sync_local_to_custom=${SALIDA_sync_local_path_to_server_path}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


if [ "${SALIDA_sync_local_path_to_server_path}" == "0" ] ; then
#-----------===========-----------===========-----------===========-
#-- [3] Inicio bloque sincronismo
#-----------===========-----------===========-----------===========-
MOTIVO_FUNCION="Ruta sincronizada correctamente"
else
MOTIVO_FUNCION="Se intenta la sincronizacion. Error al sincronizar ruta"
#-----------===========-----------===========-----------===========-
#-- [3] Fin bloque sincronismo
#-----------===========-----------===========-----------===========-
fi

#--------========--------========--------========--------========---
#-- [2] Inicio bloque nombre servidor
#--------========--------========--------========--------========---
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_syncerase_local_to_custom}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_syncerase_local_to_custom}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_syncerase_local_to_custom}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_syncerase_local_to_custom}
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
