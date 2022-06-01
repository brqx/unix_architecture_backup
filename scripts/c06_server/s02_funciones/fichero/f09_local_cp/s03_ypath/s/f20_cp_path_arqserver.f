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
CONCEPT_MOLDE_05="alias"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Script ${CONCEPT_MOLDE_05} ${CONCEPT_ARQUETIPO_05} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- cp_path_to_arqserver
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - cp_path_to_server - 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Copia ficheros a otra ruta de forma sincronizada
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T copia ficheros local ruta arquitectura
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P dest ficheros 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E cf_path_to_arqserver -- Sincroniza la ruta actual contra core
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Posible alias cfs
cp_path_to_arqserver()
{
IS_cp_path_to_arqserver="Copia ficheros sincronizando la ruta actual. No respeta los enlaces"
INFO_SCRIPT=${IS_cp_path_to_arqserver}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_cp_path_to_arqserver=${INFO_SCRIPT}

#-La estructura es un nombre de carpeta
ESTRUCTURA=${1}
LINK_NAME=${2}
VERSION=${3}
RUTA_ARQDESTINO=${4}

SALIDA_cp_path_to_arqserver=0

NOMBRE_SCRIPT_cp_path_to_arqserver=cp_path_to_arqserver
PARAMETROS_SCRIPT_cp_path_to_arqserver="dest ficheros version link_name"


if [ "${RUTA_ARQDESTINO}" == "" ]; then
## Activamos un puerto por defecto
	RUTA_ARQDESTINO=${ARQ}
fi  

#- Debemos asegurarnos primero que hay algo que copiar

if [ "${VERSION}" == "" ]; then
	VERSION=${VERSION_ARQOS}
fi

if [ "${LINK_NAME}" == "" ]; then
	LINK_NAME=lastversion
fi

#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${ESTRUCTURA}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_cp_path_to_server} ${PARAMETROS_SCRIPT_cp_path_to_server}


else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Preparar ruta
#-- [2] Copiar archivos
#--------========--------========--------========--------========---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
#- La fuente no puede ser una ruta absoluta ya que el tar genera esa estructura
cleanpath ${RUTA_ARQDESTINO}
RUTA_DESTINO_CLEAN=${SALIDA_cleanpath}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#-Ruta usada para la copia
RUTA_ARQFINAL_PADRE=${RUTA_DESTINO_CLEAN}${ESTRUCTURA}/


RUTA_ARQFINAL_DESTINO=${RUTA_ARQFINAL_PADRE}${ESTRUCTURA}

#-Rutas usadas para los enlaces
RUTA_ARQVERSION=${RUTA_ARQFINAL_PADRE}${VERSION}
RUTA_ARQLASTVERSION=${RUTA_ARQFINAL_PADRE}${LINK_NAME}

#-Si se lanza desde bibliotecas_maven va a funcionar 
#-Si lo invocamos desde otra ruta tentremos que ajustar esta variable
RUTA_ARQORIGEN_COPIA=${PWD}/${FICHEROS}

#-Tratamiento de la entrada
PARAMETROS_MOTIVO_01="Ruta Origen  : ${RUTA_ORIGEN_COPIA} "
PARAMETROS_MOTIVO_02="Ruta Destino : ${RUTA_FINAL_DESTINO} "

#- 1.Copiamos

echo "Lanzamos ${RUTA_ARQORIGEN_COPIA} ${RUTA_ARQFINAL_PADRE}"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
cp_path_to_server ${RUTA_ARQORIGEN_COPIA} ${RUTA_ARQFINAL_PADRE}  
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

SALIDA_cp_path_to_arqserver=${SALIDA_cp_path_to_server}

if [ "${SALIDA_cp_path_to_server}" == "0" ] ; then
#--------========--------========--------========--------========---
#----- [1] Inicio comprobacion copia
#--------========--------========--------========--------========---

#- 2.Desenlazamos

##echo "Movemos : ${RUTA_ARQFINAL_DESTINO} ${RUTA_ARQVERSION}"

unlink ${RUTA_ARQLASTVERSION} &> /dev/null

#- 3.Borramos

rm -rf ${RUTA_ARQVERSION}		&> /dev/null

#- 4.Movemos

mv ${RUTA_ARQFINAL_DESTINO} ${RUTA_ARQVERSION} &> /dev/null

#- 5.Enlazamos

ln -s ${RUTA_ARQVERSION} ${RUTA_ARQLASTVERSION} &> /dev/null

#- 6.Cambiamos permisos

chmod 755 ${RUTA_DESTINO_CLEAN}   &> /dev/null

MOTIVO_FUNCION="Copia/envia de ficheros de forma correcta"

else

MOTIVO_FUNCION="Error al copiar/enviar de ficheros"

#--------========--------========--------========--------========---
#----- [1] Fin comprobacion copia
#--------========--------========--------========--------========---
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_cp_path_to_arqserver}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_cp_path_to_arqserver}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_cp_path_to_arqserver}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_cp_path_to_arqserver}
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
