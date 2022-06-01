#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2007
#-------------------------------------------------------------------
VERSION_SCRIPT="V 2.0"          #  Version del Script actual
FECHA_SCRIPT="Septiembre 2007"
#-==================================================================
#+ Funciones:
#-------------------------------------------------------------------
#-- brqx_setfiltro_adv
#-------------------------------------------------------------------

##-- FUNCIONES COMUNES
#- =====================

brqx_setfiltro_adv() {
echo "Entrando en filtro";
if   [ "$1" = "m" ] ; then
#echo "Pasado minutos";
MEDIDA_FILTRO=Minutos
FILTRO=`date "+%H:%M"` ;
elif [ "$1" = "d" ] ; then
#echo "Pasado dmin";
MEDIDA_FILTRO=DiezMinutos
FILTRO=`date "+%H:%M" | cut -c1-4` ;
#elif [ "$1" = "h" ] ; then
else
#echo "Pasado horas";
MEDIDA_FILTRO=Horas
FILTRO=`date "+%H:"` ;
fi ;
return $FILTRO $MEDIDA_FILTRO;
}

