#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="5.6" #  Version del Script actual
FECHA_SCRIPT="Diciembre 2012"
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
#-- e_pms
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#- p_p - INFO_SCRIPT
#-------------------------------------------------------------------
#- Nos permite controla el formato de los errores
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
# e_pms damef function  -- Imprime la salida de la funcion sin hacer borrado
#-------------------------------------------------------------------

e_pms()
{
IS_e_pms="Informa de la salida de la funcion sin hacer borrado"
EINFO_SCRIPT=${IS_e_pms}

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

e2_pmt e_pms "Error de parametros. Mirar"

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

if [ "${PARAMETROS_MOTIVO_03}" != "" ] ; then
NUM_PAR=10
ARGUMENTO_10=" ${PARAMETROS_MOTIVO_03}"
fi

if [ "${PARAMETROS_MOTIVO_04}" != "" ] ; then
NUM_PAR=11
ARGUMENTO_11=" ${PARAMETROS_MOTIVO_04}"
fi

if [ "${PARAMETROS_MOTIVO_05}" != "" ] ; then
NUM_PAR=12
ARGUMENTO_12=" ${PARAMETROS_MOTIVO_05}"
fi

if [ "${PARAMETROS_MOTIVO_06}" != "" ] ; then
NUM_PAR=13
ARGUMENTO_13=" ${PARAMETROS_MOTIVO_06}"
fi

if [ "${PARAMETROS_MOTIVO_07}" != "" ] ; then
NUM_PAR=14
ARGUMENTO_14=" ${PARAMETROS_MOTIVO_07}"
fi

if [ "${PARAMETROS_MOTIVO_08}" != "" ] ; then
NUM_PAR=15
ARGUMENTO_15=" ${PARAMETROS_MOTIVO_08}"
fi

if [ "${PARAMETROS_MOTIVO_09}" != "" ] ; then
NUM_PAR=16
ARGUMENTO_16=" ${PARAMETROS_MOTIVO_09}"
fi

if [ "${PARAMETROS_MOTIVO_10}" != "" ] ; then
NUM_PAR=17
ARGUMENTO_17=" ${PARAMETROS_MOTIVO_10}"
fi

if [ "${PARAMETROS_MOTIVO_11}" != "" ] ; then
NUM_PAR=18
ARGUMENTO_18=" ${PARAMETROS_MOTIVO_11}"
fi

if [ "${PARAMETROS_MOTIVO_12}" != "" ] ; then
NUM_PAR=19
ARGUMENTO_19=" ${PARAMETROS_MOTIVO_12}"
fi

if [ "${PARAMETROS_MOTIVO_13}" != "" ] ; then
NUM_PAR=20
ARGUMENTO_20=" ${PARAMETROS_MOTIVO_13}"
fi

if [ "${PARAMETROS_MOTIVO_14}" != "" ] ; then
NUM_PAR=21
ARGUMENTO_21=" ${PARAMETROS_MOTIVO_14}"
fi

if [ "${PARAMETROS_MOTIVO_15}" != "" ] ; then
NUM_PAR=22
ARGUMENTO_22=" ${PARAMETROS_MOTIVO_15}"
fi

if [ "${PARAMETROS_MOTIVO_16}" != "" ] ; then
NUM_PAR=23
ARGUMENTO_23=" ${PARAMETROS_MOTIVO_16}"
fi

if [ "${PARAMETROS_MOTIVO_17}" != "" ] ; then
NUM_PAR=24
ARGUMENTO_24=" ${PARAMETROS_MOTIVO_17}"
fi

if [ "${PARAMETROS_MOTIVO_18}" != "" ] ; then
NUM_PAR=25
ARGUMENTO_25=" ${PARAMETROS_MOTIVO_18}"
fi

if [ "${PARAMETROS_MOTIVO_19}" != "" ] ; then
NUM_PAR=26
ARGUMENTO_26=" ${PARAMETROS_MOTIVO_19}"
fi

if [ "${PARAMETROS_MOTIVO_20}" != "" ] ; then
NUM_PAR=27
ARGUMENTO_27=" ${PARAMETROS_MOTIVO_20}"
fi

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#----Fin Chequeo Motivo
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

##echo "Llamada parametros - ${NUM_PAR} "

#-Presentamos la informacion
p_s ${NUM_PAR}

#-Vaciar variables

ARGUMENTO_01=
ARGUMENTO_02=
ARGUMENTO_03=
ARGUMENTO_04=
ARGUMENTO_05=
ARGUMENTO_06=
ARGUMENTO_07=
ARGUMENTO_08=
ARGUMENTO_09=
ARGUMENTO_10=
ARGUMENTO_11=
ARGUMENTO_12=
ARGUMENTO_13=
ARGUMENTO_14=
ARGUMENTO_15=
ARGUMENTO_16=
ARGUMENTO_17=


PARAMETROS_MOTIVO_01=
PARAMETROS_MOTIVO_02=
PARAMETROS_MOTIVO_03=
PARAMETROS_MOTIVO_04=
PARAMETROS_MOTIVO_05=
PARAMETROS_MOTIVO_06=
PARAMETROS_MOTIVO_07=
PARAMETROS_MOTIVO_08=
PARAMETROS_MOTIVO_09=
PARAMETROS_MOTIVO_10=

PARAMETROS_MOTIVO_11=
PARAMETROS_MOTIVO_12=
PARAMETROS_MOTIVO_13=
PARAMETROS_MOTIVO_14=
PARAMETROS_MOTIVO_15=
PARAMETROS_MOTIVO_16=
PARAMETROS_MOTIVO_17=
PARAMETROS_MOTIVO_18=
PARAMETROS_MOTIVO_19=
PARAMETROS_MOTIVO_20=

PARAMETROS_MOTIVO_21=
PARAMETROS_MOTIVO_22=
PARAMETROS_MOTIVO_23=
PARAMETROS_MOTIVO_24=
PARAMETROS_MOTIVO_25=
PARAMETROS_MOTIVO_26=
PARAMETROS_MOTIVO_27=
PARAMETROS_MOTIVO_28=
PARAMETROS_MOTIVO_29=
PARAMETROS_MOTIVO_30=

INFO_SCRIPT=
NOMBRE_SCRIPT=
PARAMETROS_SCRIPT=

#Limpiamos la pantalla en el momento en el que se ha mostrado
PANTALLA_SCRIPT=

#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------
fi
}

#-------------------------------------------------------------------