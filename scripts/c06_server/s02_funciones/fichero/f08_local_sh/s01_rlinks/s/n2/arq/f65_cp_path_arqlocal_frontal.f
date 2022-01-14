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
CONCEPT_MOLDE_05="alias"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Script ${CONCEPT_MOLDE_05} ${CONCEPT_ARQUETIPO_05} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- cf_path_to_arqglobal_frontal6a
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - cf_path_to_arq_frontal6a
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Actualiza las librerias en el servidor remoto
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T actualizar librerias ssh servidor remoto
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [version]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E cf_path_to_arqglobal_frontal6a 11_2 -- Actualiza las librerias con la version 11_2
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

cf_path_to_arqglobal_frontal6a()
{
IS_cf_path_to_arqglobal_frontal6a="Actualiza las librerias en el servidor Frontal 6a"
INFO_SCRIPT=${IS_cf_path_to_arqglobal_frontal6a}

##Debe componer lo siguiente : 

# cf_path_to_arqserver ricabel core7b  22 
# /opt/bibliotecas_arquitectura/MAPFRE_ARQOS_CORE_DIST  
# MAPFRE_ARQOS_CORE_DIST v11_2

VERSION=${1}

if [ "${VERSION}" == "" ]; then

	VERSION=${VERSION_ARQOS}
fi

#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${VERSION}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt cf_path_to_arqglobal_frontal6a "[version] "

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------
LIBRERIA[0]=MAPFRE_ARQOS_COMMONS_DIST
LIBRERIA[1]=MAPFRE_ARQOS_FRONT_DIST
LIBRERIA[2]=MAPFRE_ARQOS_FRONT_UI_DIST

cont=0
num_libs=2

while [ ${cont} -lt ${num_libs} ] ; do

echo "Lib : ${LIBRERIA[${cont}]} "
cf_path_to_arq_frontal6a ${LIBRERIA[${cont}]} ${VERSION}

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
