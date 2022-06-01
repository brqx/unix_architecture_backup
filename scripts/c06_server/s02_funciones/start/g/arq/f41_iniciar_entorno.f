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
#-- iniciar_entorno
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- wrestart_remote_cluster - wrestart_remote_standalone
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Inicia el servidor cluster websphere indicado sin privilegios requeridos
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T inicio servidor
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [RUTA SERVICIOS]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E iniciar_entorno 	-- Inicia el servidor sin privilegios
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

iniciar_entorno()
{
IS_iniciar_entorno="Inicia el servidor indicado sin privilegios"
INFO_SCRIPT=${IS_iniciar_entorno}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_iniciar_entorno=${INFO_SCRIPT}

RUTA_SERVICIOS=${1}

SALIDA_iniciar_entorno=0

NOMBRE_SCRIPT_iniciar_entorno=iniciar_entorno
PARAMETROS_SCRIPT_iniciar_entorno="[RUTA SERVICIOS]"

if [ "${RUTA_SERVICIOS}" == "" ] ;  then
RUTA_SERVIDORES=${RS_SERV}zservicios_servidor_was.dat
fi

#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${RUTA_SERVICIOS}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_iniciar_entorno} ${PARAMETROS_SCRIPT_iniciar_entorno}

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

posiciona "Arquitectura:${NOMBRE_SERVIDOR}-Iniciando proceso"

if [ "${NOMBRE_SERVIDOR_ACTUAL}" != "" ] ; then
#----====----====----====----====----====----====----====----====---
#-- [1] Inicio bloque nombre servidor
#----====----====----====----====----====----====----====----====---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
get_current_timestamp
TIMESTAMP_iniciar_entorno_01=${RETORNO_get_current_timestamp}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


##NUMERO_SERVIDOR=202
NUMERO_SERVIDOR=$(echo ${NOMBRE_SERVIDOR_ACTUAL} | cut -c10- )

##echo "Llamando : ${NOMBRE_SERVIDOR_ACTUAL} - ${NUMERO_SERVIDOR}"



case ${NUMERO_SERVIDOR} in
'was' )
posiciona "${NOMBRE_SERVIDOR}:${NUMERO_SERVIDOR}-iniciando"
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
was_local_start
SALIDA_iniciar_entorno=${SALIDA_was_local_start}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--
;;
'apache' )
posiciona "${NOMBRE_SERVIDOR}:${NUMERO_SERVIDOR}-iniciando"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
apache_local_start
SALIDA_iniciar_entorno=${SALIDA_apache_local_start}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--
;;
'oracle' )
posiciona "Core:${NUMERO_SERVIDOR}-iniciando"
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
oracle_local_start
SALIDA_iniciar_entorno=${SALIDA_oracle_local_start}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--
;;
esac



posiciona "Nivel H:Servidores reiniciados"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
get_current_timestamp
TIMESTAMP_iniciar_entorno_02=${RETORNO_get_current_timestamp}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#-Preparar la salida de la funcion

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
stamp2date ${TIMESTAMP_iniciar_entorno_01}
HORA_INICIAL=${RETORNO_stamp2date}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
diffstamps ${TIMESTAMP_iniciar_entorno_02} ${TIMESTAMP_iniciar_entorno_01}
TIEMPO_TARDADO_01=${RETORNO_diffstamps}
TIEMPO_TARDADO_02=$(echo ${RETORNO_difffechas} | cut -d " " -f2 )
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


if [ "${SALIDA_iniciar_entorno}" == "0" ] ; then
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

INFO_SCRIPT=${INFO_SCRIPT_iniciar_entorno}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_iniciar_entorno}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_iniciar_entorno}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_iniciar_entorno}
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

