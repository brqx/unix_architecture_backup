#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.3" #  Version del Script actual
FECHA_SCRIPT="Noviembre 2012"
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
#-- sort_7field
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- sort_field
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Ordena el fichero indicado por el campo propuesto por el primer campo
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T sort field file first primer
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P FICHERO [SEPARADOR]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E sort_7field fich_01     -- Ordena el fichero 01 por el primer campo
#-------------------------------------------------------------------
#E sort_7field fich_01 ";" -- Ordena fich_01 por el tercer campo con separador dos puntos
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-Alias s1f
sort_7field()
{
IS_sort_7field="Ordena el fichero pasado por el campo indicado"
INFO_SCRIPT=${IS_sort_7field}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_sort_7field=${INFO_SCRIPT}

FICHERO=$1
SEPARADOR=$2

SALIDA_sort_7field=0

NOMBRE_SCRIPT_sort_7field=sort_7field
PARAMETROS_SCRIPT_sort_7field="FICHERO [SEPARADOR]"

if [ "${FICHERO}" == "" ]; then
FICHERO="-?"
fi

if [ "${SEPARADOR}" == "" ]; then
SEPARADOR=":"
fi

CAMPO=7

if [ "${FICHERO}" == "-?" ]; then

e_pmt ${NOMBRE_SCRIPT_sort_7field} ${PARAMETROS_SCRIPT_sort_7field}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Comprobar parametros
#-- [2] Ordenar fichero
#--------========--------========--------========--------========---

#-Separador - campo
# -t -k

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
sort_field ${FICHERO} ${CAMPO} ${SEPARADOR}
SALIDA_sort_7field=${SALIDA_sort_field}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#-Falta indicar aqui la gestion de la salida
PARAMETROS_MOTIVO_01="Fichero    : ${FICHERO}"
PARAMETROS_MOTIVO_02="Campo      : ${CAMPO}"
PARAMETROS_MOTIVO_03="Separador  : ${SEPARADOR}"

if [ "${SALIDA_sort_field}" == "0" ] ; then
#--------========--------========--------========--------========---
#----- [1] Inicio comprobacion salida correcta
#--------========--------========--------========--------========---
MOTIVO_FUNCION="Ejecuccion correcta. Fichero ordenado por campo."

else

MOTIVO_FUNCION="Error al acceder al fichero."

#--------========--------========--------========--------========---
#----- [1] Fin comprobacion salida correcta
#--------========--------========--------========--------========---
fi

#-Mantenemos los motivos y parametros motivo indicados .. creo

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_sort_7field}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_sort_7field}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_sort_7field}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_sort_7field}
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

