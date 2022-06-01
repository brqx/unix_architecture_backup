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
#-- show_logs_arquitectura_proxy
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - lista_logs_arquitectura_proxy
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
#E show_logs_arquitectura_proxy	servidor_A	--> Lista los logs del servidor_A
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-Busca en los logs filtrados la cadena y te muestra las lineas
show_logs_arquitectura_proxy()
{
IS_show_logs_arquitectura_proxy="Busca todos los logs en el entorno indicado via proxy"
INFO_SCRIPT=${IS_show_logs_arquitectura_proxy}

URL_LOGS=$1
FICHERO_LOG_EXACTO=$2
CADENA_FICHERO=$3

FILTRO=${FICHERO_LOG_EXACTO}

if [ "${URL_LOGS}" == "" ] ; then
URL_LOGS="-?"
fi

if [ "${URL_LOGS}" == "-?" ] ;  then

e_pmt show_logs_arquitectura_proxy "[contador] [maximo]"

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
lista_logs_proxy ${URL_LOGS} ${FILTRO} &> /dev/null
SALIDA_show_logs_arquitectura_proxy=${SALIDA_lista_logs_proxy}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++

PARAMETROS_MOTIVO_01="Servidor: ${URL_LOGS}"

if [ "${SALIDA_lista_logs_proxy}" == "0" ] ; then
#--------========--------========--------========--------========---
#----- [1] Inicio chequeo acceso al servidor
#--------========--------========--------========--------========---

SALIDA_FICHERO_LOG=$(lista_logs_proxy ${URL_LOGS} ${FILTRO} | grep "${FICHERO_LOG_EXACTO}$" | tail -1)
FICHERO_LOG=$(basename ${SALIDA_FICHERO_LOG} )
URL_LOG_FINAL=${URL_LOGS}/${FICHERO_LOG}

wget -q  ${URL_LOG_FINAL}
SALIDA_wget=$?

#-Sacamos el numero de linea del fichero
cat  ${FICHERO_LOG} | grep -n ${CADENA_FICHERO} > PANTALLA_show_logs_arquitectura_proxy.dat

rm -f ${FICHERO_LOG}

MOTIVO_FUNCION="Servidor correcto"

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

INFO_SCRIPT=${INFO_SCRIPT_show_logs_arquitectura_proxy}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_show_logs_arquitectura_proxy}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_show_logs_arquitectura_proxy}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_show_logs_arquitectura_proxy}
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
