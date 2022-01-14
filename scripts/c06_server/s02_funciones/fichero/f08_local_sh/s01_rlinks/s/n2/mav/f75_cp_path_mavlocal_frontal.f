#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.2"          #  Version del Script actual
FECHA_SCRIPT="Abril 2012"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="alias"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Script ${CONCEPT_MOLDE_05} ${CONCEPT_ARQUETIPO_05} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- cp_path_to_mavlocal_frontal
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - cp_path_to_mav
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Actualiza la libreria en el servidor local
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T actualizar libreria servidor local maven
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [LINK_NAME] [VERSION_MAV]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E cp_path_to_mav_frontal release 11_2 -- Actualiza release con la version 11_2
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

cp_path_to_mavlocal_frontal()
{
IS_cp_path_to_mavlocal_frontal="Actualiza las librerias en el servidor Frontal"
INFO_SCRIPT=${IS_cp_path_to_mavlocal_frontal}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_cp_path_to_mavlocal_frontal=${INFO_SCRIPT}

LINK_NAME=${1}
VERSION_MAV=${2}

SALIDA_cp_path_to_mavlocal_frontal=0

NOMBRE_SCRIPT_cp_path_to_mavlocal_frontal=cp_path_to_mavlocal_frontal
PARAMETROS_SCRIPT_cp_path_to_mavlocal_frontal="[LINK_NAME] [VERSION_MAV]"


if [ "${VERSION_MAV}" == "" ]; then
	VERSION_MAV=${VERSION_ARQOS}
fi

if [ "${LINK_NAME}" == "" ]; then
	LINK_NAME=lastversion
fi


if [ "${LINK_NAME}" == "-?" ]; then

e_pmt ${NOMBRE_SCRIPT_cp_path_to_mavlocal_frontal} ${PARAMETROS_SCRIPT_cp_path_to_mavlocal_frontal}

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
LIBRERIA[1]=MAPFRE_ARQOS_FRONT_DIST
LIBRERIA[2]=MAPFRE_ARQOS_FRONT_VIDA_DIST
LIBRERIA[3]=MAPFRE_ARQOS_V2_DIST
##LIBRERIA[3]=MAPFRE_ARQOS_FRONT_UI_DIST

cont_mav=0
num_libs=4

while [ ${cont_mav} -lt ${num_libs} ] ; do

posiciona "Lib : ${LIBRERIA[${cont_mav}]} "

##echo "Lanzando cp_path_to_mav ${LIBRERIA[${cont_mav}]} ${LINK_NAME} ${VERSION_MAV} "

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
cp_path_to_mav ${LIBRERIA[${cont_mav}]} ${LINK_NAME} ${VERSION_MAV}
SALIDA_cp_path_to_mavlocal_frontal=${SALIDA_cp_path_to_mav}
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

INFO_SCRIPT=${INFO_SCRIPT_cp_path_to_mavlocal_frontal}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_cp_path_to_mavlocal_frontal}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_cp_path_to_mavlocal_frontal}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_cp_path_to_mavlocal_frontal}
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
