#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.3"          #  Version del Script actual
FECHA_SCRIPT="Marzo 2012"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="function"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} "#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- mvn_get_library_release
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
#E mvn_get_library_release LIV1 11_2 -- Oteniene la version 11_2 de la libreria LIV1
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Alias mvget
mvn_get_library_release()
{
IS_mvn_get_library_release="Obtiene libreria version release"
INFO_SCRIPT=${IS_mvn_get_library_release}

#- En principio no necesita usuario

#- Por defecto no se indicara puerto y el usuario sera el mio : ibm

#USUARIO_CONEXION=${1}
#CLAVE_CONEXION=${1}

LIBRERIA=${1}
VERSION=${2}
RUTA_NEXUS=${3}

if [ "${LIBRERIA}" == "" ]; then
	LIBRERIA="-?"
fi  

if [ "${VERSION}" == "" ]; then
	VERSION=${VERSION_ARQOS_MVN_LIBS_RELEASE}
fi

if [ "${RUTA_NEXUS}" == "" ]; then
# RUTA_NEXUS=http://nexus:8080/nexus/content/repositories/releases/com/mapfre/dgtp/aaa/arqos/
# RUTA_NEXUS_SNAP=http://nexus:8080/nexus/content/repositories/snapshots/com/mapfre/dgtp/aaa/taller/
#  AAA_TALLERARQOS_FEAR/0.0.1-SNAPSHOT/AAA_TALLERARQOS_FEAR-0.0.1-20111220.230532-74.ear

RUTA_NEXUS=${RUTA_NEXUS_RELEASES_LIBS}
fi

if [ "${LIBRERIA}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt mvn_get_library_release "libreria [version]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#-Almacenamos la ruta actual para poder volver
RUTA_ACTUAL=${PWD}


#- Queremos conseguir lo siguiente : 
#-------------------------------------------------------------------
# wget  http://nexus:8080/nexus/content/repositories/releases/com/mapfre/dgtp/aaa/arqos/
#	MAPFRE_ARQOS_COMMONS.DIST/11.2.0/MAPFRE_ARQOS_COMMONS.DIST-11.2.0.zip
#-------------------------------------------------------------------


LIBRERIA_TRANSFORMADA=$( echo $LIBRERIA |  sed 's/_DIST/.DIST/g' )
VERSION_TRANSFORMADA=$( echo $VERSION | tr '_' '.' )

RUTA_NEXUS_TRANSFORMADA=${RUTA_NEXUS}${LIBRERIA_TRANSFORMADA}/${VERSION_TRANSFORMADA}/
CARPETA_TRANSFORMADA=${LIBRERIA_TRANSFORMADA}-${VERSION_TRANSFORMADA}
FICHERO_TRANSFORMADO=${CARPETA_TRANSFORMADA}.zip

RUTA_FINAL_NEXUS=${RUTA_NEXUS_TRANSFORMADA}${FICHERO_TRANSFORMADO}

##echo "NEX: ${RUTA_FINAL_NEXUS}"

#- Guardar la ruta actual

wget ${RUTA_FINAL_NEXUS} 2> /dev/null
RESULTADO_DESCARGA=$?

#- Debemos actuar en caso de que no exista

#- Ya tenemos el archivo - no incluye la carpeta

#- Si ya existe esa carpeta la borramos

if [ "${RESULTADO_DESCARGA}" == "0" ]; then
#- la descarga es correcta

rm -rf ${LIBRERIA}

mkdir ${LIBRERIA}

mv ${FICHERO_TRANSFORMADO} ./${LIBRERIA}/

echo "Estamos en $PWD : ${LIBRERIA}"
#- Entramos en la carpeta

cd ${LIBRERIA}

unzip ${FICHERO_TRANSFORMADO} 2> /dev/null > /dev/null

#- Aqui ya tenemos nuestra libreria descargada y lista para pasarse a los servidores

#- Lo borramos

rm -f ${FICHERO_TRANSFORMADO}

#- la descarga es incorrecta
echo "Descarga Correcta: ${LIBRERIA} ${VERSION}						"

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


#- Vaciamos las variables
LIBRERIA=
VERSION=
RUTA_DESTINO=


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
