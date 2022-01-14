#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.1"          #  Version del Script actual
FECHA_SCRIPT="Diciembre 2011"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
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
#- Hace un backup de la carpeta opt del servidor 
#- Se pasa por parametro la ruta destino, sino sera /opt/backup
#-- 
#-==================================================================
#+ Funciones definidos:
#-------------------------------------------------------------------
#-- optbk
#-------------------------------------------------------------------
#- Funciones Requeridas
#-------------------------------------------------------------------
#-- 
#-==================================================================

#alias bkg
folderbk()
{
CARPETA_PASADA=$1

SERVIDOR=$(uname -a | cut -d " " -f2 | cut -c "10-")
FECHA=$(date "+%m%y")

if [ "${CARPETA_PASADA}" != "" ] ; then
# Se pasa una carpeta destino
echo "Se hara el backup en la carpeta : ${CARPETA_PASADA}"

else
#Se indica que se requiere un site como parametro
CARPETA_PASADA=/opt/backup/

fi

Backup de opt del mes actual
tar zcpvf ${CARPETA_PASADA}bopt_${SERVIDOR}_${FECHA}.tar.gz $(ls -1 | grep -v backup | tr "\n" " ")

}

