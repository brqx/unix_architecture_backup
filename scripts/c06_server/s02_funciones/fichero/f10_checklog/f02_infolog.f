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
#-- infolog
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- infolinealog
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Reporta informacion de un log indicado
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T info informacion logs
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P LOG
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E infolog LOG
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 


#-Genera una app entera invocando a los scripts de mma
infolog()
{
IS_infolog="Reporta informacion del log pasada."
INFO_SCRIPT=${IS_infolog}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_infolog=${INFO_SCRIPT}

NOMBRE_LOG=${1}
DATE_LOG=${2}
LINE_LENGTH=${3}
AUX_LOG_FILE=${4}

SALIDA_infolog=0

NOMBRE_SCRIPT_infolog=infolog
PARAMETROS_SCRIPT_infolog="LINEA_LOG [DATE_LOG]"
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_infolog}

if [ "${DATE_LOG}" == "" ] ;  then
# 01/Aug/2014
DATE_LOG=$( date "+%d/%b/%Y" )
fi

if [ "${LINE_LENGTH}" == "" ] ;  then
LINE_LENGTH=70
fi

if [ "${AUX_LOG_FILE}" == "" ] ;  then
AUX_LOG_FILE=${NOMBRE_LOG}_aux
AUXFULL_LOG_FILE=${NOMBRE_LOG}_auxfull
fi


if [ "${LINEA_LOG}" == "-?" ] ;  then
e_pmi ${NOMBRE_SCRIPT_infolog} ${PARAMETROS_SCRIPT_infolog}
#echo ${NOMBRE_SCRIPT_infolog} ${PARAMETROS_SCRIPT_infolog}

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

if [ -f "${NOMBRE_LOG}" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- [1] Inicio Comprobacion fichero log existe
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--

grep ${DATE_LOG} ${NOMBRE_LOG} &> /dev/null
SALIDA_grep=$?


if [ "${SALIDA_grep}" == "0" ] ; then
#----====----====----====----====----====----====----====----====--
#-- [2] Inicio hay registros para el dia solicitado en el log
#----====----====----====----====----====----====----====----====--

#- En este caso preparamos el fichero auxiliar

> ${AUX_LOG_FILE}
> ${AUXFULL_LOG_FILE}

cat ${NOMBRE_LOG} | grep ${DATE_LOG}  > "${NOMBRE_LOG}_fix"

NOMBRE_LOG="${NOMBRE_LOG}_fix"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++

#- Esta forma no nos funciona
#-Tenemos lineas de log con arroba
#- Es muy lento si el fichero es grande

##awk 'BEGIN{FS=""}{ 
##  for(i=1;i<=NF;i++){ print "do something with "$i }
##}' file



while read linea_bucle ; do

infolinelog "${linea_bucle}"

URI_SHORTED=$( echo "${URI_LOG}" | cut -c1-${LINE_LENGTH} )
echo "${HTTP_CODE_LOG}:${DATETIME_LOG}:${URI_SHORTED}" >> ${AUX_LOG_FILE}

#-Preparamos la decodificacion con caracter especial
echo "${HTTP_CODE_LOG}:${DATETIME_LOG}:${URI_LOG}" >> ${AUXFULL_LOG_FILE}

#IP_LOG
#DATETIME_LOG
#METHOD_LOG
#URI_LOG
#HTTP_PROTOCOL
#HTTP_CODE_LOG
#BROWSER_LOG
#SO_LOG

done < "${NOMBRE_LOG}"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

MOTIVO_FUNCION="Informacion procesada correctamente"
SALIDA_infolog=0

#- Pensemos.... que necesito del log
#-- Se ejecutara cada dia, por tanto el filtro sera de ese dia

#-- Ya tenemos el fichero

#- Numero de accesos
#- Numero de accesos correctos.
#- Numero de URIS unicas accedidas

COUNT_ACCESS=$( cat ${AUX_LOG_FILE} | wc -l )
COUNT_EDITS=$( cat ${AUX_LOG_FILE} | grep "edit" | wc -l )
COUNT_OK_200=$( cat ${AUX_LOG_FILE} | grep "^200" | wc -l )

COUNT_FULL_URIS=$( cat ${AUXFULL_LOG_FILE} | wc -l )


PARAMETROS_MOTIVO_01="Log analizado         : ${NOMBRE_LOG}"
PARAMETROS_MOTIVO_02="Fecha Filtro          : ${DATE_LOG}"
PARAMETROS_MOTIVO_03="Longitud Filtro Linea : ${LINE_LENGTH}"
PARAMETROS_MOTIVO_04="Accesos Totales       : ${COUNT_ACCESS}"
PARAMETROS_MOTIVO_05="Cargas correctas (200): ${COUNT_OK_200}"
PARAMETROS_MOTIVO_06="Cambios en sites      : ${COUNT_EDITS}"
PARAMETROS_MOTIVO_07="Uris Consultadas      : ${COUNT_FULL_URIS}"


else

MOTIVO_FUNCION="No hay lineas que correspondan con el filtro del log ni con la fecha actual"
SALIDA_infolog=2

PARAMETROS_MOTIVO_01="Nombre log           : ${NOMBRE_LOG}"


#----====----====----====----====----====----====----====----====--
#-- [2] Fin hay registros para el dia solicitado en el log
#----====----====----====----====----====----====----====----====--
fi
else

MOTIVO_FUNCION="El fichero log no existe"
SALIDA_infolog=1

PARAMETROS_MOTIVO_01="Nombre log           : ${NOMBRE_LOG}"

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
#-- [1] Inicio Comprobacion fichero log existe
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--
fi



if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_infolog}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_infolog}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_infolog}

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
return ${SALIDA_infolog}
fi

}


