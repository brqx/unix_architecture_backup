#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.2"          #  Version del Script actual
FECHA_SCRIPT="Diciembre 2011"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="function"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- mvn_gfull_libraries_release
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - ch
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Actualiza una libreria/artefacto del servidor de Maven
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T obtener librerias mvn servidor maven
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [version]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E mvn_gfull_libraries_release 11_2 -- Oteniene la version 11_2 de las librerias 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Alias mvgfull
mvn_gfull_libraries_release()
{
IS_mvn_gfull_libraries_release="Descarga todas las librerias para la version indicada"
INFO_SCRIPT=${IS_mvn_gfull_libraries_release}

VERSION=${1}

if [ "${VERSION}" == "" ]; then
	VERSION=${VERSION_ARQOS_MVN_LIBS_RELEASE}
fi

if [ "${VERSION}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt mvn_gfull_libraries_release "[version]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#- Preparamos el array de librerias
#- Esto lo deberia pillar de un archivo - pendiente de implementar

LIBRERIA[0]=MAPFRE_ARQOS_COMMONS_DIST
LIBRERIA[1]=MAPFRE_ARQOS_CORE_DIST
LIBRERIA[2]=MAPFRE_ARQOS_SOA_DIST
LIBRERIA[3]=MAPFRE_ARQOS_ENV_DIST
LIBRERIA[4]=MAPFRE_ARQOS_FRONT_DIST
LIBRERIA[5]=MAPFRE_ARQOS_LOG4M_DIST
LIBRERIA[6]=MAPFRE_ARQOS_LOV_DIST
LIBRERIA[7]=MAPFRE_ARQOS_V2_DIST
LIBRERIA[8]=MAPFRE_ARQOS_ENVCONFIG_DIST
LIBRERIA[9]=MAPFRE_ARQOS_CORE_VIDA_DIST
LIBRERIA[10]=MAPFRE_ARQOS_FRONT_VIDA_DIST

cont=0
num_libs=11

while [ ${cont} -lt ${num_libs} ] ; do

##echo "Lib : ${LIBRERIA[${cont}]} "

mvn_get_library_release   ${LIBRERIA[${cont}]} ${VERSION}

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
