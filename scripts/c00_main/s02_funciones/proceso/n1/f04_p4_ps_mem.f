#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 2.0"          #  Version del Script actual
FECHA_SCRIPT="Enero 2011"
#-==================================================================
#+ Funciones:
#-------------------------------------------------------------------

#-alias psmem
p4()
{
FILTRO_PASADO=$1 ;
ps -e -orss=,args= | sort -b -k1,1n | pr -TW$COLUMNS | grep  "${FILTRO_PASADO}" 

}


