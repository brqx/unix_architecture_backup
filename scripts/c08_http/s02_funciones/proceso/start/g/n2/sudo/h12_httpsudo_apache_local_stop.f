#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2013
#-------------------------------------------------------------------
VERSION_SCRIPT="2.6" #  Version del Script actual
FECHA_SCRIPT="Marzo 2013"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="cpanel"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="servicios"
CONCEPT_VARIANTE_04=""
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- apachesudo_local_stop
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- codcat
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Inicia un servicio
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T start inicio servicio
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P SERVICIO
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E apachesudo_local_stop s1 	-- Inicia el servicio indicado
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

apachesudo_local_stop()
{
IS_apachesudo_local_stop="Detiene el servidor web apache"
INFO_SCRIPT=${IS_apachesudo_local_stop}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_apachesudo_local_stop=${INFO_SCRIPT}

RUTA_SERVIDORES=${1}

SALIDA_apachesudo_local_stop=0

#-Se trata de un texto de informacion a devolver al llamante
INFOSALIDA_apachesudo_local_stop=""

NOMBRE_SCRIPT_apachesudo_local_stop=apachesudo_local_stop
PARAMETROS_SCRIPT_apachesudo_local_stop="[-?]"

if [ "${RUTA_SERVIDORES}" == "" ] ;  then
RUTA_SERVIDORES=${RS_CONN}zservers_noproxy.dat
fi

#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${RUTA_SERVIDORES}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_apachesudo_local_stop} ${PARAMETROS_SCRIPT_apachesudo_local_stop}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Identificar servidor
#-- [2] Reparar servidor
#--------========--------========--------========--------========---

#-Vamos a ver la paralelizacion
#-Debemos hacerla manual porque no todo son clusters sino montariamos un array

#-Devuelve el LES000900XXX
##NOMBRE_SERVIDOR=202 #$(uname -n)
NOMBRE_SERVIDOR=$(uname -n |  tr '[:upper:]' '[:lower:]' )

LINEA_SERVIDOR_ACTUAL=$(cat ${RUTA_SERVIDORES} | grep -v "^#"  | grep -v "^ " | grep "${NOMBRE_SERVIDOR}" )
NOMBRE_SERVIDOR_ACTUAL=$(echo ${LINEA_SERVIDOR_ACTUAL} | cut -d ":" -f2  )


posiciona "Arquitectura:${NOMBRE_SERVIDOR}-Deteniendo proceso"

if [ "${NOMBRE_SERVIDOR_ACTUAL}" != "" ] ; then
#----====----====----====----====----====----====----====----====---
#-- [1] Inicio bloque nombre servidor
#----====----====----====----====----====----====----====----====---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
get_current_timestamp
TIMESTAMP_apachesudo_local_stop_01=${RETORNO_get_current_timestamp}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


##NUMERO_SERVIDOR=202
NUMERO_SERVIDOR=$(echo ${NOMBRE_SERVIDOR_ACTUAL} | cut -c10- )

##echo "Llamando : ${NOMBRE_SERVIDOR_ACTUAL} - ${NUMERO_SERVIDOR}"

case ${NUMERO_SERVIDOR} in
'113' )
posiciona "Frontal:${NUMERO_SERVIDOR}-Deteniendo"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
http_su_pass_stop_apache frontal6a
SALIDA_apachesudo_local_stop=${SALIDA_http_su_pass_stop_apache}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--
;;
'114' )
posiciona "Frontal:${NUMERO_SERVIDOR}-Deteniendo"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
http_su_pass_stop_apache frontal6b
SALIDA_apachesudo_local_stop=${SALIDA_http_su_pass_stop_apache}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--
;;
'200' )
posiciona "Core:${NUMERO_SERVIDOR}-Deteniendo"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
httpsudo_stop_apache
SALIDA_apachesudo_local_stop=${SALIDA_httpsudo_stop_apache}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--
;;
'201' )
posiciona "Core:${NUMERO_SERVIDOR}-Deteniendo"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
httpsudo_stop_apache
SALIDA_apachesudo_local_stop=${SALIDA_httpsudo_stop_apache}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--
;;
'202' )
posiciona "SOA:${NUMERO_SERVIDOR}-Deteniendo"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
httpsudo_stop_apache
SALIDA_apachesudo_local_stop=${SALIDA_httpsudo_stop_apache}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--
;;
'203'  )
posiciona "SOA:${NUMERO_SERVIDOR}-Deteniendo"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
httpsudo_stop_apache
SALIDA_apachesudo_local_stop=${SALIDA_httpsudo_stop_apache}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--
;;
'205' )
posiciona "Wsrr:${NUMERO_SERVIDOR}-Deteniendo"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
httpsudo_stop_apache
SALIDA_apachesudo_local_stop=${SALIDA_httpsudo_stop_apache}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--
;;
'304' )
posiciona "SOA:${NUMERO_SERVIDOR}-Deteniendo"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
http_su_pass_stop_apache soa6
SALIDA_apachesudo_local_stop=${SALIDA_http_su_pass_stop_apache}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--
;;

esac


posiciona "Nivel E:Apaches parados"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
get_current_timestamp
TIMESTAMP_apachesudo_local_stop_02=${RETORNO_get_current_timestamp}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#-Preparar la salida de la funcion

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
stamp2date ${TIMESTAMP_apachesudo_local_stop_01}
HORA_INICIAL=${RETORNO_stamp2date}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
diffstamps ${TIMESTAMP_apachesudo_local_stop_02} ${TIMESTAMP_apachesudo_local_stop_01}
TIEMPO_TARDADO_01=${RETORNO_diffstamps}
TIEMPO_TARDADO_02=$(echo ${RETORNO_difffechas} | cut -d " " -f2 )
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


if [ "${SALIDA_apachesudo_local_stop}" == "0" ] ; then
#--------========--------========--------========--------========---
#-- [2] Inicio bloque resultado actualizacion
#--------========--------========--------========--------========---

MOTIVO_FUNCION="Servidor ${NOMBRE_SERVIDOR} Parando Correctamente (modo secuencial)"
PARAMETROS_MOTIVO_01="Hora Comienzo    : ${HORA_INICIAL}"
PARAMETROS_MOTIVO_02="Tiempo tardado   : ${TIEMPO_TARDADO_02} - ${TIEMPO_TARDADO_01} segundos"


else
MOTIVO_FUNCION="Error al parar servidor ${NOMBRE_SERVIDOR}"

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

INFO_SCRIPT=${INFO_SCRIPT_apachesudo_local_stop}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_apachesudo_local_stop}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_apachesudo_local_stop}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
INFOSALIDA_apachesudo_local_stop=${MOTIVO_FUNCION}
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_apachesudo_local_stop}
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

