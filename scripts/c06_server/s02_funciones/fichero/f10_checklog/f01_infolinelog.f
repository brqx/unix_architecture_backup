#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - MM
# MM - Rct - 2013
#-------------------------------------------------------------------
VERSION_SCRIPT="V 0.0.1"          #  Version del Script actual
FECHA_SCRIPT="Julio 2014"
STATUS_SCRIPT="pending"
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- infolinelog
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Reporta informacion de una linea de log pasada
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T info informacion logs
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P LINEA_LOG
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E infolinelog LINEA_LOG
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 


#-Genera una app entera invocando a los scripts de mma
infolinelog()
{
IS_infolinelog="Reporta informacion de una linea de log pasada."
INFO_SCRIPT=${IS_infolinelog}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_infolinelog=${INFO_SCRIPT}

LINEA_LOG="${1}"

#-El tipo no se va a poder pasar como parametro
#WS_TYPE=${2}

SALIDA_infolinelog=0

NOMBRE_SCRIPT_infolinelog=infolinelog
PARAMETROS_SCRIPT_infolinelog="LINEA_LOG"
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_infolinelog}

if [ "${WS_TYPE}" == "" ] ;  then
WS_TYPE="APACHE"
fi

if [ "${WS_TYPE}" == "APACHE" ] ;  then
WS_TYPE_COLUMN=2
else
WS_TYPE_COLUMN=3
fi


if [ "${LINEA_LOG}" == "-?" ] ;  then
e_pmi ${NOMBRE_SCRIPT_infolinelog} ${PARAMETROS_SCRIPT_infolinelog}
#echo ${NOMBRE_SCRIPT_infolinelog} ${PARAMETROS_SCRIPT_infolinelog}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Comprobar linea pasada
#-- [2] Obtener la informacion de la linea pasada
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-Salida: 
#---===---===---===---===---===---===---===---===---===---===---===-
#-- [0] Informacion obtenida
#-- [1] No se puede obtener la informacion
#--------========--------========--------========--------========---
#-Van a llegar lineas codificadas
# 80.29.33.19_172.31.1.254_-_-_[30/Jul/2014:10:04:03_+0200]_122842_
# GET_/starnet/consultatasaciones/irListadoTasaciones.do?tipo=PA_HTTP/1.1_200_45643_
# -_Mozilla/4.0_(compatible;_MSIE_7.0;_Windows_NT_5.1;_Trident/4.0;_BTRS129851;
# _.NET_CLR_2.0.50727;_.NET_CLR_3.0.4506.2152;_.NET_CLR_3.5.30729;_InfoPath.3)

#-- Puede haber mas ips al estar activado http_X_Forward
IP_LOG=$(echo "${LINEA_LOG}" | cut -d "-" -f1 | tr "_" " " ) 
#50.7.229.130
DATETIME_LOG=$(echo "${LINEA_LOG}" | cut -d "-" -f3 | cut -d "[" -f2 | cut -d " " -f1)
#29/Jul/2014:06:56:52
#-- Sera 2 o tres dependiendo de si es IHS o APACHE
METHOD_LOG=$(echo "${LINEA_LOG}"   | cut -d "]" -f2 | cut -d " " -f${WS_TYPE_COLUMN} | cut -d '"' -f2 )
# GET
let WS_TYPE_COLUMN++
URI_LOG=$(echo "${LINEA_LOG}"		 | cut -d "]" -f2 | cut -d " " -f${WS_TYPE_COLUMN} )
#/files/images/recuerdos/brqx_mzo11bra_viva_-_brasil_-_manaos_-_zoologicos_8311243_2048x1536.jpg
let WS_TYPE_COLUMN++
HTTP_PROTOCOL=$(echo "${LINEA_LOG}"		 | cut -d "]" -f2 | cut -d " " -f${WS_TYPE_COLUMN} | cut -d '"' -f2 )

let WS_TYPE_COLUMN++
HTTP_CODE_LOG=$(echo "${LINEA_LOG}"		 | cut -d "]" -f2 | cut -d " " -f${WS_TYPE_COLUMN} )
#200
let WS_TYPE_COLUMN++ 
let WS_TYPE_COLUMN++
let WS_TYPE_COLUMN++
BROWSER_LOG=$(echo "${LINEA_LOG}"		 | cut -d "]" -f2 | cut -d " " -f${WS_TYPE_COLUMN} | cut -d '"' -f2  )
#Mozilla/5.0
let WS_TYPE_COLUMN++
SO_LOG=$(echo "${LINEA_LOG}"		 | cut -d "]" -f2 | cut -d " " -f${WS_TYPE_COLUMN}- | cut -d '"' -f1  )
#Linux; Android 4.4.2; SAMSUNG-SM-N900A Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/30.0.0.0 Mobile Safari/537.36 GSA/3.4.16.1149292.a

MOTIVO_FUNCION="Informacion procesada correctamente"
SALIDA_infolinelog=0

PARAMETROS_MOTIVO_01="IP's                 : ${IP_LOG}"
PARAMETROS_MOTIVO_02="Cadena Fecha         : ${DATETIME_LOG}"
PARAMETROS_MOTIVO_03="Metodo               : ${METHOD_LOG}"
PARAMETROS_MOTIVO_04="Uri                  : ${URI_LOG}"
PARAMETROS_MOTIVO_05="Protocolo HTTP       : ${HTTP_PROTOCOL}"
PARAMETROS_MOTIVO_05="Codigo HTTP          : ${HTTP_CODE_LOG}"
PARAMETROS_MOTIVO_06="Browser              : ${BROWSER_LOG}"
PARAMETROS_MOTIVO_07="Sistema Operativo    : ${SO_LOG}"


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_infolinelog}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_infolinelog}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_infolinelog}

e_pms 
# echo "Funcion            : ${NOMBRE_SCRIPT}"
# echo "Parametros	     : ${PARAMETROS_SCRIPT}"
# echo "Motivo Funcion     : ${MOTIVO_FUNCION}"
# echo "${PARAMETROS_MOTIVO_01}"
# echo "${PARAMETROS_MOTIVO_02}"


else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


OLDPWD=${RUTA_ACTUAL_GEND}
#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------
return ${SALIDA_infolinelog}
fi

}


