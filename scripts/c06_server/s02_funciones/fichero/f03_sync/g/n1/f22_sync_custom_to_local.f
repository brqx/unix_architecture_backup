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
#-- sync_custom_to_local
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - sync_server_path_to_local_path
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Sincroniza carpeta de un servidor a otro
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T sincronismo carpetas distintas servidores
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [usuario] [servidor] [puerto] fichero
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E sync_custom_to_local soa7a -- Sincroniza contra soa7a la ruta actual
#-------------------------------------------------------------------
#E sync_custom_to_local soa7a /a/b/c -- Sincroniza de soa7a en la ruta /a/b/c
#-------------------------------------------------------------------
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-==================================================================
#- La idea es auto sincronizar rutas entre servidores
#-==================================================================

#- Mini alias syculo
sync_custom_to_local()
{
IS_sync_custom_to_local="Sincroniza -copiando- una ruta del servidor destino en la ruta local"
INFO_SCRIPT=${IS_sync_custom_to_local}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_sync_custom_to_local=${INFO_SCRIPT}

FILTRO=${1}
RUTA_DESTINO=${2}
RUTA_ORIGEN=${3}
RUTA_SERVIDORES=${4}

SALIDA_sync_custom_to_local=0

NOMBRE_SCRIPT_sync_custom_to_local=sync_custom_to_local
PARAMETROS_SCRIPT_sync_custom_to_local="SERVIDOR/FILTRO [RUTA_DESTINO] [RUTA_ORIGEN]"

RUTA_ACTUAL=${PWD}

if [ "${FILTRO}" == "" ]; then
#-Podemos activar una sincronizacion por defecto
FILTRO="-?"
fi  

if [ "${RUTA_DESTINO}" == "" ]; then
RUTA_DESTINO=${RUTA_ACTUAL}
fi  

if [ "${RUTA_ORIGEN}" == "" ]; then
RUTA_ORIGEN=${RUTA_DESTINO}
fi  

if [ "${RUTA_SERVIDORES}" == "" ] ;  then
RUTA_SERVIDORES=${RS_CONN}zservers_noproxy.dat
fi

#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${FILTRO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_sync_custom_to_local} ${PARAMETROS_SCRIPT_sync_custom_to_local}

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

SALIDA_sync_custom_to_local=2
else

NOMBRE_SERVIDOR_CORTO=$(echo ${nombre_servidor} | cut -d ":" -f1)
SERVIDOR_SIN_PUERTO=$(echo ${nombre_servidor} | cut -d ":" -f2)
USUARIO_CONEXION=$(echo ${nombre_servidor} | cut -d ":" -f3)
PUERTO=$(echo ${nombre_servidor} | cut -d ":" -f4)

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
sync_server_path_to_local_path ${USUARIO_CONEXION} ${SERVIDOR_SIN_PUERTO} ${PUERTO} ${RUTA_DESTINO} ${RUTA_ORIGEN}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

SALIDA_sync_custom_to_local=${SALIDA_sync_server_path_to_local_path}

#-Parametros comunes
PARAMETROS_MOTIVO_01="Conexion    : ${USUARIO_CONEXION} ${SERVIDOR_SIN_PUERTO} ${PUERTO}"
PARAMETROS_MOTIVO_02="Ruta Origen : ${RUTA_ORIGEN}"
PARAMETROS_MOTIVO_03="Ruta Destino: ${RUTA_DESTINO}"

if [ "${SALIDA_sync_server_path_to_local_path}" == "0" ] ; then
#-----------===========-----------===========-----------===========-
#-- [3] Inicio bloque sincronismo
#-----------===========-----------===========-----------===========-
MOTIVO_FUNCION="Ruta sincronizada correctamente"
else
MOTIVO_FUNCION="Error al sincronizar ruta"
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

INFO_SCRIPT=${INFO_SCRIPT_sync_custom_to_local}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_sync_custom_to_local}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_sync_custom_to_local}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_sync_custom_to_local}
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
