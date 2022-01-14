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
#-- procesa_codigo_fotos_temporada
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- procesa_codigo_fotos
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Genera una cadena de fotos para luego parsearla en razon a una ruta establecida
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T listado total ficheros fotos
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P CODIGO TEMPORADA	[ SEPARADOR ]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E procesa_codigo_fotos_temporada 2011 codigo -- Genera la cadena para la temporada 2011
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 


procesa_codigo_fotos_temporada()
{
IS_procesa_codigo_fotos_temporada="Genera las categorias pendientes en razon al codigo"
INFO_SCRIPT=${IS_procesa_codigo_fotos_temporada}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_procesa_codigo_fotos_temporada=${INFO_SCRIPT}

TEMPORADA_PASADA=$1
CODIGO_PASADO=$2
SEP=$3
FICHERO_CODIGOS=$4

SALIDA_procesa_codigo_fotos_temporada=0

NOMBRE_SCRIPT_procesa_codigo_fotos_temporada=procesa_codigo_fotos_temporada
PARAMETROS_SCRIPT_procesa_codigo_fotos_temporada="codigo [separador] [fichero_codigos]"

if [ "${CODIGO_PASADO}" == "" ]; then
TEMPORADA_PASADA="-?"
fi

if [ "${TEMPORADA_PASADA}" == "" ]; then
CODIGO_PASADO="-?"
fi

if [ "${SEP}" == "" ]; then
SEP=";"
fi

if [ "${FICHERO_CODIGOS}" == "" ]; then
FICHERO_CODIGOS=${RECFOTOS}zpart/year/${TEMPORADA_PASADA}/entidad/zfoto_codigos_${TEMPORADA_PASADA}.dat
FICHERO_PAISES=${RECFOTOS}zpart/year/${TEMPORADA_PASADA}/entidad/zfoto_paises_${TEMPORADA_PASADA}.dat
FICHERO_CIUDADES=${RECFOTOS}zpart/year/${TEMPORADA_PASADA}/entidad/zfoto_ciudades_${TEMPORADA_PASADA}.dat
FICHERO_LUGARES=${RECFOTOS}zpart/year/${TEMPORADA_PASADA}/entidad/zfoto_lugares_${TEMPORADA_PASADA}.dat
fi

if [ "${TEMPORADA_PASADA}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_procesa_codigo_fotos_temporada} ${PARAMETROS_SCRIPT_procesa_codigo_fotos_temporada} 

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
procesa_codigo_fotos ${CODIGO_PASADO} ${FICHERO_CODIGOS} ${SEP} 
SALIDA_procesa_codigo_fotos_temporada=${SALIDA_procesa_codigo_fotos}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

PARAMETROS_MOTIVO_01="Temporada   : ${TEMPORADA_PASADA}"
PARAMETROS_MOTIVO_02="Codigo      : ${codigo}"
PARAMETROS_MOTIVO_03="Fichero     : ${FICHERO}"
PARAMETROS_MOTIVO_04="Separador   : ${SEP}"

if [ "${SALIDA_procesa_codigo_fotos}" == "0" ] ; then
#------======------======------======------======------======------=
#----- [1] Inicio Existe el codigo para la foto
#------======------======------======------======------======------=

MOTIVO_FUNCION="Codigo Correcto"

PARAMETROS_MOTIVO_05="Fecha          : ${PENDIENTE_FECHA}"
PARAMETROS_MOTIVO_06="Pais PASADO    : ${PENDIENTE_PAIS}"
PARAMETROS_MOTIVO_07="Ciudad         : ${PENDIENTE_CIUDAD}"
PARAMETROS_MOTIVO_08="Lugar          : ${PENDIENTE_LUGAR}"
PARAMETROS_MOTIVO_09="Naturaleza     : ${PENDIENTE_NATURALEZA}"
PARAMETROS_MOTIVO_10="Temporada      : ${PENDIENTE_TEMPORADA}"
PARAMETROS_MOTIVO_11="Evento         : ${PENDIENTE_EVENTO}"
PARAMETROS_MOTIVO_12="Circunstancia  : ${PENDIENTE_CIRCUNSTANCIA}"

SALIDA_procesa_codigo_fotos_temporada=0

else

SALIDA_procesa_codigo_fotos_temporada=1

MOTIVO_FUNCION="Codigo incorrecto"

#----====----====----====----====----====----====----====----====---
#----- [1] Fin Existe el codigo para la foto
#----====----====----====----====----====----====----====----====---
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_procesa_codigo_fotos_temporada}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_procesa_codigo_fotos_temporada}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_procesa_codigo_fotos_temporada}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_procesa_codigo_fotos_temporada}
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
