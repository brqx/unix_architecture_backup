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
#- cvrlist
#-------------------------------------------------------------------
# Ejemplo base: 
#-------------------------------------------------------------------
# cvrlist MAPFRE_ARQOS_ENV_DIST
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

#- Saca el listado de las ramas del proyecto del CVS indicado
#- Debe especificarse el CVSROOT correcto antes de invocarle
cvrlist()
{

#- Listado de las ramas del proyecto
# cvs rlog -r MAPFRE_ARQOS_COMMONS_DIST 

PROYECTO=${1} ;

#- Si no se le dice proyecto, sacamos MAPFRE_ARQOS_COMMONS_DIST

if [ "${PROYECTO}" == "" ] ; then
PROYECTO=MAPFRE_ARQOS_COMMONS_DIST
fi

echo " Hacemos captura de las ramas del proyecto : ${PROYECTO}"

LISTADO=$( cvs rlog -r ${PROYECTO} 2> /dev/null  | tr  "\t" " " | tr -d " " | grep "^v" | cut -d ":" -f1  | sort -u  )

##cvs rlog -r ${PROYECTO} 2> /dev/null  | tr  "\t" " " | tr -d " " | grep "^v" | cut -d ":" -f1  | sort -u

echo "--------------------------------------------------"
echo "Listado CVS : ${URL_CVS_MAPFRE}:${REPOSITORIO_01}"
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
echo "Ramas del proyecto : ${PROYECTO}"
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
echo $LISTADO | tr " " "\n"
echo "--------------------------------------------------"

}


#--------------------------------------------------------

cvrlist_out()
{

#- Listado de las ramas del proyecto
# cvs rlog -r MAPFRE_ARQOS_COMMONS_DIST 

PROYECTO=${1} ;

#- Si no se le dice proyecto, sacamos MAPFRE_ARQOS_COMMONS_DIST

if [ "${PROYECTO}" == "" ] ; then
PROYECTO=MAPFRE_ARQOS_COMMONS_DIST
fi

LISTADO=$( cvs rlog -r ${PROYECTO} 2> /dev/null  | tr  "\t" " " | tr -d " " | grep "^v" | cut -d ":" -f1  | sort -u  )

echo $LISTADO 

}


