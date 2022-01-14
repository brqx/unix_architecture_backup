#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.4"          #  Version del Script actual
FECHA_SCRIPT="Noviembre 2012"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="function"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- mvn_process_library
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Procesa una libreria descargada de nexus
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T procesar libreria mvn servidor maven
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P LIBRERIA FICHERO_ZIP
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E mvn_process_library  -- Procesa la libreria ya descargada de nexus
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- 
mvn_process_library()
{
IS_mvn_process_library="Procesa una libreria ya descargada de nexus"
INFO_SCRIPT=${IS_mvn_process_library}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_mvn_process_library=${INFO_SCRIPT}

#-La ruta lo debe incluir todo hasta el fichero
LIBRERIA="${1}"
FICHERO_ZIP="${2}"

SALIDA_mvn_process_library=0

NOMBRE_SCRIPT_mvn_process_library=mvn_process_library
PARAMETROS_SCRIPT_mvn_process_library="LIBRERIA FICHERO_ZIP"

if [ "${FICHERO_ZIP}" == "" ]; then
LIBRERIA=""
fi

if [ "${LIBRERIA}" == "" ]; then

e_pmt ${NOMBRE_SCRIPT_mvn_process_library} ${PARAMETROS_SCRIPT_mvn_process_library}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Borrar la libreria si existe
#-- [2] Crear la libreria
#-- [3] Mover el fichero a la libreria
#-- [4] Entrar en la libreria
#-- [5] Descomprimir el fichero
#-- [6] Borrar el fichero

#--------========--------========--------========--------========---

#-Almacenamos la ruta actual para poder volver
RUTA_ACTUAL=${PWD}

#-Borramos la libreria pero si no existe no debe pasar nada
rm -rf ${LIBRERIA}

mkdir ${LIBRERIA}
SALIDA_mkdir=$?

SALIDA_mvn_process_library=${SALIDA_mkdir}

if [ "${SALIDA_mkdir}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#----- [1] Inicio Creacion Libreria
#----====----====----====----====----====----====----====----====---

mv ${FICHERO_ZIP} ./${LIBRERIA}/
SALIDA_mv=$?

SALIDA_mvn_process_library=${SALIDA_mv}

if [ "${SALIDA_mv}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#------- [2] Inicio Movimiento Fichero
#----====----====----====----====----====----====----====----====---

## echo "Estamos en $PWD : ${LIBRERIA}"
#- Entramos en la carpeta

cd ${LIBRERIA}

unzip ${FICHERO_ZIP}  &> /dev/null 
SALIDA_unzip=$?

##echo "Salida unzip : ${SALIDA_unzip}  "

if [ "${SALIDA_unzip}" == "2" -o "${SALIDA_unzip}" == "0" ] ; then
#----====----====----====----====----====----====----====----====---
#--------- [3] Inicio Descompresion Fichero
#----====----====----====----====----====----====----====----====---

## echo "Se descomprime el archivo"

rm -f *-sources*								&> /dev/null
rm -f ${FICHERO_ZIP}							&> /dev/null
SALIDA_rm=$?


#-Ahora la copiamos a la ruta correcta

FECHA_ACTUAL="$( date +"%Y" )_$( date +"%m" )_$( date +"%d" )/"
RUTA_BACKUPS_LIBS=${HISTORICO_LIBRERIAS_MAVEN}s/${FECHA_ACTUAL}

#-Primero eliminamos la carpeta pues siempre nos quedaremos con la ultima del dia en cuestion

rm -rf ${RUTA_BACKUPS_LIBS}${LIBRERIA}     		&> /dev/null
SALIDA_rmrf=$?

mkdir -p ${RUTA_BACKUPS_LIBS}					&> /dev/null
SALIDA_mkdir=$?

cd ..
##echo "Copiamos libreria : ${LIBRERIA} - ${RUTA_BACKUPS_LIBS}"
cp -rf ${LIBRERIA} ${RUTA_BACKUPS_LIBS}			&> /dev/null

#-Vamos a gestionar el nombre del archivo

## 13.1.0-20130103.010828-6.zip
NOMBRE_CON_ZIP=$(echo "${FICHERO_ZIP}" | cut -d "-" -f2-  )
VERSION_ZIP=$(echo "${NOMBRE_CON_ZIP}" | cut -d "-" -f1 | tr "." "_" )
RESTO_NOMBRE_ZIP=$(echo ${NOMBRE_CON_ZIP} | cut -d "-" -f2- )
FECHA_ZIP=$(echo ${RESTO_NOMBRE_ZIP} | cut -d "." -f1,2 )

## echo "Grabando FICHERO : ${FICHERO_ZIP} - ${HISTORICO_LIBRERIAS_MAVEN}s/${LIBRERIA}.${VERSION_ZIP}"

echo "${FECHA_ZIP}" > ${HISTORICO_LIBRERIAS_MAVEN}s/zvers/${LIBRERIA}.${VERSION_ZIP}

#-Final backups de librerias

MOTIVO_FUNCION="Preparacion de la libreria correcta"
PARAMETROS_MOTIVO_01="Fichero Zip: ${FICHERO_ZIP}"
PARAMETROS_MOTIVO_02="Libreria   : ${LIBRERIA}"
SALIDA_mvn_process_library=0

else

MOTIVO_FUNCION="Error al descomprimir el fichero"
PARAMETROS_MOTIVO_01="Fichero Zip: ${FICHERO_ZIP}"
PARAMETROS_MOTIVO_02="Ruta       : ${PWD}"

SALIDA_mvn_process_library=1

#----====----====----====----====----====----====----====----====---
#--------- [3] Fin Descompresion Fichero
#----====----====----====----====----====----====----====----====---
fi
else

MOTIVO_FUNCION="Error al mover el fichero el fichero"
PARAMETROS_MOTIVO_01="Fichero Zip: ${FICHERO_ZIP}"
PARAMETROS_MOTIVO_02="Libreria   : ${LIBRERIA}"

SALIDA_mvn_process_library=2

#----====----====----====----====----====----====----====----====---
#------- [2] Fin Movimiento Fichero
#----====----====----====----====----====----====----====----====---
fi
else

MOTIVO_FUNCION="Error al crear la carpeta"
PARAMETROS_MOTIVO_01="Fichero Zip: ${FICHERO_ZIP}"
PARAMETROS_MOTIVO_02="Libreria   : ${LIBRERIA}"

SALIDA_mvn_process_library=3

#----====----====----====----====----====----====----====----====---
#----- [1] Fin Creacion Libreria
#----====----====----====----====----====----====----====----====---
fi



if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_mvn_process_library}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_mvn_process_library}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_mvn_process_library}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

cd ${RUTA_ACTUAL}

return ${SALIDA_mvn_process_library}
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
