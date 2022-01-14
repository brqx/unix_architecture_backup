#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.2"          #  Version del Script actual
FECHA_SCRIPT="Marzo 2012"
#-------------------------------------------------------------------
LEVEL_NIVEL=04		# Variable control profundidad alcanzada
LEVEL_NIVEL_04=04	# Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_MOLDE_04="variables"
CONCEPT_PRODUCTO_04="mysql"
CONCEPT_ARQUETIPO_04="global"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-==================================================================
#+ Variables definidas
#-------------------------------------------------------------------
#-- DB_GLOBAL_EXPORT - DB_GLOBAL_IMPORT
#-------------------------------------------------------------------
#-- DB_GLOBAL_SYNC_IN - DB_GLOBAL_SYNC_OUT
#-==================================================================

#-SERVER_CHANGE-  -- Cambios especificos de servidor

#- Cuando llega qui no conoce BRQX_BK
#- Ruta global exportaciones (DEAD BACKUP)
DB_GLOBAL_EXPORT=/brqx/backup/export/

#- Ruta global importaciones (DEAD BACKUP)
DB_GLOBAL_IMPORT=/brqx/backup/import/

#- Ruta global sincronizaciones (DEAD BACKUP)
DB_GLOBAL_SYNC_IN=${BRQX_BK}sync/in

#- Ruta global sincronizaciones (DEAD BACKUP)
DB_GLOBAL_SYNC_OUT=${BRQX_BK}sync/out

#-------------------------------------------------------------------
