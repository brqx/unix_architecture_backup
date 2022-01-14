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
#-- print_test_path_site
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt 
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
#E print_test_path_site zi parques -- Devuelve los datos para la cuenta zi:parques
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-mini alias ptps
print_test_path_site()
{
IS_print_test_path_site="Imprime los datos para la cuenta indicada"
INFO_SCRIPT=${IS_print_test_path_site}
#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2012
#-------------------------------------------------------------------

#-Los sites son el despliegue de un proyecto en una cuenta de un servidor

CUENTA=${1}
PROYECTO=${2}


if [ "${CUENTA}" == "" ]; then
CUENTA="-?"
fi  


if [ "${CUENTA}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt print_test_path_site "cuenta [proyecto]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------


#-Debe obtener el enfoque y la ruta
get_path_site ${CUENTA} ${PROYECTO}

if [ "${ERROR_gen_path_site}" == "0" ] ; then

linea_normal
echo "Parametros para el site  : ${CUENTA} ${ENFOQUE} : ${PROYECTO}"
linea_alterna
echo "Ruta Origen : ${RUTA_FS_ORIGEN} "
linea_normal

fi

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
