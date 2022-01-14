#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.0"          #  Version del Script actual
FECHA_SCRIPT="Marzo 2011"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
LEVEL_NIVEL_05=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="funcion"
CONCEPT_ARQUETIPO_05="control"
CONCEPT_LEVEL_05="Script $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- busca_logs_entornos_no_proxy
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - busca_log_no_proxy
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Busca logs concanenando contador
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T busca logs servidor
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [servidor] [contador] [fichero_entornos]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E logs_entornos_no_proxy		--> Saca los logs de todos los entornos
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-La idea es hacer un chequeo de urls concatenando la cadenal de logs
logs_entornos_no_proxy()
{
IS_logs_entornos_no_proxy="Busca todos los logs en el entorno indicado"
INFO_SCRIPT=${IS_logs_entornos_no_proxy}

cont_logs_entornos=$1
MAX_CONT_entornos=$2
RUTA_ENTORNOS=$3

if [ "${RUTA_SERVIDORES}" == "" ] ;  then
RUTA_ENTORNOS=${RS_CONN}zentornos_noproxy.dat
fi


if [ "${cont_logs_entornos}" == "" ] ;  then
#-Iniciamos el contador en 100
cont_logs_entornos=100
fi

if [ "${MAX_CONT_entornos}" == "" ] ;  then
MAX_CONT_entornos=1000
fi


if [ "${cont_logs_entornos}" == "-?" ] ;  then

e_pmt logs_entornos "[contador] [maximo]"

else


cont_entornos=0

for nombre_servidor in $(cat ${RUTA_ENTORNOS} | grep -v "^#" | grep -v "^ " )
do

posiciona ${cont_entornos}-${nombre_servidor}

busca_log_no_proxy ${nombre_servidor} ${cont_logs_entornos} ${MAX_CONT_entornos}

let cont_entornos++ ; 

done

fi
}

#-------------------------------------------------------------------

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
