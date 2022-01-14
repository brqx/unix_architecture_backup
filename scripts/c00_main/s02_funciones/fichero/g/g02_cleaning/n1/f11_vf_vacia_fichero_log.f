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
#-- vacia_fichero_log
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Vacia el fichero indicado
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T vacia fichero log vaciar
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [fichero_log]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E vacia_fichero_log fichero_log -- Vacia el fichero indicado
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Mini alias vflog
#- Alias - clearlog
vacia_fichero_log()
{
IS_vacia_fichero_log="Vacia el fichero log indicado"
INFO_SCRIPT=${IS_vacia_fichero_log}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_vacia_fichero_log=${INFO_SCRIPT}

FICHERO=${1}

# LINEA_ENTRADA=$@

SALIDA_vacia_fichero_log=0

NOMBRE_SCRIPT_vacia_fichero_log=vacia_fichero_log
PARAMETROS_SCRIPT_vacia_fichero_log="FICHEROS A VACIAR"

if [ "${FICHERO}" == "" ]; then
## Activamos un usuario por defecto
FICHERO="error_log"
fi  

if [ "${FICHERO}" == "-?" ]; then

e_pmt ${NOMBRE_SCRIPT_vacia_fichero_log} ${PARAMETROS_SCRIPT_vacia_fichero_log}

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

stat "${FICHERO}" &> /dev/null
SALIDA_stat=$?
SALIDA_tailf=${SALIDA_stat}

USUARIO_ACTUAL=$(whoami)

#-Parametros comunes
PARAMETROS_MOTIVO_01="Archivo             : ${FICHERO}"
PARAMETROS_MOTIVO_02="Ruta actual         : ${PWD}"
PARAMETROS_MOTIVO_03="Propietario actual  : ${USUARIO_ACTUAL}"


if [ "${SALIDA_stat}" == "0" ] ; then
#--------========--------========--------========--------========---
#----- [1] Inicio comprobacion ruta
#--------========--------========--------========--------========---

#- Sacamos el usuario del fichero 

USUARIO_FICHERO=$(stat -c %U ${FICHERO} )

#-Convertimos el usuario para poder vaciarlo
chown ${USUARIO_ACTUAL} ${FICHERO} 2> /dev/null

#- Vaciamos el fichero
> ${FICHERO}
SALIDA_vaciado=$?

#-Convertimos el usuario para poder vaciarlo
chown ${USUARIO_FICHERO} ${FICHERO} 2> /dev/null

PARAMETROS_MOTIVO_04="Propietario fichero : ${USUARIO_FICHERO}"


if [ "${SALIDA_vaciado}" == "0" ] ; then
#---------=========---------=========---------=========---------====
#----- [2] Inicio check vaciado
#---------=========---------=========---------=========---------====

MOTIVO_FUNCION="Fichero existe ha sido vaciado"

else

MOTIVO_FUNCION="Error de permisos"

#---------=========---------=========---------=========---------====
#----- [2] Fin check vaciado
#---------=========---------=========---------=========---------====
fi
else

MOTIVO_FUNCION="Ruta incorrecta"

#--------========--------========--------========--------========---
#----- [1] Fin comprobacion ruta
#--------========--------========--------========--------========---
fi


#for i in ${LINEA_ENTRADA} ; do
#fichero=$i
#> $fichero
#chown root:root $fichero
#done


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_vacia_fichero_log}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_vacia_fichero_log}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_vacia_fichero_log}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_vacia_fichero_log}
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

