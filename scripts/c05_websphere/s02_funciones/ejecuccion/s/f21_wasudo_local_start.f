#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2013
#-------------------------------------------------------------------
VERSION_SCRIPT="2.3" #  Version del Script actual
FECHA_SCRIPT="Marzo 2013"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="websphere"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="proceso"
CONCEPT_VARIANTE_04="admin"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- wasudo_local_start
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- wrun_su_pass_local_cluster - wrunsudo_local_cluster - wrunsudo_local_standalone
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Inicia el servidor cluster websphere indicado sin privilegios requeridos
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T was websphere cluster restart reinicio server
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [RUTA_SERVIDORES]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E wasudo_local_start 	-- Reinicia el servidor sin privilegios
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

wasudo_local_start()
{
IS_wasudo_local_start="Inicia el servidor indicado sin privilegios"
INFO_SCRIPT=${IS_wasudo_local_start}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_wasudo_local_start=${INFO_SCRIPT}

RUTA_SERVIDORES=${1}

SALIDA_wasudo_local_start=0

NOMBRE_SCRIPT_wasudo_local_start=wasudo_local_start
PARAMETROS_SCRIPT_wasudo_local_start="ID_WAS"

if [ "${RUTA_SERVIDORES}" == "" ] ;  then
RUTA_SERVIDORES=${RS_CONN}zservers_noproxy.dat
fi

#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${RUTA_SERVIDORES}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_wasudo_local_start} ${PARAMETROS_SCRIPT_wasudo_local_start}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Identificar servidor
#-- [2] Reiniciar servidor
#--------========--------========--------========--------========---

#-Vamos a ver la paralelizacion
#-Debemos hacerla manual porque no todo son clusters sino montariamos un array

#-Devuelve el LES000900XXX
##NOMBRE_SERVIDOR=202 #$(uname -n)
NOMBRE_SERVIDOR=$(uname -n |  tr '[:upper:]' '[:lower:]' )

LINEA_SERVIDOR_ACTUAL=$(cat ${RUTA_SERVIDORES} | grep -v "^#"  | grep -v "^ " | grep "${NOMBRE_SERVIDOR}" )
NOMBRE_SERVIDOR_ACTUAL=$(echo ${LINEA_SERVIDOR_ACTUAL} | cut -d ":" -f2  )


posiciona "Arquitectura:${NOMBRE_SERVIDOR}-Iniciando proceso"

if [ "${NOMBRE_SERVIDOR_ACTUAL}" != "" ] ; then
#----====----====----====----====----====----====----====----====---
#-- [1] Inicio bloque nombre servidor
#----====----====----====----====----====----====----====----====---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
get_current_timestamp
TIMESTAMP_wasudo_local_start_01=${RETORNO_get_current_timestamp}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


##NUMERO_SERVIDOR=202
NUMERO_SERVIDOR=$(echo ${NOMBRE_SERVIDOR_ACTUAL} | cut -c10- )

##echo "Llamando : ${NOMBRE_SERVIDOR_ACTUAL} - ${NUMERO_SERVIDOR}"

case ${NUMERO_SERVIDOR} in
'113' )
posiciona "Frontal:${NUMERO_SERVIDOR}-iniciando"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
wrun_su_pass_local_cluster frontal6a 
SALIDA_wasudo_local_start=${SALIDA_wrun_su_pass_local_cluster}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--
;;
'114' )
posiciona "Frontal:${NUMERO_SERVIDOR}-iniciando"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
wrun_su_pass_local_cluster frontal6b 
SALIDA_wasudo_local_start=${SALIDA_wrun_su_pass_local_cluster}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--
;;
'200' )
posiciona "Core:${NUMERO_SERVIDOR}-iniciando"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
wrunsudo_local_cluster core7a 
SALIDA_wasudo_local_start=${SALIDA_wrunsudo_local_cluster}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--
;;
'201' )
posiciona "Core:${NUMERO_SERVIDOR}-iniciando"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
wrunsudo_local_cluster core7b 
SALIDA_wasudo_local_start=${SALIDA_wrunsudo_local_cluster}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--
;;
'202' )
posiciona "SOA:${NUMERO_SERVIDOR}-iniciando"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
wrunsudo_local_standalone soa7a 
SALIDA_wasudo_local_start=${SALIDA_wrunsudo_local_standalone}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--
;;
'203'  )
posiciona "SOA:${NUMERO_SERVIDOR}-iniciando"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
wrunsudo_local_soa_cluster soa7b
SALIDA_wasudo_local_start=${SALIDA_wrunsudo_local_soa_cluster}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--
;;
'205' )
posiciona "Wsrr:${NUMERO_SERVIDOR}-iniciando"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
wrunsudo_local_cluster wsrr
SALIDA_wasudo_local_start=${SALIDA_wrunsudo_local_cluster}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--
;;
'304' )
posiciona "SOA:${NUMERO_SERVIDOR}-iniciando"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
wrun_su_pass_local_standalone soa6
SALIDA_wasudo_local_start=${SALIDA_wrun_su_pass_local_standalone}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--
;;

esac

posiciona "Nivel H:Servidores reiniciados"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
get_current_timestamp
TIMESTAMP_wasudo_local_start_02=${RETORNO_get_current_timestamp}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#-Preparar la salida de la funcion

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
stamp2date ${TIMESTAMP_wasudo_local_start_01}
HORA_INICIAL=${RETORNO_stamp2date}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
diffstamps ${TIMESTAMP_wasudo_local_start_02} ${TIMESTAMP_wasudo_local_start_01}
TIEMPO_TARDADO_01=${RETORNO_diffstamps}
TIEMPO_TARDADO_02=$(echo ${RETORNO_difffechas} | cut -d " " -f2 )
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


if [ "${SALIDA_wasudo_local_start}" == "0" ] ; then
#--------========--------========--------========--------========---
#-- [2] Inicio bloque resultado actualizacion
#--------========--------========--------========--------========---

MOTIVO_FUNCION="Servidor ${NOMBRE_SERVIDOR} Inciando Correctamente (modo paralelo)"
PARAMETROS_MOTIVO_01="Hora Comienzo    : ${HORA_INICIAL}"
PARAMETROS_MOTIVO_02="Tiempo tardado   : ${TIEMPO_TARDADO_02} - ${TIEMPO_TARDADO_01} segundos"


else
MOTIVO_FUNCION="Error al iniciar servidor ${NOMBRE_SERVIDOR}"

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

INFO_SCRIPT=${INFO_SCRIPT_wasudo_local_start}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_wasudo_local_start}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_wasudo_local_start}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_wasudo_local_start}
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

