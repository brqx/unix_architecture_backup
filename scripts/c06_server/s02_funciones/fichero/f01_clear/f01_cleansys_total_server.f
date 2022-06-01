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
#-- cleansys_total_server
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- cleansys_completo
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Limpieza de logs del sistema y servicios
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T sistema system clean logs drupal services
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [-?]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E cleansys_total_server  	-- Limpieza de logs del servidor
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

cleansys_total_server()
{
IS_cleansys_total_server="Limpia los logs del servidor y sus servicios"
INFO_SCRIPT=${IS_cleansys_total_server}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_cleansys_total_server=${INFO_SCRIPT}

ID_WAS=${1}

SALIDA_cleansys_total_server=0

NOMBRE_SCRIPT_cleansys_total_server=cleansys_total_server
PARAMETROS_SCRIPT_cleansys_total_server="[-?]"


#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${ID_WAS}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_cleansys_total_server} ${PARAMETROS_SCRIPT_cleansys_total_server}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Limpiar logs generales
#-- [2] Limpiar carpetas generales
#-- [3] Limpiar logs de los servicios
#-- [4] Limpiar logs de las aplicaciones
#-- [5] Eliminar logs mas viejos que una fecha
#-- [6] Eliminar logs que cumplan patrones
#--------========--------========--------========--------========---

#-Aqui vaciaremos los logs del servidor
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++



let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_cleansys_completo}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [1] Inicio chequeo logs BBDD
#----====----====----====----====----====----====----====----====---

MOTIVO_FUNCION="Ficheros de log vaciados o borrados correctamente"

else

MOTIVO_FUNCION="Error al vaciar o eliminar ficheros de log"

#----====----====----====----====----====----====----====----====---
#----- [1] Inicio chequeo logs BBDD
#----====----====----====----====----====----====----====----====---
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_cleansys_total_server}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_cleansys_total_server}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_cleansys_total_server}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_cleansys_total_server}
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

