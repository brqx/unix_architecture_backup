#!/usr/bin/bash
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
CONCEPT_CARACTER_04="especifico"
CONCEPT_MOLDE_04="script"
CONCEPT_PRODUCTO_04="mysql"
CONCEPT_ARQUETIPO_04="database"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_CARACTER_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-==================================================================
#+ Variables Especificas de las plataformas - Nivel 02
#-==================================================================
#-==================================================================
#+ Funciones definidos:
#-------------------------------------------------------------------
#- Funciones Requeridas
#-------------------------------------------------------------------
#+ Ejemplos 
#-------------------------------------------------------------------
#  db_restore za_d50pelona
#-==================================================================

#- Carga la funcion que hace el restore de la BBDD y la ejecuta
#
#- + Recibe como parametro la cadena de la BBDD a crear

CADENA_BD_RESTORE=$1

RUTA_FUNCION_RESTORE=${SD_MYSQL}/s03_funciones/databases/local/simple/s11_db_uniq_restore.f

#- Cargamos la funcion para utilizarla en el servidor remoto
. ${RUTA_FUNCION_RESTORE}

db_restore ${CADENA_BD_RESTORE}


