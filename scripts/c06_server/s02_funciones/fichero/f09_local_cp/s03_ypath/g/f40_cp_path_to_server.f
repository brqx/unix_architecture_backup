#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2013
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.4"          #  Version del Script actual
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
#-- cp_path_to_server
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - ch
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Copia ficheros a una ruta local de forma parametrizada
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T copia ficheros local copy files
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P dest ficheros 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E cp_to_server_path  /opt/files/ fich1 -- Copia fich1 en core::/opt/files/
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Alias cps
cp_path_to_server()
{
IS_cp_path_to_server="Copia ficheros localmente indicando una ruta"
INFO_SCRIPT=${IS_cp_path_to_server}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_cp_path_to_server=${INFO_SCRIPT}

RUTA_FICHERO_ORIGEN=${1}
RUTA_BACKUP_DESTINO=${2}

SALIDA_cp_path_to_server=0

NOMBRE_SCRIPT_cp_path_to_server=cp_path_to_server
PARAMETROS_SCRIPT_cp_path_to_server="ORIGEN DESTINO"

RUTA_ACTUAL=${PWD}

if [ "${RUTA_FICHERO_ORIGEN}" == "" ]; then
RUTA_FICHERO_ORIGEN=${RUTA_ACTUAL}
fi

#-Este parametro indicara el sincronismo con lo que tenemos ademas el que depende del home
if [ "${RUTA_BACKUP_DESTINO}" == "" ]; then
RUTA_BACKUP_DESTINO=${DB_GLOBAL_IMPORT}
fi  

if [ "${RUTA_FICHERO_ORIGEN}" == "-?" ]; then

e_pmt ${NOMBRE_SCRIPT_cp_path_to_server} ${PARAMETROS_SCRIPT_cp_path_to_server}

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

#- Copiara a la misma ruta
#- Aqui vamos a obtener la ruta remota

RUTA_FICHERO=$( dirname ${RUTA_FICHERO_ORIGEN} ) 
NOMBRE_ORIGEN=$( basename ${RUTA_FICHERO_ORIGEN} ) 

if [ "${RUTA_FICHERO}" == "." ] ; then
#-La ruta es un solo miembro pero puede ser carpeta o archivo
RUTA_ORIGEN=${RUTA_ACTUAL}/
else
RUTA_ORIGEN=${RUTA_FICHERO}/
fi

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
#- La fuente no puede ser una ruta absoluta ya que el tar genera esa estructura
cleanpath ${NOMBRE_ORIGEN}
src=${SALIDA_cleanpath} ;
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
cleanpath ${RUTA_BACKUP_DESTINO}
dst=${SALIDA_cleanpath} ;
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--


#-Tratamiento de la entrada
PARAMETROS_MOTIVO_01="Ruta Origen  : ${RUTA_FICHERO_ORIGEN} "
PARAMETROS_MOTIVO_02="Ruta Destino : ${RUTA_BACKUP_DESTINO} "

if [ -d ${RUTA_ORIGEN} ] ; then
#--------========--------========--------========--------========---
#----- [1] Inicio comprobacion ruta
#--------========--------========--------========--------========---

#-- Comprobacion de ruta

cd ${RUTA_ORIGEN}

#- Crea la ruta destino - aunque ya exista

mkdir -p ${dst}			&> /dev/null

##echo "copia $PWD -- ${src} -- ${dst}"


#- Copiamos
cp -r  ${src} ${dst}    &> /dev/null
SALIDA_cp=$?

SALIDA_cp_path_to_server=${SALIDA_cp}

if [ "${SALIDA_cp}" == "0" ] ; then
#--------========--------========--------========--------========---
#------- [2] Inicio check copia
#--------========--------========--------========--------========---

MOTIVO_FUNCION="Copia/envia de ficheros de forma correcta"

else

MOTIVO_FUNCION="Error al copiar/enviar de ficheros"

#--------========--------========--------========--------========---
#------- [2] Fin check copia
#--------========--------========--------========--------========---
fi
else
MOTIVO_FUNCION="No existe ${RUTA_ORIGEN} "
SALIDA_cp_path_to_server=3

#--------========--------========--------========--------========---
#----- [1] Fin comprobacion ruta
#--------========--------========--------========--------========---
fi

cd ${RUTA_ACTUAL}

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_cp_path_to_server}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_cp_path_to_server}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_cp_path_to_server}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_cp_path_to_server}
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
