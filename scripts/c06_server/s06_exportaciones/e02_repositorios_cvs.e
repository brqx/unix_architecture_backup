#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.1"          #  Version del Script actual
FECHA_SCRIPT="Octubre 2010"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_MOLDE_04="exportaciones"
CONCEPT_PRODUCTO_04="server"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04}  ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-==================================================================
#+ Variables definidas:
#-------------------------------------------------------------------
#-- URLS - REPOSITORIOS - BIBLIOTECAS - VERSIONES
#-------------------------------------------------------------------

export URL_CVS_MAPFRE URL_SVN_MAPFRE CVSROOT CVSFOLDER

export REPOSITORIO_01 REPOSITORIO_02 REPOSITORIO_03 REPOSITORIO_04

export BBDD_CADENA_01 BBDD_CADENA_02

export BIBLIOTECAS_LOCALES	BIBLIOTECAS_MAVEN ARTEFACTOS_MAVEN

export HISTORICO_BIBLIOTECAS_MAVEN HISTORICO_ARTEFACTOS_MAVEN

export RUTA_NEXUS_GLOBAL RUTA_NEXUS_RELEASES RUTA_NEXUS_SNAPSHOTS

export RUTA_NEXUS_RELEASES_LIBS RUTA_NEXUS_SNAPSHOTS_LIBS

export RUTA_NEXUS_RELEASES_APPS RUTA_NEXUS_SNAPSHOTS_APPS

export RUTA_NEXUS_RELEASES_GESAUTORIZA RUTA_NEXUS_SNAPSHOTS_GESAUTORIZA

export VERSION_ARQOS VERSION_ARQOS_MVN 

export VERSION_ARQOS_MVN_RELEASE VERSION_ARQOS_MVN_SNAPSHOT

export VERSION_ARQOS_MVN_APPS_RELEASE VERSION_ARQOS_MVN_APPS_SNAPSHOT

export VERSION_ARQOS_MVN_GESAUTORIZA_RELEASE VERSION_ARQOS_MVN_GESAUTORIZA_SNAPSHOT

export VERSION_ARQOS_MVN_MENU_CGA_RELEASE VERSION_ARQOS_MVN_MENU_CGA_SNAPSHOT

export VERSION_ARQOS_MVN_LIBS_RELEASES VERSION_ARQOS_MVN_LIBS_SNAPSHOT

export ARQ ARQV2




