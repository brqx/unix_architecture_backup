#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.3"          #  Version del Script actual
FECHA_SCRIPT="Noviembre 2011"
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
#-- test_path_site
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - gen_path_site
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Devuelve la ruta para el site en cuestion
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
#E get_path_site zi parques -- Devuelve los datos para la cuenta zi:parques
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-- Pendiente de implementar
#-mini alias tps
test_path_site()
{
IS_get_path_site="Devuelve los datos para la cuenta indicada"
INFO_SCRIPT=${IS_get_path_site}

#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2012
#-------------------------------------------------------------------

#-Los sites son el despliegue de un proyecto en una cuenta de un servidor

CUENTA=${1}
PROYECTO=${2}

if [ "${CUENTA}" == "" ]; then
CUENTA=za
fi  

if [ "${PROYECTO}" == "" ]; then
PROYECTO=main
fi  


if [ "${CUENTA}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt get_path_site "cuenta [proyecto]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#- Solo queda formar la ruta de origen : test_path_site
#- Para formar la ruta debemos saber si es uno o dos parametros

#-- El enfoque va en otro archivo

FICH_ENFOQUE=${RS_SITE}zinfo_enfoque_sites.dat

if [ "${PROYECTO}" == "main" ] ; then
#- Es un site principal
#- Pero la ruta debe existir en nuestro archivo

ENFOQUE=$( cat ${FICH_ENFOQUE} | grep "^main"  | grep "${CUENTA}" | cut -d ":" -f3 )

else
#- Es un subdominio.Tendremos un fichero general para subdominios

ENFOQUE=$( cat ${FICH_ENFOQUE} | grep "^${CUENTA}"  | grep "${PROYECTO}" | cut -d ":" -f3 )

fi

gen_path_site ${CUENTA} ${PROYECTO} ${ENFOQUE}

RUTA_FS_ORIGEN=${SALIDA_gen_path_site}

##echo "Ruta : ${RUTA_FICHERO_FS_ORIGEN} "

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
