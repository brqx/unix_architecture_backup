#!/bin/bash
##-------------------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Farmacia Zaragoza
# Brqx Org - Scriptin Unix - AGILE ARQ - Rct - 2016
#--------------------------------------------------------------------------------
VERSION_SCRIPT="0.1.0" #  Version del Script actual
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
#+ Funciones / Variables definidas / Profundidad : [Depth : (00) ] 
#--------------------------------------------------------------------------------
#-- surl
#--------------------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#--------------------------------------------------------------------------------
#-- 
#--------------------------------------------------------------------------------
#+ Informacion : 
#--------------------------------------------------------------------------------
#I Obtiene los datos de un site drupal
#--------------------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#--------------------------------------------------------------------------------
#T get drupal site data settings
#--------------------------------------------------------------------------------
#+ Parametros : 
#--------------------------------------------------------------------------------
#P 
#--------------------------------------------------------------------------------
#+ Ejemplo : 
#--------------------------------------------------------------------------------
#E surl				-- Obtiene los datos de un site drupal
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
surl()
{
VER="0.1.0"					;QP="Brqx Agile Architecture 2016"

surl_OUT=0
surl_MSG=""
surl_ERR=""

surl_FUN="surl"
surl_NFO="Crea un Virtual server Nginx Subdomain [$VER]($DEP) @${QP}"
surl_FMT="surl LINE "
surl_EXA="surl LINE "


if [ "${1}" == "-?"  ] ; then
#==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- CABECERA MENSAJE COMPLETA
#--------------------------------------------------------------------------------
header_full "${surl_NFO}" "${surl_FMT}" "${surl_EXA}"
#--------------------------------------------------------------------------------
else

RUTA_ACTUAL=${PWD}
ENFOQUE_DEFECTO=test
SITUACION=OK

# Lo primero que hay que ver es que se lanze o no desde el home o desde una 
# ruta de subdominio

#- no se pasa cuenta, debemos entender que estamos en la ruta del portal
INICIO_RUTA=${RUTA_ACTUAL}/sites/default/
RUTA_PORTAL=${RUTA_ACTUAL}

SETTINGS_FILE=${INICIO_RUTA}settings.php

if [ -f "${SETTINGS_FILE}" ] ; then
#--STA_IF_[01] - [Existe fichero de configuracion] ------------------------------

#-1.Comprobar version de drupal

IS_DRUPAL_50=$(cat ${SETTINGS_FILE} | grep "[d|p|n]50" | wc -l )
IS_DRUPAL_70=$(cat ${SETTINGS_FILE} | grep "[d|p|n]70" | wc -l )
IS_DRUPAL_80=$(cat ${SETTINGS_FILE} | grep "[d|p|n]80" | wc -l )

if [ "${IS_DRUPAL_50}"  == "1" ] ; then
drupal_version="50"
base_datos=$(   cat ${SETTINGS_FILE}	| grep db_url   | cut -d "=" -f2 | cut -d "/" -f4 | cut -d "'" -f1               	)
url_pedida=$(   cat ${SETTINGS_FILE}	| grep base_url | cut -d "=" -f2 | cut -d ":" -f2 | cut -d "'" -f1  | cut -c3-   	)
elif [ "${IS_DRUPAL_70}" == "1" ] ; then
drupal_version="70"

base_datos=$(   cat ${SETTINGS_FILE}	| grep "[p|d]70"   | cut -d "'" -f4												 	)
url_pedida=$(   cat ${SETTINGS_FILE}	| grep "base_url"  | cut -d "'" -f2  											 	)

elif [ "${IS_DRUPAL_80}" == "1" ] ; then
drupal_version="80"

base_datos=$(   cat ${SETTINGS_FILE}	| grep "[p|d]80"   | cut -d "'" -f4												 	)
url_pedida=$(   cat ${SETTINGS_FILE}	| grep "base_url"  | cut -d "'" -f4 | cut -d "/" -f1-3 								)
else

surl_COD=10
surl_EER="#-Error en la configuracion del drupal:${SETTINGS_FILE} ##"

surl_OUT=$(expr  ${surl_OUT} + ${surl_COD})
surl_ERR="${surl_ERR}${surl_EER}"

fi

if [ "${surl_OUT}" == "0" ] ; then
#--STA_IF_[02] - [Cofiguracion adaptada a la version de manera correcta ] -------

NEWPAG="#$(linea_multi_caracter 34 --= )"
INIPAG="#$(linea_normal  102 )"

prtyline_set_args_len 60 7 3 40 40 

#                      01            02       03     04           05   
prtyline_set_line "  Drupal Path" " VER "   " "    "URL"       "BBDD"      		     
HEAD_LINE="${prtyline_set_line_OUT}"

#                      01                    02               03          04            05           
prtyline_set_line "${RUTA_PORTAL}" "[ ${drupal_version} ]"   ":"    "${url_pedida}"  "${base_datos}"  
CONTENT_LINE="${prtyline_set_line_OUT}"

echo "#$(linea_multi_caracter 34 --= )"										  	
echo "#${HEAD_LINE}																"
echo "#$(linea_normal  102 )													"
echo "#${CONTENT_LINE}															"
echo "#$(linea_multi_caracter 34 --= )"										  	

#--END_IF_[02] - [Cofiguracion adaptada a la version de manera correcta ] -------
fi


if [  "${surl_OUT}" != "0" ] ; then
surl_ERR="#+${surl_FUN}::##${surl_ERR}"
footer_error "${surl_ERR}"
fi


#--END_IF_[01] - [Existe fichero de configuracion] ------------------------------
fi

#--[FIN FUNCION]
fi
}