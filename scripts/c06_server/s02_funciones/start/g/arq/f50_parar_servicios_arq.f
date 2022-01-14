#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2013
#-------------------------------------------------------------------
VERSION_SCRIPT="2.3" #  Version del Script actual
FECHA_SCRIPT="Febrero 2013"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="server"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="start"
CONCEPT_VARIANTE_04="general"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- parar_servicios
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- was_local_stop - apache_local_stop - oracle_local_stop
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Inicia el servicios en servidor cluster websphere oracle indicado sin privilegios requeridos
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T inicio servicios servidor was oracle apache
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [RUTA SERVICIOS]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E parar_servicios 	-- Detiene el servidor sin privilegios
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

parar_servicios()
{
IS_parar_servicios="Detiene los servicios en el servidor indicado sin privilegios"
INFO_SCRIPT=${IS_parar_servicios}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_parar_servicios=${INFO_SCRIPT}

RUTA_SERVICIOS=${1}
RUTA_SERVIDORES=${2}

SALIDA_parar_servicios=0

NOMBRE_SCRIPT_parar_servicios=parar_servicios
PARAMETROS_SCRIPT_parar_servicios="[RUTA SERVICIOS]"

if [ "${RUTA_SERVICIOS}" == "" ] ;  then
RUTA_SERVICIOS=${RS_SERV}zservicios_servidor_was.dat
fi

if [ "${RUTA_SERVIDORES}" == "" ] ;  then
RUTA_SERVIDORES=${RS_CONN}zservers_noproxy.dat
fi

#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${RUTA_SERVICIOS}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_parar_servicios} ${PARAMETROS_SCRIPT_parar_servicios}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Identificar servidor
#-- [2] Identificar servicios del servidor
#-- [3] Iniciar servicios del servidor
#--------========--------========--------========--------========---

#-Vamos a ver la paralelizacion
#-Debemos hacerla manual porque no todo son clusters sino montariamos un array

#-Devuelve el LES000900XXX
NOMBRE_SERVIDOR=$(uname -n |  tr '[:upper:]' '[:lower:]' )

LINEA_SERVIDOR_ACTUAL=$(cat ${RUTA_SERVIDORES} | grep -v "^#"  | grep -v "^ " | grep "${NOMBRE_SERVIDOR}" )

NOMBRE_SERVIDOR_ACTUAL=$(echo ${LINEA_SERVIDOR_ACTUAL} | cut -d ":" -f2  )

posiciona "Arquitectura:${NOMBRE_SERVIDOR}-Parando servicios"

if [ "${NOMBRE_SERVIDOR_ACTUAL}" != "" ] ; then
#----====----====----====----====----====----====----====----====---
#-- [1] Inicio bloque nombre servidor
#----====----====----====----====----====----====----====----====---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
get_current_timestamp
TIMESTAMP_parar_servicios_01=${RETORNO_get_current_timestamp}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

##NUMERO_SERVIDOR=202
NUMERO_SERVIDOR=$(echo ${NOMBRE_SERVIDOR_ACTUAL} | cut -c10- )

##echo "Llamando : ${NOMBRE_SERVIDOR_ACTUAL} - ${NUMERO_SERVIDOR}"

cont_servicios=0
SALIDA_FULL_SERVICES=0

#-- Gestion Servidores Brqx - listado de servicos ordenados por parada
for linea_servicio in $(codcat ${RUTA_SERVICIOS} | grep -v "^#" | sort -t ":" -k4 ) ; do

LINEA_FICHERO="${linea_servicio}"
dcode "${LINEA_FICHERO}"
linea_servicio_limpia=${SALIDA_DCODE}

SERVICIO=$(echo $linea_servicio_limpia | cut -d ":" -f1)
PROCESO=$(echo $linea_servicio_limpia | cut -d ":" -f2)
COMANDO=$(echo $linea_servicio_limpia | cut -d ":" -f6)

##echo "Llamando Servicio : ${SERVICIO} - Proceso:  ${PROCESO} - Comando : ${COMANDO}"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
check_service_arq ${PROCESO}
#- En el momento en que alguno vaya mal debe indicarlo
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_check_service_arq}" == "0" ] ; then
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
##echo "Parando servicio ${SERVICIO} : ${PROCESO} -1- ${COMANDO}"

##echo "Stop Servicio : ${SERVICIO} - Proceso:  ${PROCESO} - Comando : ${COMANDO}"

stop_service_arq ${SERVICIO} ${PROCESO} "${COMANDO}"
#- En el momento en que alguno vaya mal debe indicarlo
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--
##echo "Sssalida ---- ${SERVICIO} :: ${SALIDA_check_service} - ${SALIDA_start_service}"
SALIDA_FULL_SERVICES=$( expr ${SALIDA_stop_service_arq} + ${SALIDA_FULL_SERVICES} )
PARAMETROS_COLECCION_STOP[${cont_servicios}]="Parando ${SERVICIO} : ${SALIDA_check_service} - ${INFOSALIDA_start_service}"
let cont_servicios++
fi

done

##echo "Salida Full: ${SALIDA_FULL_SERVICES}"

PARAMETROS_MOTIVO_01=${PARAMETROS_COLECCION_STOP[0]}
PARAMETROS_MOTIVO_02=${PARAMETROS_COLECCION_STOP[1]}
PARAMETROS_MOTIVO_03=${PARAMETROS_COLECCION_STOP[2]}
PARAMETROS_MOTIVO_04=${PARAMETROS_COLECCION_STOP[3]}
PARAMETROS_MOTIVO_05=${PARAMETROS_COLECCION_STOP[4]}
PARAMETROS_MOTIVO_06=${PARAMETROS_COLECCION_STOP[5]}
PARAMETROS_MOTIVO_07=${PARAMETROS_COLECCION_STOP[6]}
PARAMETROS_MOTIVO_08=${PARAMETROS_COLECCION_STOP[7]}
PARAMETROS_MOTIVO_09=${PARAMETROS_COLECCION_STOP[8]}


if [ "${SALIDA_FULL_SERVICES}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [1] Inicio chequeo inicio completo de servicios
#----====----====----====----====----====----====----====----====---

MOTIVO_FUNCION="${SALIDA_FULL_SERVICES} servicios parados correctamente"
SALIDA_parar_servicios=0
else

MOTIVO_FUNCION="Error al parar algun servivio. Fallo al parar ${SALIDA_FULL_SERVICES} servicio/s"
SALIDA_parar_servicios=1
#----====----====----====----====----====----====----====----====---
#----- [1] Fin chequeo inicio completo de servicios
#----====----====----====----====----====----====----====----====---
fi

posiciona "Nivel H:Servidores parados"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
get_current_timestamp
TIMESTAMP_parar_servicios_02=${RETORNO_get_current_timestamp}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#-Preparar la salida de la funcion

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
stamp2date ${TIMESTAMP_parar_servicios_01}
HORA_INICIAL=${RETORNO_stamp2date}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
diffstamps ${TIMESTAMP_parar_servicios_02} ${TIMESTAMP_parar_servicios_01}
TIEMPO_TARDADO_01=${RETORNO_diffstamps}
TIEMPO_TARDADO_02=$(echo ${RETORNO_difffechas} | cut -d " " -f2 )
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


if [ "${SALIDA_parar_servicios}" == "0" ] ; then
#--------========--------========--------========--------========---
#-- [2] Inicio bloque resultado actualizacion
#--------========--------========--------========--------========---

MOTIVO_FUNCION="Servicios en Servidor ${NOMBRE_SERVIDOR} Parados Correctamente"
PARAMETROS_MOTIVO_01="Hora Comienzo    : ${HORA_INICIAL}"
PARAMETROS_MOTIVO_02="Tiempo tardado   : ${TIEMPO_TARDADO_02} - ${TIEMPO_TARDADO_01} segundos"


else
MOTIVO_FUNCION="Error al parar servicios en servidor ${NOMBRE_SERVIDOR}"

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

INFO_SCRIPT=${INFO_SCRIPT_parar_servicios}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_parar_servicios}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_parar_servicios}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_parar_servicios}
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

