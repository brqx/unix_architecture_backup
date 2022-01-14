#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2010
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.0"          #  Version del Script actual
FECHA_SCRIPT="Febrero 2010"
#-------------------------------------------------------------------
LEVEL_NIVEL=04
CONCEPT_PRODUCTO="cpanel"
CONCEPT_MOLDE="alias"
CONCEPT_ARQUETIPO="fichero"
CONCEPT_LEVEL="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} "
#-==================================================================
# Funciones definidas:
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#- cvrfolder
#-------------------------------------------------------------------
# Ejemplo base: 
#-------------------------------------------------------------------
# cvrlist MAPFRE_ARQOS_ENV_DIST
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

#- Saca el listado de las ramas del proyecto del CVS indicado
#- Se debe haber indicado como CVSROOT
cvrfolder()
{

#- Listado de las ramas del proyecto a nivel de una carpeta - Sin conectarse al cvs
# cvs rlog -r MAPFRE_ARQOS_COMMONS_DIST 

PROYECTO=${1} ;
CVSFOLDER=${2} ;

if [ "${PROYECTO}" == "" ] ; then
#- Si no se le dice proyecto, sacamos MAPFRE_ARQOS_COMMONS_DIST

PROYECTO=MAPFRE_ARQOS_COMMONS_DIST
CVSFOLDER=${NASDESA}

else
#- Se ha pasado proyecto

if [ "${CARPETA}" == "" ] ; then
CVSFOLDER=${NASDESA}
fi

fi

CARPETA=${CVSFOLDER}${PROYECTO}-desarrollo

echo " Hacemos captura de las ramas del proyecto : ${PROYECTO}"

LISTADO=$( ls -1 ${CARPETA} )

echo "--------------------------------------------------"
echo "Listado IntegracionCVS : ${CVSFOLDER} "
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
echo "Ramas del proyecto : ${PROYECTO}"
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
echo $LISTADO | tr " " "\n"
echo "--------------------------------------------------"

}
