#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="5.3" #  Version del Script actual
FECHA_SCRIPT="Noviembre 2012"
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
#-- p_p1p
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#- linea_normal - linea_caracter - linea_alterna
#-------------------------------------------------------------------
#- Nos permite imprimir pantallas de informacion 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
# p_p1p parametro_01  -- Presenta un formulario de informacion con 1 par
#-------------------------------------------------------------------

# Imprime el formulario con un parametro de entrada
p_p1p()
{
IS_p_p1p="Imprime el formulario con un parametro de entrada"
EINFO_SCRIPT=${IS_p_p1p}

# Usara la variable general INFO_SCRIPT, que se redefine en cada funcion ejecutada
# Se permite invocar sin argumentos

INFO=$1

## ARGUMENTO_01=$1
## ARGUMENTO_02=$2
## ARGUMENTO_03=$3
## ARGUMENTO_04=$4
## ARGUMENTO_05=$5
## ARGUMENTO_06=$6
## ARGUMENTO_07=$7
## ARGUMENTO_08=$8
## ARGUMENTO_09=$9
## ARGUMENTO_10=${10}

if [ "${INFO}" == "-?" ] ; then

e2_pmt p_p1p "Error de parametros. Mirar"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

clear
#--------------------------------------------------------------------
linea_caracter "="
#====================================================================
center_text ${TITULO_FORMULARIO}
#====================================================================
linea_caracter "=*"
#--------------------------------------------------------------------
center_text "- ${ARGUMENTO_01} -"
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
linea_caracter "="
#--------------------------------------------------------------------

stat "${PANTALLA_SCRIPT}" &> /dev/null
EXISTE_PANTALLA=$?

#--------------------------------------------------------------------
if [ "${PANTALLA_SCRIPT}" != "" -a "${EXISTE_PANTALLA}" ] ; then
#====================================================================
echo "Pantalla :"
#--------------------------------------------------------------------
linea_caracter "=*="
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
cat ${PANTALLA_SCRIPT}
#--------------------------------------------------------------------
linea_caracter "="
#--------------------------------------------------------------------
rm -f ${PANTALLA_SCRIPT}
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
fi

stat "${PANTALLA_EXTENDIDA_SCRIPT}" &> /dev/null
EXISTE_PANTALLA_EXTENDIDA=$?

#--------------------------------------------------------------------
if [ "${PANTALLA_EXTENDIDA_SCRIPT}" != "" -a "${EXISTE_PANTALLA_EXTENDIDA}" ] ; then
#====================================================================
echo "Extendido :"
#--------------------------------------------------------------------
linea_caracter "=*="
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
cat ${PANTALLA_EXTENDIDA_SCRIPT}
#--------------------------------------------------------------------
linea_caracter "="
#--------------------------------------------------------------------
rm -f ${PANTALLA_EXTENDIDA_SCRIPT}
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==
fi

#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------
fi

}

#-------------------------------------------------------------------