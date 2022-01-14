#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.4" #  Version del Script actual
FECHA_SCRIPT="Noviembre 2012"
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
#-- full_ckrun_services
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- codcat - check_service
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Comprobacion arranque correcto servicios
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T checking test start check services
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [FICHERO_SERVICIOS]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E full_ckrun_services  	-- Comprobacion arranque correcto servicios
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

full_ckrun_services()
{
IS_full_ckrun_services="Comprobacion de arranque servicios del servidor de forma correcta"
INFO_SCRIPT=${IS_full_ckrun_services}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_full_ckrun_services=${INFO_SCRIPT}

FICHERO_SERVICIOS=${1}

#-Inicializamos las variables para que no falle la suma
SALIDA_full_ckrun_services=0
SALIDA_start_service=0

NOMBRE_SCRIPT_full_ckrun_services=full_ckrun_services
PARAMETROS_SCRIPT_full_ckrun_services="[FICHERO_SERVICIOS]"

if [ "${FICHERO_SERVICIOS}" == "" ]; then
FICHERO_SERVICIOS=${RS_SERV}zservicios_servidor_cpanel.dat
fi



#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${FICHERO_SERVICIOS}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_full_ckrun_services} ${PARAMETROS_SCRIPT_full_ckrun_services}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Identificar los servicios
#-- [2] Comprobar servicios arrancados
#-- [3] Recopilar informacion servicios
#--------========--------========--------========--------========---

cont_servicios=0
SALIDA_FULL_SERVICES=0

#-- Gestion Servidores Brqx - listado de servicos ordenados por parada
for linea_servicio in $(codcat ${FICHERO_SERVICIOS} | grep -v "^#" | sort -t ":" -k2 ) ; do

LINEA_FICHERO="${linea_servicio}"
dcode "${LINEA_FICHERO}"
linea_servicio_limpia=${SALIDA_DCODE}

SERVICIO=$(echo $linea_servicio_limpia | cut -d ":" -f1)

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
check_service ${SERVICIO}
#- En el momento en que alguno vaya mal debe indicarlo
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

##echo "Comprobando estado ${SERVICIO} : ${MOTIVO_FUNCION}" 

#-Solo debe considerar la salida si el servicio esta instalado en el sistema

if [ "${SALIDA_check_service}" != "1" ] ; then
SALIDA_FULL_SERVICES=$( expr ${SALIDA_check_service} + ${SALIDA_FULL_SERVICES} )
PARAMETROS_COLECCION_CKRUN[${cont_servicios}]="Comprobando estado ${SERVICIO} : ${SALIDA_check_service} - ${INFOSALIDA_check_service}"
let cont_servicios++
fi


done

PARAMETROS_MOTIVO_01=${PARAMETROS_COLECCION_CKRUN[0]}
PARAMETROS_MOTIVO_02=${PARAMETROS_COLECCION_CKRUN[1]}
PARAMETROS_MOTIVO_03=${PARAMETROS_COLECCION_CKRUN[2]}
PARAMETROS_MOTIVO_04=${PARAMETROS_COLECCION_CKRUN[3]}
PARAMETROS_MOTIVO_05=${PARAMETROS_COLECCION_CKRUN[4]}
PARAMETROS_MOTIVO_06=${PARAMETROS_COLECCION_CKRUN[5]}
PARAMETROS_MOTIVO_07=${PARAMETROS_COLECCION_CKRUN[6]}
PARAMETROS_MOTIVO_08=${PARAMETROS_COLECCION_CKRUN[7]}
PARAMETROS_MOTIVO_09=${PARAMETROS_COLECCION_CKRUN[8]}

SALIDA_full_ckrun_services=${SALIDA_FULL_SERVICES}

if [ "${SALIDA_full_ckrun_services}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [1] Inicio chequeo parada completa de servicios
#----====----====----====----====----====----====----====----====---

MOTIVO_FUNCION="Servicios arrancados correctamente"

else

MOTIVO_FUNCION="Algun servicio no se ha arrancado correctamente"

#----====----====----====----====----====----====----====----====---
#----- [1] Fin chequeo parada completa de servicios
#----====----====----====----====----====----====----====----====---
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_full_ckrun_services}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_full_ckrun_services}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_full_ckrun_services}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_full_ckrun_services}
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

