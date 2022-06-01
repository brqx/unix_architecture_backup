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
CONCEPT_MOLDE_05="function"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- cp_path_from_server
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - ch
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Copia ficheros a otra ruta de forma parametrizada
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T copia ficheros local servidor
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [usuario] [servidor] [puerto] [dest] ficheros 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E cp_path_from_server /opt/files/ fich1 -- Copia fich1 en /opt/files/
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Alias cpfs
cp_path_from_server()
{
IS_cp_path_from_server="Copia/trae ficheros de forma local indicando una ruta"
INFO_SCRIPT=${IS_cp_path_from_server}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_cp_path_from_server=${INFO_SCRIPT}

RUTA_DESTINO=${1}
FICHEROS=${2}

SALIDA_cp_path_from_server=0

NOMBRE_SCRIPT_cp_path_from_server=cp_path_from_server
PARAMETROS_SCRIPT_cp_path_from_server="ORIGEN DESTINO"

RUTA_ORIGEN=${PWD}

if [ "${FICHEROS}" == "" ]; then
RUTA_DESTINO="-?"
fi

if [ "${RUTA_DESTINO}" == "" ]; then
## Activamos un puerto por defecto
	RUTA_DESTINO=/opt/bibliotecas_arquitectura/
fi  

if [ "${RUTA_DESTINO}" == "-?" ]; then

e_pmt ${NOMBRE_SCRIPT_cp_path_from_server} ${PARAMETROS_SCRIPT_cp_path_from_server}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Comprobar ruta
#-- [2] Copiar archivos
#--------========--------========--------========--------========---

RUTA_DESTINO=${RUTA_DESTINO}/

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
cleanpath ${RUTA_DESTINO}
dst=${SALIDA_cleanpath} ;
RUTA_DESTINO=${dst}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

PARAMETROS_MOTIVO_01="Ruta Origen  : ${RUTA_FICHERO_ORIGEN} "
PARAMETROS_MOTIVO_02="Ruta Destino : ${RUTA_BACKUP_DESTINO} "

if [ -d ${RUTA_ORIGEN} -a -d ${RUTA_DESTINO} ] ; then
#--------========--------========--------========--------========---
#----- [1] Inicio comprobacion ruta
#--------========--------========--------========--------========---

echo "Copiandooo ${RUTA_DESTINO}${FICHEROS} -- ${RUTA_ORIGEN}"
cp -r ${RUTA_DESTINO}${FICHEROS} ${RUTA_ORIGEN}

SALIDA_cp=$?

SALIDA_cp_path_from_server=${SALIDA_cp}

if [ "${SALIDA_cp}" == "0" ] ; then
#--------========--------========--------========--------========---
#------- [2] Inicio check copia
#--------========--------========--------========--------========---

MOTIVO_FUNCION="Copia/trae de ficheros de forma correcta"

else

MOTIVO_FUNCION="Error al copiar/traer de ficheros"

#--------========--------========--------========--------========---
#------- [2] Fin check copia
#--------========--------========--------========--------========---
fi
else
MOTIVO_FUNCION="No existe ${RUTA_ORIGEN} "
SALIDA_cp_path_from_server=3

#--------========--------========--------========--------========---
#----- [1] Fin comprobacion ruta
#--------========--------========--------========--------========---
fi

#-------------------------------------------------------------------
#- Vaciamos variables pues no son de arquitectura
#-------------------------------------------------------------------
RUTA_DESTINO=


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_cp_path_from_server}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_cp_path_from_server}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_cp_path_from_server}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_cp_path_from_server}
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
