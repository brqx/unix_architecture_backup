#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.5" #  Version del Script actual
FECHA_SCRIPT="Mayo 2011"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="fichero"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- uplevel
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Sube de nivel todos los ficheros actuales concatenandolos ruta final
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T subida nivel nombre ficheros fotos
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [corte_cadena_ruta] [corte_cadena_fichero] [cadena]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E uplevel		-- Genera una copia de los ficheros en un nivel superior
#-------------------------------------------------------------------
#E uplevel 5 10 -- Genera una copia cortando la ruta 5 caracteres y el archivo 10
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Mini alias upl
uplevel()
{
IS_uplevel="Copia ficheros cambiando a contador en nivel superior concatenando ruta padre"
INFO_SCRIPT=${IS_uplevel}

INFO_SCRIPT_uplevel=${INFO_SCRIPT}

CORTE_CADENA_RUTA=$1
CORTE_CADENA_ARCHIVO=$2
CADENA_RUTA=$3

SALIDA_uplevel=0

NOMBRE_SCRIPT_uplevel=uplevel
PARAMETROS_SCRIPT_uplevel="[corte_cadena_ruta] [corte_cadena_fichero] [cadena]"


if [ "${CADENA_RUTA}" == "" ]; then
#-Si no se pasa cadena pasamos el padre
CADENA_RUTA=$(basename $PWD)
fi

if [ "${CORTE_CADENA_RUTA}" == "" ]; then
#-Si no se pasa corte ponemoe la longitud de la ruta para que se saque entera
CORTE_CADENA_RUTA=${#CADENA_RUTA}
fi

if [ "${RUTA_DESTINO_ESTABLECIDA}" == "" ]; then
#-Si no se pasa cadena pasamos el padre
#-En lugar de pasarse como parametro se debe haber establecido
RUTA_DESTINO_ESTABLECIDA=../
fi


if [ "${CORTE_CADENA_RUTA}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_uplevel} ${PARAMETROS_SCRIPT_uplevel}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Comprobar corte de la ruta
#-- [2] Comprobar corte del fichero
#-- [3] Iterar entre los ficheros y almacenarlos en el array
#-- [4] Procesar el array realizando las copias
#--------========--------========--------========--------========---

#- Igual es interesante reducir la cadena a N caracteres

#-- Cortamos N posiciones la cadena
#-  Si no se corta sigue siendo el padre

LONGITUD_RUTA=${#CADENA_RUTA}

#-Vamos a analizar todas las opciones

if [ ${CORTE_CADENA_RUTA} -le ${LONGITUD_RUTA} ]; then
#--------========--------========--------========--------========---
#----- [1] Inicio testeo longitud de la ruta
#--------========--------========--------========--------========---

CADENA_FINAL=$(echo ${CADENA_RUTA} | cut -c1-${CORTE_CADENA_RUTA} )

NUM_CARACTERES_ARCHIVO=0

#-Hay que preparar un array de archivos

cont_archivos=0
cont_copiado=0
#- Debe iterar solo ficheros
for i in $(find -maxdepth 1 -type f | cut -d "/" -f2 )
do
##echo "Ruta destino : $i ../${CADENA}-${i} "
#- Hay que ajustar la cadena respentando la extension

ARCHIVOS_ORIGEN[${cont_archivos}]=${i}
#-Es la longitud de cada archivo
LONGITUD_ARCHIVO=${#i}

#-Habilitamos el corte de la cadena
if [ "${CORTE_CADENA_ARCHIVO}" != "" ] ; then
NUM_CARACTERES_ARCHIVO=$(expr ${LONGITUD_ARCHIVO} - ${CORTE_CADENA_ARCHIVO} )
fi

#- Cogemos los ultimos N caracteres - por defecto todos
#- Es un substring que debe comenzar por cero
NOMBRE_ARCHIVO_CORTADO=${i:${NUM_CARACTERES_ARCHIVO}:${LONGITUD_ARCHIVO}}

#-Guardamos los archivos para evitar copiar el mismo por problema con nombres cortos
ARCHIVOS[${cont_archivos}]=${CADENA_FINAL}-${NOMBRE_ARCHIVO_CORTADO}

cont_maximo=$cont_archivos
let cont_archivos++
done


if [ "${ARCHIVOS[${cont_copiado}]}" != "${ARCHIVOS[${cont_maximo}]}" ]; then
#--------========--------========--------========--------========---
#------- [2] Inicio comprobacion nombres iguales
#--------========--------========--------========--------========---

while [ ${cont_archivos} -gt ${cont_copiado} ] ; do

##echo "Subiendo : ${ARCHIVOS[${cont_copiado}]}"

#--../${ARCHIVOS[${cont_copiado}]}

##echo ${ARCHIVOS_ORIGEN[${cont_archivos}]} ${RUTA_DESTINO_ESTABLECIDA}/${ARCHIVOS[${cont_copiado}]}
cp ${ARCHIVOS_ORIGEN[${cont_copiado}]} ${RUTA_DESTINO_ESTABLECIDA}/${ARCHIVOS[${cont_copiado}]}
##echo " ha intentado subir : ${ARCHIVOS[${cont_copiado}]} ${RUTA_DESTINO_ESTABLECIDA}/${ARCHIVOS[${cont_copiado}]}"
let cont_copiado++
done

MOTIVO_FUNCION="Parametros correctos"
PARAMETROS_MOTIVO_01="Ruta  : ${CADENA_RUTA}"
PARAMETROS_MOTIVO_02="Corte : ${ARCHIVOS[${cont_maximo}]}"


else

MOTIVO_FUNCION="Corte de archivo insuficiente. Nombres iguales"
PARAMETROS_MOTIVO_01="Ruta  : ${CADENA_RUTA}"
PARAMETROS_MOTIVO_02="Corte : ${ARCHIVOS[${cont_maximo}]}"

SALIDA_uplevel=1

#--------========--------========--------========--------========---
#------- [2] Fin comprobacion nombres iguales
#--------========--------========--------========--------========---
fi
else

MOTIVO_FUNCION="Corte de la ruta superior a la misma"
PARAMETROS_MOTIVO_01="Ruta  : ${CADENA_RUTA}"
PARAMETROS_MOTIVO_02="Corte : ${CORTE_CADENA_RUTA}"

SALIDA_uplevel=1

#--------========--------========--------========--------========---
#----- [1] Fin testeo longitud de la ruta
#--------========--------========--------========--------========---
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_uplevel}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_uplevel}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_uplevel}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_uplevel}
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
