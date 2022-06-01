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
#-- cf_path_to_mavglobal_frontal6b
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - cf_path_to_mav_frontal6b
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Actualiza la libreria en el servidor remoto
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T actualizar libreria ssh servidor remoto
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [libreria] version
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E cf_path_to_mavglobal_frontal6b 11_2 -- Actualiza la libreria con la version 11_2
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

cf_path_to_mavglobal_frontal6b()
{
IS_cf_path_to_mavglobal_frontal6b="Actualiza la librerias en el servidor Frontal 6b"
INFO_SCRIPT=${IS_cf_path_to_mavglobal_frontal6b}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_cf_path_to_mavglobal_frontal6b=${INFO_SCRIPT}

VERSION_MAV=${1}


if [ "${VERSION_MAV}" == "" ]; then

	VERSION_MAV=${VERSION_ARQOS}
fi

#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${VERSION_MAV}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt cf_path_to_mavglobal_frontal6b "[version] "

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------
LIBRERIA[0]=MAPFRE_ARQOS_COMMONS_DIST
LIBRERIA[1]=MAPFRE_ARQOS_FRONT_DIST
LIBRERIA[3]=MAPFRE_ARQOS_FRONT_VIDA_DIST
LIBRERIA[4]=MAPFRE_ARQOS_V2_DIST
##LIBRERIA[3]=MAPFRE_ARQOS_FRONT_UI_DIST

cont=0
num_libs=4


while [ ${cont} -lt ${num_libs} ] ; do

echo "Lib : ${LIBRERIA[${cont}]} "
cf_path_to_mav_frontal6b ${LIBRERIA[${cont}]} ${VERSION_MAV}

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
