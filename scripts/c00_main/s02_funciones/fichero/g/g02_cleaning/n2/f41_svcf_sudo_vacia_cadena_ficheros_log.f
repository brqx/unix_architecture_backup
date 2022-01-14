#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.2" #  Version del Script actual
FECHA_SCRIPT="Octubre 2012"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="fichero"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- su_vacia_cadena_ficheros_log
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- su_vacia_fichero_log
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Vacia los ficheros indicados con privilegios
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T vacia multiples varios fichero log vaciar sudo multi
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [cadena ficheros]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E su_vacia_cadena_ficheros_log fich1 fich2 -- Vacia los ficheros indicados
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

su_vacia_cadena_ficheros_log()
{
IS_su_vacia_cadena_ficheros_log="Vacia los ficheros log indicados"
INFO_SCRIPT=${IS_su_vacia_cadena_ficheros_log}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_su_vacia_cadena_ficheros_log=${INFO_SCRIPT}

FICHERO=${1}
LINEA_ENTRADA=$@

SALIDA_su_vacia_cadena_ficheros_log=0

NOMBRE_SCRIPT_su_vacia_cadena_ficheros_log=su_vacia_cadena_ficheros_log
PARAMETROS_SCRIPT_su_vacia_cadena_ficheros_log="FICHEROS A VACIAR"

if [ "${FICHERO}" == "" ]; then
## Activamos un usuario por defecto
FICHERO="error_log"
fi  

if [ "${FICHERO}" == "-?" ]; then

e_pmt ${NOMBRE_SCRIPT_su_vacia_cadena_ficheros_log} ${PARAMETROS_SCRIPT_vacia_cadena_ficheros_log}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Comprobar fichero y accesibilidad
#-- [2] Vaciar fichero
#--------========--------========--------========--------========---

for fichero_entrada in ${LINEA_ENTRADA} ; do

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
su_vacia_fichero_log ${fichero_entrada}
SALIDA_su_vacia_cadena_ficheros_log=${SALIDA_su_vacia_fichero_log}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

done

PARAMETROS_MOTIVO_01="Linea Entrada: ${LINEA_ENTRADA}"
PARAMETROS_MOTIVO_02="Ruta actual  : ${PWD}"


if [ "${SALIDA_su_vacia_cadena_ficheros_log}" == "0" ] ; then
#---------=========---------=========---------=========---------====
#----- [2] Inicio check vaciado
#---------=========---------=========---------=========---------====

MOTIVO_FUNCION="Ficheros vaciados de forma correcta"

else

MOTIVO_FUNCION="Error de permisos o de ruta de los ficheros"

#---------=========---------=========---------=========---------====
#----- [2] Fin check vaciado
#---------=========---------=========---------=========---------====
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_su_vacia_cadena_ficheros_log}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_su_vacia_cadena_ficheros_log}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_su_vacia_cadena_ficheros_log}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_su_vacia_cadena_ficheros_log}
#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------
fi
}

#-------------------------------------------------------------------
#+ Sistema de trazado N4 - desactivado
#-------------------------------------------------------------------
#N4# echo "$LEVEL_NIVEL	-	Ejecutadas $CONCEPT_LEVEL"
#-------------------------------------------------------------------

#-==================================================================
#+ Vaciado de Variables
#-------------------------------------------------------------------
limpia_variables;
#-==================================================================

