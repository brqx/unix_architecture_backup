#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2013
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.3"          #  Version del Script actual
FECHA_SCRIPT="Enero 2013"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="alias"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Script ${CONCEPT_MOLDE_05} ${CONCEPT_ARQUETIPO_05} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- cp_path_to_mavlocal_soa
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - cp_path_to_mav
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Actualiza la librerias maven indicadas en el servidor actual
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T actualizar libreria servidor local maven
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [VERSION_MAV] [LINK_NAME]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E cp_path_to_mavlocal_soa release 11_2 -- Actualiza la release con la version 11_2
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

cp_path_to_mavlocal_soa()
{
IS_cp_path_to_mavlocal_soa="Actualiza la libreria en el servidor SOA"
INFO_SCRIPT=${IS_cp_path_to_mavlocal_soa}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_cp_path_to_mavlocal_soa=${INFO_SCRIPT}

LINK_NAME=${1}
VERSION_MAV=${2}

SALIDA_cp_path_to_mavlocal_soa=0

NOMBRE_SCRIPT_cp_path_to_mavlocal_soa=cp_path_to_mavlocal_soa
PARAMETROS_SCRIPT_cp_path_to_mavlocal_soa="VERSION_MAV LINK_NAME"


if [ "${LINK_NAME}" == "" ]; then
	LINK_NAME=lastversion
fi

if [ "${VERSION_MAV}" == "" ]; then
	VERSION_MAV=${VERSION_ARQOS}
fi

if [ "${LINK_NAME}" == "-?" ]; then

e_pmt ${NOMBRE_SCRIPT_cp_path_to_mavlocal_soa} ${PARAMETROS_SCRIPT_cp_path_to_mavlocal_soa}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Definir librerias
#-- [2] Realizar actualizacion arquitectura
#--------========--------========--------========--------========---

LIBRERIA[0]=MAPFRE_ARQOS_COMMONS_DIST
LIBRERIA[1]=MAPFRE_ARQOS_SOA_DIST
LIBRERIA[2]=MAPFRE_ARQOS_ENV_DIST

cont_mav=0
num_libs=3

while [ ${cont_mav} -lt ${num_libs} ] ; do

posiciona "Lib : ${LIBRERIA[${cont_mav}]} "

##echo "Lanzando cp_path_to_mav ${LIBRERIA[${cont_mav}]} ${LINK_NAME} ${VERSION_MAV} "

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
cp_path_to_mav ${LIBRERIA[${cont_mav}]} ${LINK_NAME} ${VERSION_MAV}
SALIDA_cp_path_to_mavlocal_soa=${SALIDA_cp_path_to_mav}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

let cont_mav++ ;
done

PARAMETROS_MOTIVO_01="Version ARQOS    : ${VERSION_MAV} "
PARAMETROS_MOTIVO_02="Link actualizado : ${LINK_NAME} "


if [ "${SALIDA_cp_path_to_mav}" == "0" ] ; then
#--------========--------========--------========--------========---
#----- [1] Inicio comprobacion copia
#--------========--------========--------========--------========---

MOTIVO_FUNCION="Actualizacion del servidor correcta"

else

MOTIVO_FUNCION="Error al actualizar servidor"

#--------========--------========--------========--------========---
#----- [1] Fin comprobacion copia
#--------========--------========--------========--------========---
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_cp_path_to_mavlocal_soa}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_cp_path_to_mavlocal_soa}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_cp_path_to_mavlocal_soa}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_cp_path_to_mavlocal_soa}
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
