#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="5.4" #  Version del Script actual
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
#-- ef_pms
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

ef_pms()
{
IS_ef_pms="Informa de la salida de la funcion sin hacer borrado"
EINFO_SCRIPT=${IS_ef_pms}

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

if [ "${NOMBRE_FUNCION}" == "-?" ] ; then

e2_pmt ef_pms "Error de parametros. Mirar"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

if [ "${NIVEL_INFORMACION_FINAL}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio Test Informacion Final
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

e_pms

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin Test Informacion Final
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------
fi
}

#-------------------------------------------------------------------