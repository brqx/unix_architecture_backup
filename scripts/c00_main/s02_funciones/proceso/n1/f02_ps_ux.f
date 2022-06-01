#!/usr/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 2.0"          #  Version del Script actual
FECHA_SCRIPT="Enero 2011"
#-==================================================================
#+ Funciones:
#-------------------------------------------------------------------
#-Ej: p2 java --> Lista los procesos java con toda la orden del comando
p2()
{
FILTRO_PASADO=$1 ;
ps -uwwwwwwwwwwwwx | grep  "${FILTRO_PASADO}" 2> /dev/null ;

}


