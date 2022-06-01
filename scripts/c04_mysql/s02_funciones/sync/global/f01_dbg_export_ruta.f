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
CONCEPT_PRODUCTO_04="mysql"
CONCEPT_ARQUETIPO_04="global"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-==================================================================
#+ Funciones Especificas de las plataformas - Mysql - Nivel 04
#-==================================================================
#- Exporta todas las BBDD del servidor en una ruta indicada por la 
#  fecha actual:b_20_09
#-==================================================================
#+ Funciones definidos:
#-------------------------------------------------------------------
#-- dbg_export_currentdate
#-------------------------------------------------------------------
#- Funciones Requeridas
#-------------------------------------------------------------------
#-- dbg_export_databases
#-------------------------------------------------------------------
#-- Estado : Pendiente - Pensado - [Codificado] - Linkado - Probado
#-==================================================================

#alias pendiente
dbg_export_currentdate()
{

CARPETA_DESTINO=$1


#esta funcion igual no tiene sentido y hay que reajustarla

if [ "${CARPETA_DESTINO}" != "" ] ; then

get_path_for_backup ${CUENTA} ${PROYECTO} ${SERVIDOR_LOCAL} ${RUTA_BASE}

mkdir -p ${BACKUP_PATH_ORIGEN}

dbg_export_databases ${BACKUP_PATH_ORIGEN}

else
#- No se le pasa bbdd

echo "=================================================="
echo " Script dbg_export_currentdate - Error de parametros		"
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=="
echo " Formato :					"
echo "--------------------------------------------------"
echo  "dbg_export_currentdate <carpeta_destino>				"
echo "=================================================="





fi

}