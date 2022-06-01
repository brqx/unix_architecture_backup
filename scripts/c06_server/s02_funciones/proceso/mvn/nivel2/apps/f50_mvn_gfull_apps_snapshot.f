#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.3"          #  Version del Script actual
FECHA_SCRIPT="Octubre 2012"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="function"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- mvn_gfull_apps_snapshot
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
#E mvn_gfull_apps_snapshot 11_2 -- Obtiene la version 11_2 de las aplicaciones
#-------------------------------------------------------------------
#E mvn_gfull_apps_snapshot		-- Obtiene la ultima version de las aplicaciones
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Alias mvgfull
mvn_gfull_apps_snapshot()
{
IS_mvn_gfull_apps_snapshot="Descarga todos los artefactos para la version indicada"
INFO_SCRIPT=${IS_mvn_gfull_apps_snapshot}

VERSION=${1}

if [ "${VERSION}" == "" ]; then
	VERSION=${VERSION_ARQOS_MVN_SNAPSHOT}
fi

if [ "${VERSION}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt mvn_gfull_apps_snapshot "[version]"

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

GESAUTORIZA[0]=GESAUTORIZA_CEAR
GESAUTORIZA[1]=GESAUTORIZA_FEAR

EVT[0]=EVT21_GPT_Acuerdos_SMEDApp
EVT[1]=EVT21_GPT_CatalogoMaestros_SMEDApp
EVT[2]=EVT21_GPT_ClausulasYTextos_SMEDApp
EVT[3]=EVT21_GPT_Coberturas_SMEDApp
EVT[4]=EVT21_GPT_CondicionadoGeneral_SMEDApp
EVT[5]=EVT21_GPT_CtrlTecnicos_SMEDApp
EVT[6]=EVT21_GPT_Descuentos_SMEDApp
EVT[7]=EVT21_GPT_FigPctes_SMEDApp
EVT[8]=EVT21_GPT_InfEspecif_SMEDApp
EVT[9]=EVT21_GPT_InformacionGeneral_SMEDApp
EVT[10]=EVT21_GPT_PlanesPago_SMEDApp
EVT[11]=EVT21_GPT_ProductosComerciales_SMEDApp
EVT[12]=EVT21_GPT_Sptos_SMEDApp
EVT[13]=EVT21_GPT_Tarifas_SMEDApp


max_taller=5
max_gesautoriza=2
#max_evt=14
max_evt=0

cont=0
#-- Aplicaciones Taller
while [ ${cont} -lt ${max_taller} ] ; do

##echo "Lib : ${LIBRERIA[${cont}]} "

mvn_get_app_snapshot   ${APP[${cont}]} ${VERSION}

let cont++ ;
done

cont=0
#-- Aplicacion GESAUTORIZA
while [ ${cont} -lt ${max_gesautoriza} ] ; do

##echo "Lib : ${LIBRERIA[${cont}]} "

mvn_get_app_snapshot   ${GESAUTORIZA[${cont}]} ${VERSION_ARQOS_MVN_GESAUTORIZA_SNAPSHOT} ${RUTA_NEXUS_SNAPSHOTS_GESAUTORIZA}

let cont++ ;
done

mvn_get_app_snapshot   MenuCGA_CEAR ${VERSION_ARQOS_MVN_MENU_CGA_SNAPSHOT} ${RUTA_NEXUS_SNAPSHOTS_GESAUTORIZA}

mvn_get_app_snapshot   MAPFRE_REST_DISPATCHER_FEAR ${VERSION_ARQOS_MVN_REST_DISPATCHER_SNAPSHOT} ${RUTA_NEXUS_SNAPSHOTS_REST_DISPATCHER}

#- Aplicaciones Emision

cont=0
#-- Aplicacion GESAUTORIZA
while [ ${cont} -lt ${max_evt} ] ; do

##echo "Lib : ${LIBRERIA[${cont}]} "

mvn_get_app_snapshot   ${EVT[${cont}]} ${VERSION_ARQOS_MVN_EVT21_SNAPSHOT} ${RUTA_NEXUS_SNAPSHOTS_EVT21}

let cont++ ;
done



#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------
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
