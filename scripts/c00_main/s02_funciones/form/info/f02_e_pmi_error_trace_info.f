#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="5.3" #  Version del Script actual
FECHA_SCRIPT="Abril 2012"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="informaciones"
CONCEPT_ARQUETIPO_04="form"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- e_pmi
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#- p_p - INFO_SCRIPT
#-------------------------------------------------------------------
#- Nos permite controla el formato de los errores
#  Evitando la redundancia de codigo
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
# e_pmi damef function  -- Imprime la traza de error con damef y function
#-------------------------------------------------------------------

# Te devuelve el archivo que contiene la funcion con la linea de la funcion 
e_pmi()
{
IS_e_pmi="Permite parametrizar la salida de informacion de funciones. Incluye formato"
EINFO_SCRIPT=${IS_e_pmi}

# Usara la variable general INFO_SCRIPT, que se redefine en cada funcion ejecutada
# Se permite invocar sin argumentos

#-Se ha preparado para que nombre de la funcion y argumentos vayan establecidos

NOMBRE_FUNCION=$1
ARGUMENTOS=$2

#-El mensaje o motivo y la informacion igual tb pueden ser parametros globales.
# MOTIVO_FUNCION=$3
#
# PARAMETROS_MOTIVO=$4

if [ "${NOMBRE_FUNCION}" == "" ] ; then
NOMBRE_FUNCION=${NOMBRE_SCRIPT}
fi

if [ "${ARGUMENTOS}" == "" ] ; then
ARGUMENTOS=${PARAMETROS_SCRIPT}
fi

if [ "${TITULO_FORMULARIO_GLOBAL}" != "" ] ; then
TITULO_FORMULARIO=${TITULO_FORMULARIO_GLOBAL}
fi

if [ "${NOMBRE_FUNCION}" == "-?" ] ; then

e2_pmt e_pmt "Error de parametros. Mirar"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

NUM_PAR=5

ARGUMENTO_01="Funcion ${NOMBRE_FUNCION}"
ARGUMENTO_02="Informacion General:"
ARGUMENTO_03=" ${INFO_SCRIPT}"
ARGUMENTO_04="Formato :"
ARGUMENTO_05=" ${NOMBRE_FUNCION} <${ARGUMENTOS}>"

if [ "${MOTIVO_FUNCION}" != "" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#----Inicio Chequeo Motivo
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

NUM_PAR=7
ARGUMENTO_06="Particularidades :"
ARGUMENTO_07=" ${MOTIVO_FUNCION}"

if [ "${PARAMETROS_MOTIVO_01}" != "" ] ; then
NUM_PAR=8
ARGUMENTO_08=" ${PARAMETROS_MOTIVO_01}"
fi

if [ "${PARAMETROS_MOTIVO_02}" != "" ] ; then
NUM_PAR=9
ARGUMENTO_09=" ${PARAMETROS_MOTIVO_02}"
fi

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#----Fin Chequeo Motivo
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

#-Presentamos la informacion
p_p ${NUM_PAR}


#-Vaciar variables

ARGUMENTO_01=
ARGUMENTO_02=
ARGUMENTO_03=
ARGUMENTO_04=
ARGUMENTO_05=
ARGUMENTO_06=
ARGUMENTO_07=


#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------
fi
}

#-------------------------------------------------------------------