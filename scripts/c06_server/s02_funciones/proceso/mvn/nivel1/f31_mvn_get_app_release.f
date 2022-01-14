#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.3"          #  Version del Script actual
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
#-- mvn_get_app_release
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
#E mvn_get_app_release LIV1 11_2 -- Oteniene la version 11_2 de la libreria LIV1
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Alias mvear
mvn_get_app_release()
{
IS_mvn_get_app_release="Obtiene el ear de maven"
INFO_SCRIPT=${IS_mvn_get_app_release}

#- En principio no necesita usuario

#- Por defecto no se indicara puerto y el usuario sera el mio : ibm

#USUARIO_CONEXION=${1}
#CLAVE_CONEXION=${1}

APLICACION=${1}
VERSION=${2}
RUTA_NEXUS=${3}

if [ "${APLICACION}" == "" ]; then
	APLICACION="-?"
fi  

if [ "${VERSION}" == "" ]; then
	VERSION=${VERSION_ARQOS_MVN_APPS_RELEASE}
fi

if [ "${RUTA_NEXUS}" == "" ]; then
# RUTA_NEXUS_RELEASES=http://nexus:8080/nexus/content/repositories/releases/com/mapfre/dgtp/aaa/taller/
#  AAA_TALLERARQOS_FEAR/11.2.0/AAA_TALLERARQOS_FEAR-11.2.0.ear

RUTA_NEXUS=${RUTA_NEXUS_RELEASES_APPS}
fi

if [ "${APLICACION}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt mvn_get_app_release "app [version]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#-Almacenamos la ruta actual para poder volver
RUTA_ACTUAL=${PWD}


#- Queremos conseguir lo siguiente : 
#-------------------------------------------------------------------
# http://nexus:8080/nexus/content/repositories/releases/com/mapfre/dgtp/aaa/taller/AAA_TALLERARQOS_FEAR/11.2.0/
# wget http://nexus:8080/nexus/content/repositories/releases/com/mapfre/dgtp/aaa/arcos/taller/
#  AAA_TALLERARQOS_FEAR/0.0.1/
#  AAA_TALLERARQOS_FEAR-0.0.1.ear
#-------------------------------------------------------------------

APP_TRANSFORMADA=$( echo $APLICACION ) # |  tr '_' '.'  
VERSION_TRANSFORMADA=$( echo $VERSION | tr '_' '.' )

RUTA_NEXUS_TRANSFORMADA=${RUTA_NEXUS}${APP_TRANSFORMADA}/${VERSION_TRANSFORMADA}/

wget --no-proxy ${RUTA_NEXUS_TRANSFORMADA}
#-Si hacemos un wget tenemos el index.html

FICHERO_EAR=$(cat index.html  | grep 'ear<' | cut -d '>' -f2 | cut -d '<' -f1 | tail -1 )

#-Eliminamos el indice
rm -f index.html

RUTA_FINAL_NEXUS=${RUTA_NEXUS_TRANSFORMADA}${FICHERO_EAR}

echo "NEX: ${RUTA_FINAL_NEXUS}"

#- Guardar la ruta actual

wget ${RUTA_FINAL_NEXUS} 2> /dev/null
RESULTADO_DESCARGA=$?

#- Debemos actuar en caso de que no exista

#- Ya tenemos el archivo - no incluye la carpeta

#- Si ya existe esa carpeta la borramos

if [ "${RESULTADO_DESCARGA}" == "0" ]; then
#- la descarga es correcta
echo "Descarga Correcta: ${APLICACION} ${VERSION}						"

rm -rf ${APLICACION}

mkdir ${APLICACION}

#- Sistema de fecha - Backups de todas las descargas

FECHA_ACTUAL="$( date +"%Y" )_$( date +"%m" )_$( date +"%d" )/"
RUTA_BACKUPS_APPS=${HISTORICO_ARTEFACTOS_MAVEN}r/${FECHA_ACTUAL}/${APLICACION}/

mkdir -p ${RUTA_BACKUPS_APPS}

cp ${FICHERO_EAR} ${RUTA_BACKUPS_APPS}

#- Fin Sistema de copia


mv ${FICHERO_EAR} ./${APLICACION}/

else 
#- la descarga es incorrecta
echo "=============================================================="
echo "Url Incorrecta: ${LIBRERIA}									"
echo "--------------------------------------------------------------"
echo "${RUTA_FINAL_NEXUS}											"
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="

fi
#-- Volver al path guardado

cd ${RUTA_ACTUAL}

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
