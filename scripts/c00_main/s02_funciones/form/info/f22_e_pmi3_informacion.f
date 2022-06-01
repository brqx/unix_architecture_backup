#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="5.1" #  Version del Script actual
FECHA_SCRIPT="Febrero 2012"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="form"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- e_pmi3
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#- p_p - e2_pmt
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Nos permite controla el formato de los errores - Evitando la redundancia de codigo
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P NOMBRE_FUNCION [MENSAJE][TEXTO_INFORMACION][INFORMACION_ADICCIONAL]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E e_pmi3 f2 "busqueda con filtro" "Salida de la busqueda con ESC"
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

# Te devuelve el archivo que contiene la funcion con la linea de la funcion 
# Podemos parametrizarla mucho mas
e_pmi3()
{
IS_e_pmi3="Permite parametrizar la salida de informacion de funciones. Inlcuye informacion adiccional"
EINFO_SCRIPT=${IS_e_pmi3}

# Funcion de informacion variable. No usa INFO_SCRIPT

NOMBRE_FUNCION=$1
MENSAJE=$( echo $2 | tr "_" " " )
TEXTO_INFORMACION=$( echo $3 | tr "_" " " )
INFORMACION_ADICCIONAL=$( echo $4 | tr "_" " " )
INFORMACION_ADICCIONAL_2=$( echo $5 | tr "_" " " )

#- No admite alias por tanto hay que usar funciones

if [ "${NOMBRE_FUNCION}" == "" ] ; then
NOMBRE_FUNCION="-?"
fi

if [ "${TITULO_FORMULARIO_GLOBAL}" != "" ] ; then
TITULO_FORMULARIO=${TITULO_FORMULARIO_GLOBAL}
fi

if [ "${NOMBRE_FUNCION}" == "-?" ] ; then

e_pmt e_pmi3 "[NOMBRE_FUNCION] [MENSAJE] [INFORMACION] "
else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

NUM_PAR=7

ARGUMENTO_01="Funcion ${NOMBRE_FUNCION}"
ARGUMENTO_02="Informacion:"
ARGUMENTO_03=" ${INFO_SCRIPT}"
ARGUMENTO_04=" ${MENSAJE}"
ARGUMENTO_05=" ${TEXTO_INFORMACION}"
ARGUMENTO_06="Informacion Adiccional :"
ARGUMENTO_07=" ${INFORMACION_ADICCIONAL}"

if [ "${INFORMACION_ADICCIONAL_2}" != "" ] ; then

NUM_PAR=8
ARGUMENTO_08=" ${INFORMACION_ADICCIONAL_2}"

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
ARGUMENTO_08=

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
