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
# Lista todas las BBDD del servidor
#-==================================================================
#+ Funciones definidos:
#-------------------------------------------------------------------
#-- dbg_lista_databases
#-------------------------------------------------------------------
#+ Ejemplo
#-------------------------------------------------------------------
#-- Lista todas las BBDD pasadas
#-------------------------------------------------------------------
#-- Estado : [Pendiente] - Pensado - Codificado - Linkado - Probado
#-==================================================================

#alias ldb - db_list
dbg_list_databases()
{
# Listado databases
mysql -s -e "show databases"
}


