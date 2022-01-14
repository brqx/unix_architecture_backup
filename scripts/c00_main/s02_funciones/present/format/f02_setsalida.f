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
#-- brqx_setsalida_adv
#-------------------------------------------------------------------

##-- FUNCIONES COMUNES
#- =====================

brqx_setsalida_adv() 
{
PRODUCTO=$1 ;
PUERTO=$2   ;
FILTRO=$3   ;
ARCHIVO=$4  ;
COMANDO=$5  ;

clear ;
echo "================================================================" ;
echo "Log del $PRODUCTO - PUERTO $PUERTO " ;
#-------------------------------------------------------------------
echo "Version Script : $VERSION_SCRIPT - $FECHA_SCRIPT" ;
echo "----------------------------------------------------------------" ;
echo "Comando : $COMANDO" ;
echo "--------------------------------------------------------------" ;
echo "Filtro $MEDIDA_FILTRO - \"$FILTRO\" ";
echo "Archivo - $ARCHIVO";
echo "================================================================" ;
}

