#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.5"          #  Version del Script actual
FECHA_SCRIPT="Abril 2012"
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
#-- get_path_site
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- gen_path_site - e_pms
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
#E get_path_site zi parques -- Devuelve los datos para la cuenta zi:parques
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-mini alias gps
get_path_site()
{
IS_get_path_site="Imprime los datos para la cuenta indicada"
INFO_SCRIPT=${IS_get_path_site}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_get_path_site=${INFO_SCRIPT}

CUENTA=${1}
PROYECTO=${2}

SALIDA_get_path_site=0

NOMBRE_SCRIPT_get_path_site=get_path_site
PARAMETROS_SCRIPT_get_path_site="cuenta [proyecto]"

if [ "${CUENTA}" == "" ]; then
CUENTA="-?"
fi  

if [ "${CUENTA}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_get_path_site} ${PARAMETROS_SCRIPT_get_path_site} 

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

FICH_ENFOQUE=${RS_SITE}zinfo_enfoque_sites.dat

if [ "${PROYECTO}" == "main" ] ; then
#- Es un site principal
#- Pero la ruta debe existir en nuestro archivo

LINEA_ENFOQUE=$( cat ${FICH_ENFOQUE} | grep "^main"  | grep ":${CUENTA}:"  )
ERROR_grep=$?
else
#- Es un subdominio.Tendremos un fichero general para subdominios

LINEA_ENFOQUE=$( cat ${FICH_ENFOQUE} | grep "^${CUENTA}:"  | grep ":${PROYECTO}:"  )
ERROR_grep=$?

fi

SALIDA_get_path_site=${ERROR_grep}

if [ "${ERROR_grep}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [1] Inicio Gestion Enfoque
#----====----====----====----====----====----====----====----====---

ENFOQUE=$( echo ${LINEA_ENFOQUE} | cut -d ":" -f3 )

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++

#-Esta funcion siempre devuelve el valor
gen_path_site ${CUENTA} ${PROYECTO} ${ENFOQUE}
SALIDA_get_path_site=${SALIDA_gen_path_site}

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


if [ "${SALIDA_gen_path_site}" == "0" ] ; then
#------======------======------======------======------======------=
#----- [2] Inicio Gestion Ruta
#------======------======------======------======------======------=
RUTA_get_path_site=${RUTA_gen_path_site}
RUTA_FS_ORIGEN=${RUTA_get_path_site}

MOTIVO_FUNCION="Ruta obtenida de forma correcta"
PARAMETROS_MOTIVO_01="Ruta  : ${RUTA_FS_ORIGEN}"

else
#-
MOTIVO_FUNCION="Error al generar la ruta. Seguramente por el enfoque"
PARAMETROS_MOTIVO_01="Parametros: ${CUENTA} ${PROYECTO} ${ENFOQUE}"

#------======------======------======------======------======------=
#----- [2] Fin Gestion Ruta
#------======------======------======------======------======------=
fi

else
#-
MOTIVO_FUNCION="Error al obtener el enfoque"
PARAMETROS_MOTIVO_01="Parametros: ${CUENTA} ${PROYECTO} ${ENFOQUE}"

#----====----====----====----====----====----====----====----====---
#----- [1] Fin Gestion Enfoque
#----====----====----====----====----====----====----====----====---
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_get_path_site}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_get_path_site}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_get_path_site}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_get_path_site}
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
