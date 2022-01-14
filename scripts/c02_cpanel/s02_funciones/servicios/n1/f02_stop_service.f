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
CONCEPT_ARQUETIPO_04="servicios"
CONCEPT_VARIANTE_04=""
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- stop_service
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Parada del servicio indicado
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T stop parada servicio
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [-?]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E stop_service  	-- Limpieza de logs del servidor
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

stop_service()
{
IS_stop_service="Para un servicio "
INFO_SCRIPT=${IS_stop_service}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_stop_service=${INFO_SCRIPT}

#-Se requiere que se envie comando y servicio
#-Comando es un espacio por defecto
SERVICIO=${1}
COMANDO="${2} ${3}"

SALIDA_stop_service=0

NOMBRE_SCRIPT_stop_service=stop_service
PARAMETROS_SCRIPT_stop_service="[-?]"

if [ "${FICHERO_SERVICIOS}" == "" ]; then
FICHERO_SERVICIOS=${RS_SERV}zservicios_servidor_cpanel.dat
fi

#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${SERVICIO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_stop_service} ${PARAMETROS_SCRIPT_stop_service}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [0] Averiguamos el comando
#-- [1] Lanzar comando de parada
#-- [2] Comprobar que se ha parado e informar
#--------========--------========--------========--------========---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
check_service ${SERVICIO}
SALIDA_stop_service=${SALIDA_check_service}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_check_service}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [1] Inicio preparacion arranque servicio
#----====----====----====----====----====----====----====----====---

if [ "${COMANDO}" == " " ] ; then
LINEA_FICHERO=$(codcat ${FICHERO_SERVICIOS} | grep -v "^#" | grep "${SERVICIO}" | cut -d ":" -f5 )
dcode "${LINEA_FICHERO}"
COMANDO="${SALIDA_DCODE}"
fi

##echo "Vamos a lanzar : ${COMANDO} - ${SERVICIO} "
${COMANDO}
NUM_LINEAS=$(ps -eaf | grep ${SERVICIO} | grep -v "grep" | wc -l )

cont_parada=0
while [ $NUM_LINEAS -gt 0 ] ; do
sleep 5
let cont_parada++
##echo "Interno:Parando servicio ${SERVICIO}: $cont_parada"
NUM_LINEAS=$(ps -eaf | grep ${SERVICIO} | grep -v "grep" | wc -l )
done

SALIDA_stop_service=${NUM_LINEAS}

PARAMETROS_MOTIVO_01="Servicio    : ${SERVICIO}"
PARAMETROS_MOTIVO_02="Comando     : ${COMANDO}"


if [ "${SALIDA_stop_service}" == "0" ] ; then
#------======------======------======------======------======------=
#----- [2] Inicio chequeo logs BBDD
#------======------======------======------======------======------=

MOTIVO_FUNCION="Servicio parado correctamente"

else

MOTIVO_FUNCION="Error al parar el servicio"

#------======------======------======------======------======------=
#----- [2] Fin chequeo logs BBDD
#------======------======------======------======------======------=
fi
else

MOTIVO_FUNCION=${INFOSALIDA_check_service}

#MOTIVO_FUNCION="El servicio ya esta arrancado o no exite"

#----====----====----====----====----====----====----====----====---
#----- [1] Fin preparacion parada servicio
#----====----====----====----====----====----====----====----====---
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_stop_service}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_stop_service}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_stop_service}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
INFOSALIDA_stop_service=${MOTIVO_FUNCION}
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_stop_service}
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

