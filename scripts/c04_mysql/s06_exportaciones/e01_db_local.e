#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.1"          #  Version del Script actual
FECHA_SCRIPT="Enero 2011"
#-------------------------------------------------------------------
LEVEL_NIVEL=04		# Variable control profundidad alcanzada
LEVEL_NIVEL_04=04	# Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_MOLDE_04="exportaciones"
CONCEPT_PRODUCTO_04="mysql"
CONCEPT_ARQUETIPO_04="global"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_CARACTER_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-==================================================================
#+ Variables Especificas de las plataformas - Nivel 02
#-==================================================================

#- Ruta global exportaciones (DEAD BACKUP)
export DB_GLOBAL_EXPORT DB_GLOBAL_IMPORT DB_GLOBAL_SYNC_IN DB_GLOBAL_SYNC_OUT

#- Exportaciones que se actualizan para cada site

export DB_LIVE_BACKUP_REMOTE	DB_GLOBAL_SERVER

