#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2013
#-------------------------------------------------------------------
VERSION_SCRIPT="2.3" #  Version del Script actual
FECHA_SCRIPT="Enero 2013"
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
#-- procesa_codigo_fotos_pais
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- procesa_codigo_fotos
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Genera una cadena de fotos para un pais dado
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T generacion cadena fotos pais
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P CODIGO PAIS [SEPARADOR]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E procesa_codigo_fotos_pais  -- Prepara las variables pendientes
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 


procesa_codigo_fotos_pais()
{
IS_procesa_codigo_fotos_pais="Genera las categorias pendientes en razon al codigo y a un pais"
INFO_SCRIPT=${IS_procesa_codigo_fotos_pais}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_procesa_codigo_fotos_pais=${INFO_SCRIPT}

PAIS_PASADO=$1
CODIGO_PASADO=$2
SEP=$3
FICHERO_CODIGOS=$4

SALIDA_procesa_codigo_fotos_pais=0

NOMBRE_SCRIPT_procesa_codigo_fotos_pais=procesa_codigo_fotos_pais
PARAMETROS_SCRIPT_procesa_codigo_fotos_pais="pais codigo [separador] [fichero_codigos]"

if [ "${PAIS_PASADO}" == "" ]; then
PAIS_PASADO="-?"
fi

if [ "${CODIGO_PASADO}" == "" ]; then
PAIS_PASADO="-?"
fi

if [ "${SEP}" == "" ]; then
SEP=";"
fi

if [ "${FICHERO_CODIGOS}" == "" ]; then
FICHERO_CODIGOS=${RECFOTOS}zpart/pais/${PAIS_PASADO}/entidad/zfoto_codigos_${PAIS_PASADO}.dat
fi

if [ "${PAIS_PASADO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_procesa_codigo_fotos_pais} ${PARAMETROS_SCRIPT_procesa_codigo_fotos_pais} 

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
procesa_codigo_fotos ${CODIGO_PASADO} ${FICHERO_CODIGOS} ${SEP}
SALIDA_procesa_codigo_fotos_pais=${SALIDA_procesa_codigo_fotos}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

PARAMETROS_MOTIVO_01="Codigo      : ${CODIGO_PASADO}"
PARAMETROS_MOTIVO_02="Fichero     : ${FICHERO}"
PARAMETROS_MOTIVO_03="Separador   : ${SEP}"

if [ "${SALIDA_procesa_codigo_fotos}" == "0" ] ; then
#------======------======------======------======------======------=
#----- [1] Inicio Existe el codigo para la foto
#------======------======------======------======------======------=

MOTIVO_FUNCION="Codigo Correcto"

PARAMETROS_MOTIVO_04="Fecha          : ${PENDIENTE_FECHA}"
PARAMETROS_MOTIVO_05="Pais PASADO    : ${PENDIENTE_PAIS}"
PARAMETROS_MOTIVO_06="Ciudad         : ${PENDIENTE_CIUDAD}"
PARAMETROS_MOTIVO_07="Lugar          : ${PENDIENTE_LUGAR}"
PARAMETROS_MOTIVO_08="Naturaleza     : ${PENDIENTE_NATURALEZA}"
PARAMETROS_MOTIVO_09="Temporada      : ${PENDIENTE_TEMPORADA}"
PARAMETROS_MOTIVO_10="Evento         : ${PENDIENTE_EVENTO}"
PARAMETROS_MOTIVO_11="Circunstancia  : ${PENDIENTE_CIRCUNSTANCIA}"

else

SALIDA_procesa_codigo_fotos_pais=1

MOTIVO_FUNCION="Codigo incorrecto"

#----====----====----====----====----====----====----====----====---
#----- [1] Fin Existe el codigo para la foto
#----====----====----====----====----====----====----====----====---
fi


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_procesa_codigo_fotos_pais}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_procesa_codigo_fotos_pais}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_procesa_codigo_fotos_pais}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_procesa_codigo_fotos_pais}
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

#-------------------------------------------------------------------
#+ Sistema de trazado N4 - desactivado
#-------------------------------------------------------------------
#N4# echo "$LEVEL_NIVEL	-	Ejecutadas $CONCEPT_LEVEL"
#-------------------------------------------------------------------
