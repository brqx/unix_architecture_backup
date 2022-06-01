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
#-- dbg_export_currentdate
#-------------------------------------------------------------------
#- Funciones Requeridas
#-------------------------------------------------------------------
#-- dbg_export_databases
#-------------------------------------------------------------------
#- Ejemplo
#-------------------------------------------------------------------
#-- dbs_lanza_xyncdb ${BD1} ${BD2} ${DB_SERVER_DESTINO} ${ENTORNO_DESTINO}  ${ENTORNO_DESTINO};
#-==================================================================

#alias lxydb
dbs_lanza_xyncdb()
{

##-- DATOS LOCALES

#-boda p50 boda
ENTORNO_LOCAL=$1
VARIANTE_LOCAL=$2
PROYECTO_LOCAL=$3

##-- DATOS REMOTOS

#-boda zc b10_o10_ boda -- ibrqx.com

DB_SERVER_DESTINO=$7
ENTORNO_DESTINO=$4
VARIANTE_DESTINO=$5
PROYECTO_DESTINO=$6


dbs_genera_cadena ${ENTORNO_LOCAL} ${VARIANTE_LOCAL} ${PROYECTO_LOCAL}
BD1=$RETFN
dbs_genera_cadena ${ENTORNO_DESTINO} ${VARIANTE_DESTINO} ${PROYECTO_DESTINO}
BD2=$RETFN

echo "Transferencia Ebrqx: ${BD1} ${DB_SERVER_DESTINO} : ${BD2} "

dbs_xyncdb ${BD1} ${BD2} ${DB_SERVER_DESTINO} ${ENTORNO_LOCAL} ${ENTORNO_DESTINO};


}