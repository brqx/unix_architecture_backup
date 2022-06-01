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
#-Ej: p3 java --> Lista los procesos java con toda la orden del comando
p3()
{
FILTRO_PASADO=$1 ;
ps axfwww | grep  "${FILTRO_PASADO}" | tr -s " " 2> /dev/null ;

}


