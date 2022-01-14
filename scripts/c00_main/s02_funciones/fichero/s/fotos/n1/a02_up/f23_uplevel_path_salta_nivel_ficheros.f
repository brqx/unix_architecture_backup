#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.4" #  Version del Script actual
FECHA_SCRIPT="Mayo 2012"
STATUS_SCRIPT="all checked"
#------------------------------------------------------------------
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
#-- uplevel_path
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- uplevel
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Sube de nivel todos los ficheros actuales cocatenandolos ruta final
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T subida nivel nombre ficheros fotos
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [corte_cadena] [cadena] [ruta_final] 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E uplevel_path /opt  -- Genera una copia de los ficheros en /opt
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Mini alias uplp
uplevel_path()
{
IS_uplevel_path="Sube ficheros al path indicado concatenando padre"
INFO_SCRIPT=${IS_uplevel_path}

INFO_SCRIPT_uplevel_path=${INFO_SCRIPT}

RUTA_PASADA_DESTINO=$1
CORTE_CADENA_RUTA=$2
CORTE_CADENA_ARCHIVO=$3
CADENA_RUTA_ORIGEN=$4

SALIDA_uplevel_path=0

NOMBRE_SCRIPT_uplevel_path=uplevel_path
PARAMETROS_SCRIPT_uplevel_path="[ruta_destino] [corte_cadena_ruta] [corte_cadena_fichero] [cadena_ruta]"

if [ "${CORTE_CADENA_RUTA}" == "" ]; then
#-Si no se pasa corte ponemoe la longitud de la ruta para que se saque entera
CORTE_CADENA_RUTA=${#CADENA_RUTA}
fi

if [ "${RUTA_PASADA_DESTINO}" == "" ]; then
#-Si no se pasa cadena pasamos el padre
RUTA_PASADA_DESTINO=../
fi

if [ "${RUTA_PASADA_DESTINO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_uplevel_path} ${PARAMETROS_SCRIPT_uplevel_path}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Establecer la ruta destino indicada
#-- [2] Llamar a uplevel para que haga la copia
#--------========--------========--------========--------========---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
RUTA_DESTINO_ESTABLECIDA=${RUTA_PASADA_DESTINO}
uplevel ${CORTE_CADENA_RUTA} ${CORTE_CADENA_ARCHIVO} ${CADENA_RUTA_ORIGEN} 
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

SALIDA_uplevel_path=${SALIDA_uplevel}

if [ "${SALIDA_uplevel}" == "0" ]; then
#--------========--------========--------========--------========---
#------- [1] Inicio copia correcta
#--------========--------========--------========--------========---

MOTIVO_FUNCION="Subida de ficheros correcta"
PARAMETROS_MOTIVO_01="Ruta  : ${RUTA_PASADA_DESTINO}"
PARAMETROS_MOTIVO_02="Corte : ${ARCHIVOS[${cont_maximo}]}"

else

MOTIVO_FUNCION="Fallo al subir los archivos"
PARAMETROS_MOTIVO_01="Ruta  : ${RUTA_PASADA_DESTINO}"
PARAMETROS_MOTIVO_02="Corte : ${ARCHIVOS[${cont_maximo}]}"

#--------========--------========--------========--------========---
#------- [1] Fin copia correcta
#--------========--------========--------========--------========---
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_uplevel_path}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_uplevel_path}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_uplevel_path}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi



return ${SALIDA_uplevel_path}
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
