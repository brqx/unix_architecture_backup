#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 7.1"          #  Version del Script actual
FECHA_SCRIPT="Octubre 2012"
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
#-- ARQ - ARQV2
#-------------------------------------------------------------------
#-- BIBLIOTECAS_LOCALES - BIBLIOTECAS_MAVEN - ARTEFACTOS_MAVEN
#-------------------------------------------------------------------
#-- LOGS_APLICACIONES_ARQUITECTURA - WPS_LOGS_APLICACIONES
#-------------------------------------------------------------------

#-SERVER_CHANGE-  -- Cambios especificos de servidor

#-- Usuarios generales del servidor

COMMON_SERVER_USER=ricabel
COMMON_SERVER_GROUP=users

#-- Usuario de Apache

APACHE_SERVER_USER=httprun
APACHE_SERVER_GROUP=apps

