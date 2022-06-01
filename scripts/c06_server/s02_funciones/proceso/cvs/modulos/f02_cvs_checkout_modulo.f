#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2010
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.0"          #  Version del Script actual
FECHA_SCRIPT="Febrero 2010"
#-------------------------------------------------------------------
LEVEL_NIVEL=04
CONCEPT_PRODUCTO="server"
CONCEPT_MOLDE="funcion"
CONCEPT_ARQUETIPO="proceso"
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

#- Hace un checkout del modulo indicado como parametro
cvsco()
{
##export CVSROOT=:ext:ricabel@cvs.es.mapfre.net:/repositorio_cvs/MAPINFO/ARQOS
##cvs checkout MAPFRE_ARQOS_COMMONS_DIST

#- Obtener toda la rama
##cvs checkout -r v0_0_0_3 MAPFRE_ARQOS_COMMONS_DIST

PROYECTO=$1

CVSROOT=:ext:ricabel@${URL_CVS_MAPFRE}:${REPOSITORIO_01}

export CVSROOT 

cvs checkout ${PROYECTO}


}
