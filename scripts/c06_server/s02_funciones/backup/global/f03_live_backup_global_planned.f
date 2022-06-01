#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2010
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.1"          #  Version del Script actual
FECHA_SCRIPT="Diciembre 2010"
#-------------------------------------------------------------------
LEVEL_NIVEL=04		# Variable control profundidad alcanzada
LEVEL_NIVEL_04=04	# Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_MOLDE_04="funciones"
CONCEPT_PRODUCTO_04="cpanel"
CONCEPT_ARQUETIPO_04="global"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-==================================================================
#+ Funciones Especificas de las plataformas - Mysql - Nivel 04
#-==================================================================
#- Hace un backup global del servidor (BD + Filesystem)
#-- Se me ocurren dos opciones
#-- + Planificado
#-==================================================================
#+ Funciones definidos:
#-------------------------------------------------------------------
#-- live_backup_global_planned
#-------------------------------------------------------------------
#- Funciones Requeridas
#-------------------------------------------------------------------
#-- dbg_export_databases
#-==================================================================

#- Hace un backup de la informacion ya almacenada en las carpetas 
#  de exportacion

#alias 
live_backup_global_planned()
{

SERVIDOR=$(uname -n |  tr '[:upper:]' '[:lower:]' )

echo "Backup Global del servidor ${SERVIDOR} - PLANNED      "
echo "------------------------------------------------------"
# Hay que hacer un backup de la BBDD

## BBDD

# 3. Sincronizar BBDD con servidor Backup (solo archivos)

dbg_sync

## FILESYSTEM

# 2. Sincronizar Files (la opcion seria 

syp_global -- Sincroniza comprimiendo

}