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
#-- mvn_gfull_apps_releases
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - ch
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Actualiza los artefactos del servidor de Maven
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
#E mvn_gfull_apps_releases 11_2 -- Oteniene la version 11_2 de las librerias 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Alias mvgfull
mvn_gfull_apps_releases()
{
IS_mvn_gfull_apps_releases="Descarga todos los artefactos para la version indicada"
INFO_SCRIPT=${IS_mvn_gfull_apps_releases}

VERSION=${1}

if [ "${VERSION}" == "" ]; then
	VERSION=${VERSION_ARQOS_MVN_APPS_RELEASE}
fi

if [ "${VERSION}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt mvn_gfull_apps_releases "[version]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#- Preparamos el array de librerias

APP[0]=AAA_TALLERARQOS_FEAR
APP[1]=Taller_CEAR
APP[2]=EMI_ConsultPol_SMED_SEAR
APP[3]=TA_GesSolPres_SMED_SEAR
APP[4]=TAQ_GesSolPres_SDPS_SEAR
APP[5]=RESTDispatcher_FEAR

GESAUTORIZA[0]=GESAUTORIZA_CEAR
GESAUTORIZA[1]=GESAUTORIZA_FEAR

REST_DISPATCHER[0]=MAPFRE_REST_DISPATCHER_FEAR

cont=0

while [ ${cont} -lt 6 ] ; do

#-- Hay que adaptarlo para que pille el artifact id y la version
##echo "Lib : ${LIBRERIA[${cont}]} "
##GroupId: com.mapfre.dgtp.cosym.dispatcher
##ArtifactId: RESTDispatcher
##Version: 0.0.1-SNAPSHOT

mvn_get_app_release   ${APP[${cont}]} ${VERSION}

let cont++ ;
done


cont=0
#-- Aplicacion GESAUTORIZA
while [ ${cont} -lt 2 ] ; do

##echo "Lib : ${LIBRERIA[${cont}]} "

mvn_get_app_release   ${GESAUTORIZA[${cont}]} ${VERSION_ARQOS_MVN_GESAUTORIZA_RELEASE} ${RUTA_NEXUS_RELEASES_GESAUTORIZA}

let cont++ ;
done

mvn_get_app_release   MenuCGA_CEAR ${VERSION_ARQOS_MVN_MENU_CGA_RELEASE} ${RUTA_NEXUS_RELEASES_GESAUTORIZA}

mvn_get_app_release   MAPFRE_REST_DISPATCHER_FEAR ${VERSION_ARQOS_MVN_REST_DISPATCHER_RELEASE} ${RUTA_NEXUS_RELEASES_REST_DISPATCHER}


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
