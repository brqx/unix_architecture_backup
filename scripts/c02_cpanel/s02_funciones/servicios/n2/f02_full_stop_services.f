#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.4" #  Version del Script actual
FECHA_SCRIPT="Octubre 2012"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="cpanel"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="servidores"
CONCEPT_VARIANTE_04=""
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- full_stop_services
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- codcat - check_service
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Parada de los servicios de un servidor de forma segura y con chequeos
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T linux stop services checking
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [-?]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E full_stop_services  	-- Inicio seguro completo del servidor
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

full_stop_services()
{
IS_full_stop_services="Para servicios del servidor de forma segura y comprobando"
INFO_SCRIPT=${IS_full_stop_services}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_full_stop_services=${INFO_SCRIPT}

FICHERO_SERVICIOS=${1}

#-Inicializamos las variables para que no falle la suma
SALIDA_full_stop_services=0
SALIDA_stop_service=0

NOMBRE_SCRIPT_full_stop_services=full_stop_services
PARAMETROS_SCRIPT_full_stop_services="[-?]"

if [ "${FICHERO_SERVICIOS}" == "" ]; then
FICHERO_SERVICIOS=${RS_SERV}zservicios_servidor_cpanel.dat
fi



#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${FICHERO_SERVICIOS}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_full_stop_services} ${PARAMETROS_SCRIPT_full_stop_services}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Identificar los servicios
#-- [2] Comprobar servicios existentes
#-- [3] Parar servicios
#--------========--------========--------========--------========---

cont_servicios=0
SALIDA_FULL_SERVICES=0

#-- Gestion Servidores Brqx - listado de servicos ordenados por parada
for linea_servicio in $(codcat ${FICHERO_SERVICIOS} | grep -v "^#" | sort -t ":" -k3 ) ; do

LINEA_FICHERO="${linea_servicio}"
dcode "${LINEA_FICHERO}"
linea_servicio_limpia=${SALIDA_DCODE}

SERVICIO=$(echo $linea_servicio_limpia | cut -d ":" -f1)
COMANDO=$(echo $linea_servicio_limpia | cut -d ":" -f5)

##echo "Comprobando servicio ${SERVICIO} - $SW_LLAMADA_DESDE_NIVEL_SUPERIOR"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
check_service ${SERVICIO}
#- En el momento en que alguno vaya mal debe indicarlo
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_check_service}" == "0" ] ; then

##echo "Parando servicio ${SERVICIO}"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
stop_service ${SERVICIO} "${COMANDO}"
#- En el momento en que alguno vaya mal debe indicarlo
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--
SALIDA_FULL_SERVICES=$( expr ${SALIDA_stop_service} + ${SALIDA_FULL_SERVICES} )
PARAMETROS_COLECCION_STOP[${cont_servicios}]="Parando ${SERVICIO} : ${SALIDA_check_service} - ${INFOSALIDA_stop_service}"
let cont_servicios++
fi

done

PARAMETROS_MOTIVO_01=${PARAMETROS_COLECCION_STOP[0]}
PARAMETROS_MOTIVO_02=${PARAMETROS_COLECCION_STOP[1]}
PARAMETROS_MOTIVO_03=${PARAMETROS_COLECCION_STOP[2]}
PARAMETROS_MOTIVO_04=${PARAMETROS_COLECCION_STOP[3]}
PARAMETROS_MOTIVO_05=${PARAMETROS_COLECCION_STOP[4]}
PARAMETROS_MOTIVO_06=${PARAMETROS_COLECCION_STOP[5]}
PARAMETROS_MOTIVO_07=${PARAMETROS_COLECCION_STOP[6]}
PARAMETROS_MOTIVO_08=${PARAMETROS_COLECCION_STOP[7]}
PARAMETROS_MOTIVO_09=${PARAMETROS_COLECCION_STOP[8]}

SALIDA_full_stop_services=${SALIDA_FULL_SERVICES}

if [ "${SALIDA_FULL_SERVICES}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [1] Inicio chequeo parada completa de servicios
#----====----====----====----====----====----====----====----====---

MOTIVO_FUNCION="Servicios parados correctamente"

else

MOTIVO_FUNCION="Error al parar servicios"

#----====----====----====----====----====----====----====----====---
#----- [1] Fin chequeo parada completa de servicios
#----====----====----====----====----====----====----====----====---
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_full_stop_services}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_full_stop_services}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_full_stop_services}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_full_stop_services}
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

