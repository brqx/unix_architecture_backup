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
#- cvslist
#-------------------------------------------------------------------
# Ejemplo base:
#-------------------------------------------------------------------
# Informacion
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

#- Saca el listado del proyecto del CVS indicado
cvslist()
{
##export CVSROOT=:ext:ricabel@cvs.es.mapfre.net:/repositorio_cvs/MAPINFO/ARQOS
##cvs checkout MAPFRE_ARQOS_COMMONS_DIST

PROYECTO=$1

CVSROOT=:ext:ricabel@${URL_CVS_MAPFRE}:${REPOSITORIO_01}
CVSROOT_COMMAND=:ext:ricabel:brqxHH18@${URL_CVS_MAPFRE}:${REPOSITORIO_01}
CVS_PASSWORD=brqxHH18

export CVSROOT CVS_PASSWORD CVSROOT_COMMAND

##cvs checkout -c ${PROYECTO}

##$HOME/.cvspass

##cvs -list ${PROYECTO}

}
