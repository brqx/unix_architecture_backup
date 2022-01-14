#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2013
#-------------------------------------------------------------------
VERSION_SCRIPT="V 7.4"          #  Version del Script actual
FECHA_SCRIPT="Enero 2013"
#-------------------------------------------------------------------
LEVEL_NIVEL=04		# Variable control profundidad alcanzada
LEVEL_NIVEL_04=04	# Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_MOLDE_04="variables"
CONCEPT_PRODUCTO_04="server"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04}  ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-==================================================================
#+ Variables definidas:
#-------------------------------------------------------------------
#-- VERSION_ARQOS - VERSION_ARQOS_MVN - VERSION_ARQOS_MVN_RELEASE
#-------------------------------------------------------------------

#-- Version descarga MAVEN 2012

#-SERVER_CHANGE-  -- Cambios especificos de servidor

#-- Tenemos 4 versiones dos para librerias y dos para apps

#--      A P L I C A C I O N E S     --

#--- App Last Release
#VERSION_ARQOS_MVN_APPS_RELEASE=12_1_0
VERSION_ARQOS_MVN_APPS_RELEASE=12_2_1

#--- App Last Snapshot 10/07/2012
VERSION_ARQOS_MVN_APPS_SNAPSHOT=13_1_0
#VERSION_ARQOS_MVN_APPS_SNAPSHOT=12_2_0


#--- App Last Release Rest Dispatcher 17/10/2012
VERSION_ARQOS_MVN_REST_DISPATCHER_RELEASE=1_0_0
#--- App Last Snapshot Rest Dispatcher 17/10/2012
VERSION_ARQOS_MVN_REST_DISPATCHER_SNAPSHOT=1_0_0


#--- Gesautoriza Last Release 10/07/2012
VERSION_ARQOS_MVN_GESAUTORIZA_RELEASE=1_0_0
#--- Gesautoriza Last Snapshot 10/07/2012
VERSION_ARQOS_MVN_GESAUTORIZA_SNAPSHOT=1_0_1

#com.mapfre.dgtp.otcid.productos

#--- Gesautoriza Last Release 10/07/2012
VERSION_ARQOS_MVN_MENU_CGA_RELEASE=0_0_2
#--- Gesautoriza Last Snapshot 10/07/2012
VERSION_ARQOS_MVN_MENU_CGA_SNAPSHOT=0_0_2
#VERSION_ARQOS_MVN_APPS_SNAPSHOT=0_0_1

#--- Gesautoriza Last Release 10/07/2012
VERSION_IARQOS_AREA_CLIENTES=0_0_1
#--- Gesautoriza Last Snapshot 10/07/2012

#--- EVT21 Emision Last Release 14/01/2013
VERSION_ARQOS_MVN_EVT21_RELEASE=1_0_0
#--- EVT21 Emision Last Snapshot 14/01/2013
VERSION_ARQOS_MVN_EVT21_SNAPSHOT=0_7_0


#--- TallerRules Release 14/01/2013
VERSION_TALLER_RULES_RELEASE=1_0_0
#--- TallerRules Snapshot 14/01/2013
VERSION_TALLER_RULES_SNAPSHOT=1_0_0


#--        L I B R E R I A S         --

#--- Lib Last Release RC2
#VERSION_ARQOS_MVN_LIBS_RELEASE=12_2_0
VERSION_ARQOS_MVN_LIBS_RELEASE=12_2_2


#--- Lib Last Snapshot - pilla esta para la actualizacion de servidores
#VERSION_ARQOS_MVN_LIBS_SNAPSHOT=12_2_2
VERSION_ARQOS_MVN_LIBS_SNAPSHOT=13_1_0

#-- A R Q O S - - S E R V I D O R E S --

#- La version ARQOS es la version usada en los servidores con la V
#- En principio la equiparamos a la snapshot ultima

VERSION_ARQOS=v${VERSION_ARQOS_MVN_LIBS_SNAPSHOT}

#-Version general de Maven - Snapshots
VERSION_ARQOS_MVN=v${VERSION_ARQOS_MVN_LIBS_SNAPSHOT}

