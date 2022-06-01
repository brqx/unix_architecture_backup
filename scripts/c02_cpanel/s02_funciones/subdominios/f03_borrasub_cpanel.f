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
#- borrasub      : Crea un nuevo subdominio
#-------------------------------------------------------------------

#-Ej: borrasub zb pelotas

borrasub()
{
#- La gestion de parametros la hace php

> ${PWD}/error_log

RUTA_FUNCIONES_PHP=/brqx/arquitectura/unix/scripts/depend/c02_cpanel/funciones/subdominios/php_ins/
SCRIPT_PHP=${RUTA_FUNCIONES_PHP}subdominios/f03_borra_subdominio_par.f

php ${SCRIPT_PHP} $1 $2 $3 $4 $5  >/dev/null 2> /dev/null

> ${PWD}/error_log
}


