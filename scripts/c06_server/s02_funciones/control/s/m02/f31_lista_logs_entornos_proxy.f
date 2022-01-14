#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.1"          #  Version del Script actual
FECHA_SCRIPT="Noviembre 2012"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
LEVEL_NIVEL_05=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="funcion"
CONCEPT_ARQUETIPO_05="control"
CONCEPT_LEVEL_05="Script $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- lista_logs_proxy
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - site_access_proxy
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Lista logs de un servidor via proxy
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T busca logs servidor proxy
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P URL_LOGS [FILTRO]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E lista_logs_proxy	servidor_A	--> Lista los logs del servidor_A
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-La idea es hacer un chequeo de urls concatenando la cadenal de logs
lista_logs_proxy()
{
IS_lista_logs_proxy="Busca todos los logs en el entorno indicado via proxy"
INFO_SCRIPT=${IS_lista_logs_proxy}

URL_LOGS=$1
FILTRO=$2

if [ "${URL_LOGS}" == "" ] ; then
URL_LOGS="-?"
fi

if [ "${URL_LOGS}" == "-?" ] ;  then

e_pmt lista_logs_proxy "[contador] [maximo]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Comprobar el acceso
#-- [2] Listar los logs
#--------========--------========--------========--------========---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
site_access_proxy ${URL_LOGS}
SALIDA_lista_logs_proxy=${SALIDA_site_access_proxy}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++

PARAMETROS_MOTIVO_01="Servidor: ${URL_LOGS}"

if [ "${SALIDA_site_access_proxy}" == "0" ] ; then
#--------========--------========--------========--------========---
#----- [1] Inicio chequeo acceso al servidor
#--------========--------========--------========--------========---
MOTIVO_FUNCION="Servidor correcto"

wget -q -O pagina_brqx_borrar.html $URL

if [ "${FILTRO}" != "" ] ; then
#----------==========----------==========----------==========-------
#----- [2] Inicio chequeo filtro pasado
#--------========--------========--------========--------========---
PARAMETROS_MOTIVO_02="Filtro: ${FILTRO}"

cat pagina_brqx_borrar.html | grep href | cut -d '"' -f2- | cut -d '"' -f1 | grep ${FILTRO}

else

cat pagina_brqx_borrar.html | grep href | cut -d '"' -f2- | cut -d '"' -f1 

#----------==========----------==========----------==========-------
#----- [2] Fin chequeo filtro pasado
#--------========--------========--------========--------========---
fi

rm -f ./pagina_brqx_borrar.html

else

MOTIVO_FUNCION="Error al acceder al servidor"

#--------========--------========--------========--------========---
#----- [1] Fin chequeo acceso al servidor
#--------========--------========--------========--------========---
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_lista_logs_proxy}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_lista_logs_proxy}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_lista_logs_proxy}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_wrestart_su_remote_cluster}
#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------
fi
}

#-------------------------------------------------------------------

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
