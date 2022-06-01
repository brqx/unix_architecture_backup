#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2013
#-------------------------------------------------------------------
VERSION_SCRIPT="2.3" #  Version del Script actual
FECHA_SCRIPT="Enero 2013"
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
#-- was_local_restart
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- wrestart_remote_cluster - wrestart_remote_standalone
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Reinicia el servidor cluster websphere indicado
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T was websphere cluster restart reinicio server 
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [-?]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E was_local_restart 	-- Reinicia el servidor indicado
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

was_local_restart()
{
IS_was_local_restart="Reinicia el servidor indicado sin privilegios. Para lanzarlo con root."
INFO_SCRIPT=${IS_was_local_restart}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_was_local_restart=${INFO_SCRIPT}

RUTA_SERVIDORES=${1}

SALIDA_was_local_restart=0

NOMBRE_SCRIPT_was_local_restart=was_local_restart
PARAMETROS_SCRIPT_was_local_restart="ID_WAS"

if [ "${RUTA_SERVIDORES}" == "" ] ;  then
RUTA_SERVIDORES=${RS_CONN}zservers_noproxy.dat
fi

#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${RUTA_SERVIDORES}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_was_local_restart} ${PARAMETROS_SCRIPT_was_local_restart}

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
TIMESTAMP_was_local_restart_01=${RETORNO_get_current_timestamp}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


##NUMERO_SERVIDOR=202
NUMERO_SERVIDOR=$(echo ${NOMBRE_SERVIDOR_ACTUAL} | cut -c10- )

##echo "Llamando : ${NOMBRE_SERVIDOR_ACTUAL} - ${NUMERO_SERVIDOR}"

case ${NUMERO_SERVIDOR} in
'113' )
posiciona "Frontal:${NUMERO_SERVIDOR}-Reiniciando"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
wrestart_su_local_cluster frontal6a
SALIDA_was_local_restart=${SALIDA_wrestart_su_local_cluster}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--
;;
'114' )
posiciona "Frontal:${NUMERO_SERVIDOR}-Reiniciando"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
wrestart_su_local_cluster frontal6b
SALIDA_was_local_restart=${SALIDA_wrestart_su_local_cluster}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--
;;
'200' )
posiciona "Core:${NUMERO_SERVIDOR}-Reiniciando"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
wrestart_su_local_cluster core7a
SALIDA_was_local_restart=${SALIDA_wrestart_su_local_cluster}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--
;;
'201' )
posiciona "Core:${NUMERO_SERVIDOR}-Reiniciando"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
wrestart_su_local_cluster core7b
SALIDA_was_local_restart=${SALIDA_wrestart_su_local_cluster}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--
;;
'202' )
posiciona "SOA:${NUMERO_SERVIDOR}-Reiniciando"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
wrestart_su_local_standalone soa7a
SALIDA_was_local_restart=${SALIDA_wrestart_su_local_standalone}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--
;;
'203'  )
posiciona "SOA:${NUMERO_SERVIDOR}-Reiniciando"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
wrestart_su_local_soa_cluster soa7b
SALIDA_was_local_restart=${SALIDA_wrestart_su_local_soa_cluster}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--
;;
'205' )
posiciona "Wsrr:${NUMERO_SERVIDOR}-Reiniciando"
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
wrestart_su_local_cluster wsrr
SALIDA_was_local_restart=${SALIDA_wrestart_su_local_cluster}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--
;;
'304' )
posiciona "SOA6:${NUMERO_SERVIDOR}-Reiniciando"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
wrestart_su_local_standalone soa6
SALIDA_was_local_restart=${SALIDA_wrestartsudo_local_standalone}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--
;;

esac

posiciona "Nivel H:Servidores reiniciados"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
get_current_timestamp
TIMESTAMP_was_local_restart_02=${RETORNO_get_current_timestamp}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#-Preparar la salida de la funcion

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
stamp2date ${TIMESTAMP_was_local_restart_01}
HORA_INICIAL=${RETORNO_stamp2date}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
diffstamps ${TIMESTAMP_was_local_restart_02} ${TIMESTAMP_was_local_restart_01}
TIEMPO_TARDADO_01=${RETORNO_diffstamps}
TIEMPO_TARDADO_02=$(echo ${RETORNO_difffechas} | cut -d " " -f2 )
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


if [ "${SALIDA_was_local_restart}" == "0" ] ; then
#--------========--------========--------========--------========---
#-- [2] Inicio bloque resultado actualizacion
#--------========--------========--------========--------========---

MOTIVO_FUNCION="Servidor ${NOMBRE_SERVIDOR} Reinciando Correctamente (modo paralelo)"
PARAMETROS_MOTIVO_01="Hora Comienzo    : ${HORA_INICIAL}"
PARAMETROS_MOTIVO_02="Tiempo tardado   : ${TIEMPO_TARDADO_02} - ${TIEMPO_TARDADO_01} segundos"


else
MOTIVO_FUNCION="Error al reiniciar servidor ${NOMBRE_SERVIDOR}"

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

INFO_SCRIPT=${INFO_SCRIPT_was_local_restart}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_was_local_restart}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_was_local_restart}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_was_local_restart}
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

