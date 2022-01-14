#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.4" #  Version del Script actual
FECHA_SCRIPT="Junio 2012"
STATUS_SCRIPT="all_checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="acceso"
CONCEPT_VARIANTE_04="direct"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- genh
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- codir - ecode - dcode
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Intercambia una parte de la ruta actual por otra
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T acceso cd parametros carpeta especifica intercambio
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P parte_ruta parte_ruta2
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E genh 60 70		-	cambia la ruta actual cada aparicion por 70
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-Generico para ch
genh()
{
IS_genh="Intercambia una parte de la ruta actual por otra"
INFO_SCRIPT=${IS_genh}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_genh=${INFO_SCRIPT}

CADENA_A_BUSCAR="$1"
CADENA_A_CAMBIAR="$2"

SALIDA_genh=0

NOMBRE_SCRIPT_genh=genh
PARAMETROS_SCRIPT_genh="CADENA1 CADENA2"

if [ "${CADENA_A_BUSCAR}" == "" ] ;  then
#-Preparamos un cambio por defecto
CADENA_A_BUSCAR=60
CADENA_A_CAMBIAR=70
fi

if [ "${CADENA_A_BUSCAR}" == "-?" ] ;  then
#- Informar de los parametros
e_pmi genh "expr_01 expr_02"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------
#-Esta funcion lo recibe en claro

RUTA_ACTUAL_genh="${PWD}"

CARPETA_DESTINO=$(echo ${RUTA_ACTUAL_genh} | sed "s/${CADENA_A_BUSCAR}/${CADENA_A_CAMBIAR}/g")

stat "${CARPETA_DESTINO}" &> /dev/null
SALIDA_stat=$?
SALIDA_genh=${SALIDA_stat}

if [ "${SALIDA_stat}" == "0" ] ; then
#--------========--------========--------========--------========---
#----- [1] Inicio comprobacion ruta
#--------========--------========--------========--------========---

cd "${CARPETA_DESTINO}" 2> /dev/null
SALIDA_cd=$?
SALIDA_genh=${SALIDA_cd}

if [ "${SALIDA_cd}" == "0" ] ; then
#--------========--------========--------========--------========---
#------- [2] Inicio acceso ruta
#--------========--------========--------========--------========---

OLDPWD=${RUTA_ACTUAL_genh}

MOTIVO_FUNCION="Acceso a nueva ruta correcto"
PARAMETROS_MOTIVO_01="Ruta Anterior: ${RUTA_ACTUAL_genh}"
PARAMETROS_MOTIVO_02="Ruta Nueva   : ${CARPETA_DESTINO}"
else
MOTIVO_FUNCION="Error al acceder a la ruta"
PARAMETROS_MOTIVO_01="Ruta Actual  : ${RUTA_ACTUAL_genh}"
PARAMETROS_MOTIVO_02="Ruta Erronea : ${CARPETA_DESTINO}"

#--------========--------========--------========--------========---
#------- [2] Fin acceso ruta
#--------========--------========--------========--------========---
fi
else
MOTIVO_FUNCION="Ruta no existe"
PARAMETROS_MOTIVO_01="Ruta Actual  : ${RUTA_ACTUAL_genh}"
PARAMETROS_MOTIVO_02="Ruta Erronea : ${CARPETA_DESTINO}"

#--------========--------========--------========--------========---
#----- [1] Fin comprobacion ruta
#--------========--------========--------========--------========---
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_genh}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_genh}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_genh}

ef_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi



return ${SALIDA_genh}
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
