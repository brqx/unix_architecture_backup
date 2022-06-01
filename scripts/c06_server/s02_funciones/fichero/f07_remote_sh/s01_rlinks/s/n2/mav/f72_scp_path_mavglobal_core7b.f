#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.1"          #  Version del Script actual
FECHA_SCRIPT="Diciembre 2011"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="funcion"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Script ${CONCEPT_MOLDE_05} ${CONCEPT_ARQUETIPO_05} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- cf_path_to_mavglobal_core7b
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - cf_path_to_mav_core7b
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Actualiza la librerias maven en el servidor remoto
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T actualizar librerias ssh servidor remoto maven
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [libreria] version
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E cf_path_to_mavglobal_core7b 11_2 -- Actualiza la libreria maven con la version 11_2
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

cf_path_to_mavglobal_core7b()
{
IS_cf_path_to_mavglobal_core7b="Actualiza las librerias en el servidor Core 7a"
INFO_SCRIPT=${IS_cf_path_to_mavglobal_core7b}

VERSION_MAV=${1}


if [ "${VERSION_MAV}" == "" ]; then

	VERSION_MAV=${VERSION_ARQOS}
fi

#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${VERSION_MAV}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt cf_path_to_mavglobal_core7b "[version] "

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------
LIBRERIA[0]=MAPFRE_ARQOS_COMMONS_DIST
LIBRERIA[1]=MAPFRE_ARQOS_CORE_DIST
LIBRERIA[2]=MAPFRE_ARQOS_ENV_DIST

cont=0

while [ ${cont} -lt 3 ] ; do

echo "Lib : ${LIBRERIA[${cont}]} "
cf_path_to_mav_core7b ${LIBRERIA[${cont}]} ${VERSION_MAV}

let cont++ ;
done


fi
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
