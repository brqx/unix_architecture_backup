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
CONCEPT_CARACTER_04="especifico"
CONCEPT_MOLDE_04="funciones"
CONCEPT_PRODUCTO_04="mysql"
CONCEPT_ARQUETIPO_04="simple"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_CARACTER_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-==================================================================
#+ Funciones Especificas de las plataformas - Mysql - Nivel 04
#-==================================================================
#- Sincroniza la base de datos indicada en el servidor indicado
#-==================================================================
#+ Funciones definidos:
#-------------------------------------------------------------------
#-- dbs_genera_cadena
#-------------------------------------------------------------------
#- Funciones Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#- Ejemplo
#-------------------------------------------------------------------
#-- dbs_genera_cadena cinco p50 cinco
#-------------------------------------------------------------------
#-- Estado : Pendiente - Pensado - [Codificado] - Linkado - Probado
#-==================================================================

#
dbs_genera_cadena()
{
entorno=${1};
variante=${2};
proyecto=${3};

database="${entorno}${variante}${proyecto}" ;

RETFN=$database ;

}