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
#-- reiniciar_servicios
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- iniciar_servicios - parar_servicios - reiniciar_servicios
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
#E reiniciar_servicios 	-- Inicia el servidor sin privilegios
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

reiniciar_servicios()
{
IS_reiniciar_servicios="Reinicia los servicios en el servidor indicado sin privilegios"
INFO_SCRIPT=${IS_reiniciar_servicios}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_reiniciar_servicios=${INFO_SCRIPT}

RUTA_SERVICIOS=${1}
RUTA_SERVIDORES=${2}

SALIDA_reiniciar_servicios=0

NOMBRE_SCRIPT_reiniciar_servicios=reiniciar_servicios
PARAMETROS_SCRIPT_reiniciar_servicios="[RUTA SERVICIOS]"

if [ "${RUTA_SERVICIOS}" == "" ] ;  then
RUTA_SERVICIOS=${RS_SERV}zservicios_servidor_was.dat
fi

if [ "${RUTA_SERVIDORES}" == "" ] ;  then
RUTA_SERVIDORES=${RS_CONN}zservers_noproxy.dat
fi

#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${RUTA_SERVICIOS}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_reiniciar_servicios} ${PARAMETROS_SCRIPT_reiniciar_servicios}

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

posiciona "Arquitectura:${NOMBRE_SERVIDOR}-Re-Iniciando proceso"

if [ "${NOMBRE_SERVIDOR_ACTUAL}" != "" ] ; then
#----====----====----====----====----====----====----====----====---
#-- [1] Inicio bloque nombre servidor
#----====----====----====----====----====----====----====----====---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
get_current_timestamp
TIMESTAMP_reiniciar_servicios_01=${RETORNO_get_current_timestamp}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

##NUMERO_SERVIDOR=202
NUMERO_SERVIDOR=$(echo ${NOMBRE_SERVIDOR_ACTUAL} | cut -c10- )

##echo "Llamando : ${NOMBRE_SERVIDOR_ACTUAL} - ${NUMERO_SERVIDOR}"

PARAMETROS_MOTIVO_01=${NOMBRE_SERVIDOR_ACTUAL}
PARAMETROS_MOTIVO_02=${RUTA_SERVICIOS}
PARAMETROS_MOTIVO_03=${RUTA_SERVIDORES}

posiciona "Nivel A:Parando Servicios ${NOMBRE_SERVIDOR_ACTUAL}"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
parar_servicios ${RUTA_SERVICIOS} ${RUTA_SERVIDORES}
SALIDA_reiniciar_servicios=${SALIDA_parar_servicios}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_parar_servicios}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [2] Inicio parar servicios
#----====----====----====----====----====----====----====----====---

posiciona "Nivel B:Iniciando Servicios ${NOMBRE_SERVIDOR_ACTUAL}"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++

##echo "Llamando iniciar_servicios ${RUTA_SERVICIOS} ${RUTA_SERVIDORES}"
iniciar_servicios ${RUTA_SERVICIOS} ${RUTA_SERVIDORES}
SALIDA_reiniciar_servicios=${SALIDA_iniciar_servicios}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_iniciar_servicios}" == "0" ] ; then
#------======------======------======------======------======------=
#----- [3] Inicio iniciar servicios
#------======------======------======------======------======------=

MOTIVO_FUNCION="Servicios re-iniciados correctamente"

else

MOTIVO_FUNCION="Error al iniciar servicios"
SALIDA_reiniciar_servicios=1

#------======------======------======------======------======------=
#----- [3] Fin iniciar servicios
#------======------======------======------======------======------=
fi
else

MOTIVO_FUNCION="Error al parar servicios"
SALIDA_reiniciar_servicios=2

#----====----====----====----====----====----====----====----====---
#----- [2] Inicio parar servicios
#----====----====----====----====----====----====----====----====---
fi

posiciona "Nivel Z:Servicios re-iniciados en servidor "

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
get_current_timestamp
TIMESTAMP_reiniciar_servicios_02=${RETORNO_get_current_timestamp}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#-Preparar la salida de la funcion

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
stamp2date ${TIMESTAMP_reiniciar_servicios_01}
HORA_INICIAL=${RETORNO_stamp2date}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
diffstamps ${TIMESTAMP_reiniciar_servicios_02} ${TIMESTAMP_reiniciar_servicios_01}
TIEMPO_TARDADO_01=${RETORNO_diffstamps}
TIEMPO_TARDADO_02=$(echo ${RETORNO_difffechas} | cut -d " " -f2 )
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

MOTIVO_FUNCION="Servidor re-iniciado correctamente"
PARAMETROS_MOTIVO_01=${NOMBRE_SERVIDOR_ACTUAL}
PARAMETROS_MOTIVO_02=${RUTA_SERVICIOS}
PARAMETROS_MOTIVO_03=${RUTA_SERVIDORES}

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

INFO_SCRIPT=${INFO_SCRIPT_reiniciar_servicios}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_reiniciar_servicios}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_reiniciar_servicios}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_reiniciar_servicios}
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

