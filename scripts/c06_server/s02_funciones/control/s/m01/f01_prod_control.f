#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.0"          #  Version del Script actual
FECHA_SCRIPT="Enero 2011"
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- prod_control 
#-------------------------------------------------------------------
#-- prod_control_print
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- site_access - count_structure - log_size
#-------------------------------------------------------------------
#- Devuelve informacion del site - size logs - entradas directorio
#  etc
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#-- prod_control --> Devuelve una tupla con el control del site
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

prod_control()
{
#TUPLA_ENTRADA=brqxng.com:brqx:php_errorlog:error_log
#TUPLA_ENTRADA=certi.everis:/home/certi/www:php_errorlog:error_log

URL=$(echo ${TUPLA_ENTRADA} | cut -d ":" -f1 );
CARPETA=$(echo ${TUPLA_ENTRADA} | cut -d ":" -f2 );
LOG_01=$(echo ${TUPLA_ENTRADA} | cut -d ":" -f3 );
LOG_02=$(echo ${TUPLA_ENTRADA} | cut -d ":" -f4 );


site_access_no_proxy ${URL} ;

count_structure ${CARPETA} ;

log_size ${CARPETA} ${LOG_01}
SALIDA_LOG_SIZE_01=${SALIDA_LOG_SIZE}

log_size ${CARPETA} ${LOG_02}
SALIDA_LOG_SIZE_02=${SALIDA_LOG_SIZE}

#-------------------------------------------------------------------
#- Ejemplo Tupla de Salida
#-------------------------------------------------------------------
#-TUPLA_SALIDA=0:12:0:0
#-------------------------------------------------------------------

TUPLA_SALIDA=${URL}:${SALIDA_SITE_ACCESS}:${SALIDA_COUNT_STRUCTURE}:\
${SALIDA_LOG_SIZE_01}:${SALIDA_LOG_SIZE_02}

}

#-------------------------------------------------------------------

prod_control_print()
{
prod_control

echo $TUPLA_SALIDA
}

#-------------------------------------------------------------------
#+ Sistema de trazado N5 - parametrizado
#-------------------------------------------------------------------
if [ "${N5}" != "" ] ; then
echo "${LEVEL_NIVEL_05}/${LEVEL_NIVEL}--${CONCEPT_LEVEL_05}"
fi
#-------------------------------------------------------------------

#-==================================================================
#+ Vaciado de Variables
#-------------------------------------------------------------------
limpia_variables;
#-==================================================================
