#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.2"          #  Version del Script actual
FECHA_SCRIPT="Diciembre 2012"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="function"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- mvn_get_library_snapshot
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - ch
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Obtiene una libreria/artefacto del servidor de Maven
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T obtener libreria mvn servidor maven
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P libreria [version]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E mvn_get_library_snapshot LIV1 11_2 -- Oteniene la version 11_2 de la libreria LIV1
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#-Descarga la libreria y la deja en la ruta actual

#- Alias mvget_snap
mvn_get_library_snapshot()
{
IS_mvn_get_library_snapshot="Copia ficheros a un servidor via SSH indicando una ruta"
INFO_SCRIPT=${IS_mvn_get_library_snapshot}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_mvn_get_library_snapshot=${INFO_SCRIPT}

LIBRERIA=${1}
VERSION=${2}
RUTA_NEXUS=${3}

SALIDA_mvn_get_library_snapshot=0

NOMBRE_SCRIPT_mvn_get_library_snapshot=mvn_get_library_snapshot
PARAMETROS_SCRIPT_mvn_get_library_snapshot="LIBRERIA [VERSION] [RUTA_NEXUS]"

if [ "${LIBRERIA}" == "" ]; then
	LIBRERIA="-?"
fi  

if [ "${VERSION}" == "" ]; then
	VERSION=${VERSION_ARQOS_MVN_LIBS_SNAPSHOT}
fi

if [ "${RUTA_NEXUS}" == "" ]; then
# RUTA_NEXUS_SNAP=http://nexus:8080/nexus/content/repositories/snapshots/com/mapfre/dgtp/aaa/arqos/
# MAPFRE_ARQOS_COMMONS_DIST/12.1.0-SNAPSHOT/MAPFRE_ARQOS_COMMONS.DIST-12.1.0-20120326.220249-12.zip
RUTA_NEXUS=${RUTA_NEXUS_SNAPSHOTS_LIBS}
fi

if [ "${LIBRERIA}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_mvn_get_library_snapshot} ${PARAMETROS_SCRIPT_mvn_get_library_snapshot}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Identificar el url libreria
#-- [2] Descargar listado de librerias
#-- [3] Identificar ultima libreria
#-- [4] Comprobar si es mas moderna
#-- [5] Descargar libreria
#--------========--------========--------========--------========---

#--------========--------========--------========--------========---
#-Base practica : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# /com/mapfre/dgtp/aaa/arqos/
# MAPFRE_ARQOS_COMMONS.DIST/12.1.0-SNAPSHOT/MAPFRE_ARQOS_COMMONS.DIST-12.1.0-20120326.220249-12.zip

#- Queremos conseguir lo siguiente : 
#-------------------------------------------------------------------
# wget  http://nexus:8080/nexus/content/repositories/snapshots/com/mapfre/dgtp/aaa/arqos/
#	MAPFRE_ARQOS_COMMONS.DIST/11.1.0/MAPFRE_ARQOS_COMMONS.DIST-11.2.0.zip
#-------------------------------------------------------------------

LIBRERIA_TRANSFORMADA=$( echo $LIBRERIA |  sed 's/_DIST/.DIST/g' )

VERSION_TRANSFORMADA=$( echo $VERSION | tr '_' '.' )

RUTA_NEXUS_TRANSFORMADA=${RUTA_NEXUS}${LIBRERIA_TRANSFORMADA}/${VERSION_TRANSFORMADA}-SNAPSHOT/

## echo "Ruta NEX Ok: ${RUTA_NEXUS_TRANSFORMADA} "

wget --no-proxy ${RUTA_NEXUS_TRANSFORMADA}				&> /dev/null
SALIDA_wget=$?
SALIDA_mvn_get_library_snapshot=${SALIDA_wget}
#-Si hacemos un wget tenemos el index.html

if [ "${SALIDA_wget}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#-- [1] Inicio bloque wget index
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

FICHERO_ZIP=$(cat index.html  | grep 'zip<' | cut -d '>' -f2 | cut -d '<' -f1 | tail -1 )
#- Guardar la ruta actual

#-Eliminamos el indice
rm -f index.html									&> /dev/null

##echo "Fichero : ${FICHERO_ZIP} "
NOMBRE_CON_ZIP=$(echo "${FICHERO_ZIP}" | cut -d "-" -f2-  )
VERSION_ZIP=$(echo ${NOMBRE_CON_ZIP} | cut -d "-" -f1 | tr "." "_" )
RESTO_NOMBRE_ZIP=$(echo ${NOMBRE_CON_ZIP} | cut -d "-" -f2- )
FECHA_ZIP=$(echo ${RESTO_NOMBRE_ZIP} | cut -d "." -f1,2 )
FECHA_ANTERIOR="prechange"

VERSION_FICHERO=$(echo "${FICHERO_ZIP}" | cut -d "-" -f2- | cut -d "." -f1)

echo "Version ${LIBRERIA}.${VERSION_ZIP}"

if [ -e "${HISTORICO_LIBRERIAS_MAVEN}s/zvers/${LIBRERIA}.${VERSION_ZIP}" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#-- [1a] Inicio existencia version anterior
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
FECHA_ANTERIOR=$(cat ${HISTORICO_LIBRERIAS_MAVEN}s/zvers/${LIBRERIA}.${VERSION_ZIP} )
##cat ${HISTORICO_LIBRERIAS_MAVEN}s/${LIBRERIA}.${VERSION_ZIP}
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#-- [1a] Fin existencia version anterior
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


## echo "Fechas : ${FECHA_ZIP}" != "${FECHA_ANTERIOR}"

if [ "${FECHA_ZIP}" != "${FECHA_ANTERIOR}" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#-- [2] Inicio Version nueva a descargar
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

#-Aqui ya sabemos si debemos descargarlo o no 

RUTA_FINAL_NEXUS=${RUTA_NEXUS_TRANSFORMADA}${FICHERO_ZIP}

##echo "NEX: ${RUTA_FINAL_NEXUS}"

#- Guardar la ruta actual

wget ${RUTA_FINAL_NEXUS}							&> /dev/null
RESULTADO_DESCARGA=$?

## echo "Resultado Descarga : -${RESULTADO_DESCARGA}- "
#- Debemos actuar en caso de que no exista

#- Ya tenemos el archivo - no incluye la carpeta

#- Si ya existe esa carpeta la borramos


if [ "${RESULTADO_DESCARGA}" == "0" ]; then
#----====----====----====----====----====----====----====----====---
#-- [3] Inicio Descarga Libreria
#----====----====----====----====----====----====----====----====---

#- la descarga es correcta

#-- La idea es llamar a la nueva funcion

## echo "Va a llamar al proceso : mvn_process_library ${LIBRERIA} ${FICHERO_ZIP} "

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
mvn_process_library ${LIBRERIA} ${FICHERO_ZIP}
SALIDA_mvn_get_library_snapshot=${SALIDA_mvn_process_library}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

PARAMETROS_MOTIVO_01="Libreria       : ${LIBRERIA}"
PARAMETROS_MOTIVO_02="Version        : ${VERSION_ZIP}"
PARAMETROS_MOTIVO_03="Snap-Date      : ${FECHA_ZIP}"
PARAMETROS_MOTIVO_04="Snap-Anterior  : ${FECHA_ANTERIOR}"
PARAMETROS_MOTIVO_05="Ruta Nexus     : ${RUTA_FINAL_NEXUS}"


if [ "${SALIDA_mvn_process_library}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#-- [4] Inicio Creacion Libreria correcta
#----====----====----====----====----====----====----====----====---

MOTIVO_FUNCION="Preparacion de la libreria correcta"
PARAMETROS_MOTIVO_06="Fichero Zip: ${FICHERO_ZIP}"

else 

MOTIVO_FUNCION="Error al preparar la libreria"
PARAMETROS_MOTIVO_06="Fichero Zip: ${FICHERO_ZIP}"
PARAMETROS_MOTIVO_07="Ruta       : ${PWD}"
SALIDA_mvn_get_library_snapshot=2

#----====----====----====----====----====----====----====----====---
#-- [4] Fin Creacion Libreria correcta
#----====----====----====----====----====----====----====----====---
fi
else 

MOTIVO_FUNCION="Error al descargar la libreria"

PARAMETROS_MOTIVO_01="Libreria       : ${LIBRERIA}"
PARAMETROS_MOTIVO_02="Version        : ${VERSION_ZIP}"
PARAMETROS_MOTIVO_03="Snap-Date      : ${FECHA_ZIP}"
PARAMETROS_MOTIVO_04="Snap-Anterior  : ${FECHA_ANTERIOR}"
PARAMETROS_MOTIVO_05="Ruta Nexus     : ${RUTA_FINAL_NEXUS}"
PARAMETROS_MOTIVO_06="Fichero Zip: ${FICHERO_ZIP}"
PARAMETROS_MOTIVO_07="Ruta       : ${PWD}"
SALIDA_mvn_get_library_snapshot=3

#----====----====----====----====----====----====----====----====---
#-- [3] Fin Descarga Libreria
#----====----====----====----====----====----====----====----====---
fi
else

MOTIVO_FUNCION="No se ha generado una version nueva"
SALIDA_mvn_get_library_snapshot=4

PARAMETROS_MOTIVO_01="Libreria       : ${LIBRERIA}"
PARAMETROS_MOTIVO_02="Version        : ${VERSION_ZIP}"
PARAMETROS_MOTIVO_03="Snap-Date      : ${FECHA_ZIP}"
PARAMETROS_MOTIVO_04="Snap-Anterior  : ${FECHA_ANTERIOR}"
PARAMETROS_MOTIVO_05="Ruta Nexus     : ${RUTA_FINAL_NEXUS}"

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#-- [2] Fin Version nueva a descargar
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

else

MOTIVO_FUNCION="La ruta de la libreria no es correcta"
SALIDA_mvn_get_library_snapshot=5

PARAMETROS_MOTIVO_01="Libreria       : ${LIBRERIA}"
PARAMETROS_MOTIVO_02="Version        : ${VERSION_ZIP}"
PARAMETROS_MOTIVO_03="Snap-Date      : ${FECHA_ZIP}"
PARAMETROS_MOTIVO_04="Snap-Anterior  : ${FECHA_ANTERIOR}"
PARAMETROS_MOTIVO_05="Ruta Nexus     : ${RUTA_FINAL_NEXUS}"

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#-- [1] Fin bloque wget index
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

#- Vaciamos las variables
##LIBRERIA=
##VERSION=
##RUTA_DESTINO=

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_mvn_get_library_snapshot}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_mvn_get_library_snapshot}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_mvn_get_library_snapshot}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_mvn_get_library_snapshot}
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
