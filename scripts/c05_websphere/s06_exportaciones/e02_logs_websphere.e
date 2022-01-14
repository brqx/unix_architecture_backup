#!/usr/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2010
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.0"          #  Version del Script actual
FECHA_SCRIPT="Octubre 2010"
#-------------------------------------------------------------------
LEVEL_NIVEL=04
CONCEPT_CARACTER="especifico"
CONCEPT_MOLDE="exportaciones"
CONCEPT_ARQUETIPO="acceso"
CONCEPT_PRODUCTO="websphere"
CONCEPT_LEVEL="Script ${CONCEPT_MOLDE} ${CONCEPT_ARQUETIPO}"
CONCEPT_LEVEL="${CONCEPT_LEVEL} ${CONCEPT_PRODUCTO} ${CONCEPT_CARACTER}"
#-==================================================================
#- Zona Exportaciones Cooherente
#-==================================================================


#- Exportaciones celda nodo servidor
export LOGS_CELL LOGS_NODO LOGS_SERVER

#- Exportaciones especificas
export LOGS_CORE LOGS_FRON

#- Exportaciones arquitectura
export WPS_LOGS_MAVEN WPS_LOGS_APLICACIONES

#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#- Exportaciones datos multiperfil
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

#-------------------------------------------------------------------
#- Logs Generales - Perfil por defecto 
#-------------------------------------------------------------------
export WPS_LOGS WPS_STARTLOGS

#-------------------------------------------------------------------
#- EXP  perfiles  - 01 - 02 - 03 - 04
#-------------------------------------------------------------------

export PERFIL_01 PERFIL_02 PERFIL_03 PERFIL_04


#-------------------------------------------------------------------
#- Logs perfiles  - 01 - 02 - 03 - 04
#-------------------------------------------------------------------

export WPS_LOGP1 WPS_SLOGP1 WPS_LOGP2 WPS_SLOGP2
export WPS_LOGP3 WPS_SLOGP3 WPS_LOGP4 WPS_SLOGP4

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

