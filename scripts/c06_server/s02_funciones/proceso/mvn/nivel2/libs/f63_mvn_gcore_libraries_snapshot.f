#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2013
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.3"          #  Version del Script actual
FECHA_SCRIPT="Diciembre 2013"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="function"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- mvn_gcore_libraries_snapshot
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - ch
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Obtiene libreria version snapshot del servidor de maven nexus
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T obtener librerias mvn servidor maven nexus
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [version]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E mvn_gcore_libraries_snapshot 11_2 -- Oteniene la version 11_2 de las librerias 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Alias mvgfull
mvn_gcore_libraries_snapshot()
{
IS_mvn_gcore_libraries_snapshot="Descarga todas las librerias para la version indicada"
INFO_SCRIPT=${IS_mvn_gcore_libraries_snapshot}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_mvn_gcore_libraries_snapshot=${INFO_SCRIPT}

VERSION=${1}

SALIDA_mvn_gcore_libraries_snapshot=0
NOMBRE_PANTALLA_mvn_gcore_libraries_snapshot=PANTALLA_mvn_gcore_libraries_snapshot.dat

NOMBRE_SCRIPT_mvn_gcore_libraries_snapshot=mvn_gcore_libraries_snapshot
PARAMETROS_SCRIPT_mvn_gcore_libraries_snapshot="[VERSION]"


if [ "${VERSION}" == "" ]; then
	VERSION=${VERSION_ARQOS_MVN_LIBS_SNAPSHOT}
fi

if [ "${VERSION}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_version_local_update} ${PARAMETROS_SCRIPT_version_local_update}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#- Preparamos el array de librerias
#- Esto lo deberia pillar de un archivo - pendiente de implementar

LIBRERIA[0]=MAPFRE_ARQOS_COMMONS_DIST
LIBRERIA[1]=MAPFRE_ARQOS_CORE_DIST
LIBRERIA[2]=MAPFRE_ARQOS_ENV_DIST
LIBRERIA[3]=MAPFRE_ARQOS_LOG4M_DIST
LIBRERIA[4]=MAPFRE_ARQOS_LOV_DIST
LIBRERIA[5]=MAPFRE_ARQOS_ENVCONFIG_DIST
LIBRERIA[6]=MAPFRE_ARQOS_CORE_VIDA_DIST
LIBRERIA[7]=MAPFRE_ARQOS_ENVCONFIG_VIDA_DIST
LIBRERIA[8]=MAPFRE_ARQOS_LOG4M_VIDA_DIST

cont_libs=0
cont_upds=0
	
num_libs=9

#-Partimos de error
SALIDA_mvn_actual=2

#-- Falta depurar
while [ ${cont_libs} -lt ${num_libs} ] ; do

posiciona "${cont_libs}/${num_libs}_Lib:${LIBRERIA[${cont_libs}]} ${VERSION}"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
##echo "Lib : ${LIBRERIA[${cont}]} "
##echo "mvn_get_library_snapshot ${LIBRERIA[${cont_libs}]} ${VERSION}"
mvn_get_library_snapshot ${LIBRERIA[${cont_libs}]} ${VERSION}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


if [ "${SALIDA_mvn_get_library_snapshot}" == "0" ] ; then
SALIDA_mvn_actual=${SALIDA_mvn_get_library_snapshot}
echo "Lib : ${LIBRERIA[${cont_libs}]} " >> ${NOMBRE_PANTALLA_mvn_gcore_libraries_snapshot}
PARAMETROS_MOTIVO[cont_upds]="Libreria: ${LIBRERIA[${cont_libs}]}"
let cont_upds++ 
fi

let cont_libs++ 
done

SALIDA_mvn_gcore_libraries_snapshot=${SALIDA_mvn_actual}

PARAMETROS_MOTIVO_01="Version         : ${VERSION}"
PARAMETROS_MOTIVO_02="Librerias Nuevas: ${cont_upds}"

#-Este bucle es para probar nombre de variables parametrizados
cont_motv=0
while [ ${cont_motv} -lt ${cont_upds} ] ; do
cont_param=$( expr ${cont_motv} + 3 )
##PARAMETROS_MOTIVO_${cont_param}=${PARAMETROS_MOTIVO[cont_motv]}
let cont_motv++ 
done

#-- Aqui hay que iterar los parametros para pilla todas las librerias actualizadas


if [ "${SALIDA_mvn_actual}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#-- [4] Inicio Creacion Libreria correcta
#----====----====----====----====----====----====----====----====---
MOTIVO_FUNCION="Se han descargado librerias nuevas de forma correcta"

PANTALLA_SCRIPT="${PWD}/${NOMBRE_PANTALLA_mvn_gcore_libraries_snapshot}"

else

MOTIVO_FUNCION="No se han descargado librerias nuevas. O hay errores o son viejas"

fi

#Si una ha sido correcta debe dar correcto para que actualice el resto

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_mvn_gcore_libraries_snapshot}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_mvn_gcore_libraries_snapshot}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_mvn_gcore_libraries_snapshot}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_mvn_gcore_libraries_snapshot}
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
