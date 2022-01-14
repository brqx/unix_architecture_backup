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
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_CARACTER_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-==================================================================
#+ Funciones Especificas de las plataformas - Mysql - Nivel 04
#-==================================================================
#- Hace un backup global del servidor (BD + Filesystem)
#-- Se me ocurren dos opciones
#-- + Bajo demanda
#-- + Planificado
#-==================================================================
#+ Funciones definidos:
#-------------------------------------------------------------------
#-- dead_backup_global_instant
#-------------------------------------------------------------------
#- Funciones Requeridas
#-------------------------------------------------------------------
#-- dbg_export_databases
#-==================================================================

#alias bkg
live_backup_global_instant()
{

echo "Backup Servidor 1"
echo "------------------------------------------------------"
# Hay que hacer un backup de la BBDD

## BBDD
# 1. Limpiar BBDD

dbg_clean

# 2. Exportar BBDD

dbg_export

# 3. Sincronizar BBDD con servidor Backup (solo archivos)

dbg_sync

## FILESYSTEM

# 1. Limpiar logs

fs_cleanlog

# 2. Sincronizar Files (la opcion seria 

syp_global -- Sincroniza comprimiendo
syn_global -- Sincroniza sin comprimir

}