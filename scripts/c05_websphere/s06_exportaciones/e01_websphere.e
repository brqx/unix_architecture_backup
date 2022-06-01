#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 7.1"          #  Version del Script actual
FECHA_SCRIPT="Febrero 2012"
#-------------------------------------------------------------------
LEVEL_NIVEL=04
CONCEPT_MOLDE="exportaciones"
CONCEPT_ARQUETIPO="acceso"
CONCEPT_PRODUCTO="websphere"
CONCEPT_LEVEL="Script ${CONCEPT_MOLDE} ${CONCEPT_ARQUETIPO}"
CONCEPT_LEVEL="${CONCEPT_LEVEL} ${CONCEPT_PRODUCTO}"
#-==================================================================
#- Zona Exportaciones Cooherente
#-==================================================================

#-------------------------------------------------------------------
#- DMGR - valores adaptables a multiples topologias
#-------------------------------------------------------------------

#-Valores para core
export ADMIN_DMGR_HOST ADMIN_DMGR_PORT ADMIN_DMGR_USER ADMIN_DMGR_PASS

#-Valores para celda nodo server
export WEBSPHERE_CELL WEBSPHERE_NODO WEBSPHERE_SERVER WEBSPHERE_APPS

#- Acceso a los bin
export WSPH_CELL WSPH_NODO WSPH_SERVER


#-------------------------------------------------------------------
#- Productos - IBM Websphere
#-------------------------------------------------------------------
export WEBSPHERE_HOME WPS_HOME WBM_HOME WAS_HOME WAS_JAVA_HOME
export WAS_SERVER_INDEX_FILE
#-------------------------------------------------------------------
#- Process Server
#-------------------------------------------------------------------
export WPS_RUN WPS_PF WPS_PM WPS_PG 

#-------------------------------------------------------------------
#- Business Monitor
#-------------------------------------------------------------------
export WBM_RUN WBM_PF WBM_PM WBM_PG WBM_CC

#-------------------------------------------------------------------
#+ Sistema de trazado N2 - desactivado
#-------------------------------------------------------------------
#N3# echo "$LEVEL_NIVEL - Ejecutadas $CONCEPT_LEVEL"
#-------------------------------------------------------------------

#-==================================================================
#+ Vaciado de Variables
#-------------------------------------------------------------------
CONCEPT_CARACTER=
CONCEPT_MOLDE=
CONCEPT_ARQUETIPO=
CONCEPT_PRODUCTO=
CONCEPT_LEVEL=
#-==================================================================

