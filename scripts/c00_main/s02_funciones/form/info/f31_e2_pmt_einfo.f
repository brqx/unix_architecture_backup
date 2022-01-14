#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="5.2" #  Version del Script actual
FECHA_SCRIPT="Abril 2012"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="informaciones"
CONCEPT_ARQUETIPO_04="general"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- e2_pmt
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#- linea_normal - linea_caracter - linea_alterna
#-------------------------------------------------------------------
#- Nos permite controla el formato de los errores
#  Evitando la redundancia de codigo
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E e_pmt damef function  -- Imprime la traza de error con damef y function
#-------------------------------------------------------------------

# Te devuelve el archivo que contiene la funcion con la linea de la funcion 
e2_pmt()
{
IS_e2_pmt="Permite parametrizar la salida de informacion de funciones. Incluye formato y particularidades y texto de error"
EINFO_SCRIPT=${IS_e2_pmt}


NOMBRE_FUNCION=$1
ARGUMENTOS=$2
TEXTO_ERROR=$3

if [ "${TEXTO_ERROR}" == "" ] ; then
TEXTO_ERROR="Error de parametros"
fi

if [ "${NOMBRE_FUNCION}" == "" ] ; then
NOMBRE_FUNCION="-?"
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

#-El titulo es una variable general del sistema
# TITULO_FORMULARIO="Control de Scripts 1.2 - Funciones - Brqx 2012"

NUM_PAR=5

ARGUMENTO_01="Funcion ${NOMBRE_FUNCION}"
ARGUMENTO_02="Informacion      :"
ARGUMENTO_03=" ${EINFO_SCRIPT}"
ARGUMENTO_04="Formato          :"
ARGUMENTO_05=" ${NOMBRE_FUNCION} <${ARGUMENTOS}>"

if [ "${TEXTO_ERROR}" != "" ] ; then
NUM_PAR=7

ARGUMENTO_06="Particularidades :"
ARGUMENTO_07=" ${TEXTO_ERROR}"

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