#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.4"          #  Version del Script actual
FECHA_SCRIPT="Marzo 2012"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="funcion"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Lista ${CONCEPT_MOLDE_05} ${CONCEPT_ARQUETIPO_05}"
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- print_nombre_servidor
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - get_nombre_servidor
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Imprime la ruta de backup para el site indicado
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T backup ficheros ssh scp servidor
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [cuenta] [proyecto]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E print_nombre_servidor parques.com -- Devuelve parques
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-mini alias pnsl
print_nombre_servidor()
{
IS_print_nombre_servidor_local="Imprime los datos para la cuenta indicada"
INFO_SCRIPT=${IS_print_nombre_servidor_local}

#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2012
#-------------------------------------------------------------------

#-Los sites son el despliegue de un proyecto en una cuenta de un servidor

NOMBRE_SERVIDOR=${1}


if [ "${NOMBRE_SERVIDOR}" == "" ]; then
NOMBRE_SERVIDOR="-?"
fi  


if [ "${NOMBRE_SERVIDOR}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt print_nombre_servidor_local "nombre_servidor"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

get_nombre_servidor ${NOMBRE_SERVIDOR} 

linea_normal
echo "Nombre Servidor : ${NOMBRE_SERVIDOR} "
linea_normal

#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------
fi
}


#-------------------------------------------------------------------
#+ Sistema de trazado N5 - parametrizado
#-------------------------------------------------------------------
if [ "${N5}" != "" ] ; then
echo "${LEVEL_NIVEL_05}/${LEVEL_NIVEL}--${CONCEPT_LEVEL_05}"
fi
#-------------------------------------------------------------------

#-==================================================================
#+ Vaciado de Variables
#-------------------------------------------------------------------
limpia_variables;
#-==================================================================
