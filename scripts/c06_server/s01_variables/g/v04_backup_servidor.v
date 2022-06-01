#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 7.2"          #  Version del Script actual
FECHA_SCRIPT="Marzo 2012"
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
#-- BRQX_BK - BRQX_BKDB - BRQX_BKFS
#-------------------------------------------------------------------

#SC-SERVER_CHANGE-  -- Cambios especificos de servidor

#-Ruta global para backups
#- Se deben basar en ella tanto FS como DB
BRQX_BK=/brqx/backup/

#-Definimos otras dos rutas globales posibles

#-Posible ruta global para DB - Base de datos
BRQX_BKDB=${BRQX_BK}db/

#-Posible ruta global para FS - File System
BRQX_BKFS=${BRQX_BK}fs/


#-------------------------------------------------------------------
