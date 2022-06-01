#!/usr/bin/bash 
#------------------------------------------------------------------- 
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2010
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.0"          #  Version del Script actual
FECHA_SCRIPT="Enero 2010"
#-==================================================================
#+ Funciones:
#-------------------------------------------------------------------
#- creasub      : Crea un nuevo subdominio
#-------------------------------------------------------------------

#-Ej: creasub zb pelotas

listasub()
{
#- La gestion de parametros la hace php

> ${PWD}/error_log

RUTA_FUNCIONES_PHP=/brqx/arquitectura/unix/scripts/depend/c02_cpanel/funciones/subdominios/php_ins/
SCRIPT_PHP=${RUTA_FUNCIONES_PHP}subdominios/f01_lista_subdominio.f

php ${SCRIPT_PHP} $1 $2 $3 $4 $5 >/dev/null 2> /dev/null


#- La funcion devuelve en error.log de la ruta actual la salida de la orden

SUBDOMINIOS=`cat ${PWD}/error_log  | grep "<domain>" | sort -u  |cut -d ">" -f2 |cut -d "<" -f1 2> /dev/null`

##clear
echo "--------------------------------"
echo "Subdominios: $1 $2 $3 $4 $5"
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
echo $SUBDOMINIOS | tr " " "\n"
echo "--------------------------------"

> ${PWD}/error_log

}


