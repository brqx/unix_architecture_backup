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
#- cvlfolder
#-------------------------------------------------------------------
# Funciones requeridas:
#-------------------------------------------------------------------
#- cvrlist_out
#-------------------------------------------------------------------
# Ejemplo base: 
#-------------------------------------------------------------------
# cvlfolder MAPFRE_ARQOS_ENV_DIST
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

#- Saca el listado de las ramas del proyecto del CVS indicado que no estan en el folder
#- Debe especificarse el CVSROOT correcto antes de invocarle
cvlfolder()
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

if [ "${CVSFOLDER}" == "" ] ; then
CVSFOLDER=${NASDESA}
fi

fi

CARPETA_NAS=${CVSFOLDER_NAS}${PROYECTO}
CARPETA_NDESA=${CVSFOLDER_NDESA}${PROYECTO}-desarrollo
CARPETA_LOCAL=/home/ibm/bibliotecas_local/${PROYECTO}

LISTADO_NAS=$( ls -1 ${CARPETA_NAS} | tr "\n" " " )
LISTADO_NDESA=$( ls -1 ${CARPETA_NDESA} | tr "\n" " " )
LISTADO_LOCAL=$( ls -1 ${CARPETA_LOCAL} | tr "\n" " " )

#- CVS TECNOLOGIA
LISTADO_CVS_TEC=$( cvrlist_out ${PROYECTO} )

#- CVS ARQUITECTURA
CVSROOT=${CVSROOT_ARQUITECTURA}
LISTADO_CVS_TEC=$( cvrlist_out ${PROYECTO} )


echo "--------------------------------------------------"
echo "Listado IntegracionCVS : ${CVSFOLDER} "
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
echo "Ramas del proyecto : ${PROYECTO}"
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
echo "NAS    : $LISTADO_NAS									  "
echo "NDESA	 : $LISTADO_NDESA									  "
echo "CVS_T  : $LISTADO_CVS_TEC								  "
echo "CVS_A  : $LISTADO_CVS_ARQ								  "
echo "LOCAL	 : $LISTADO_LOCAL									  "
echo "--------------------------------------------------"

}
