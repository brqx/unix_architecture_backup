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
#-- procesa_codigo_fotos_last
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- procesa_codigo_fotos
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Genera una cadena de fotos para luego parsearla del ultimo viaje
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T generacion cadena fotos last viaje travel
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P CODIGO [SEPARADOR] [FICHERO_CONFIGURACION]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E procesa_codigo_fotos_last  -- Prepara las variables pendientes
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Partimos de un fichero con las columnas establecidas
#-------------------------------------------------------------------
# brqx_codigo:ciudad:lugar:naturaleza
# brqx_saf11bot:::animales

#- Posible fn/alias procesa_codigo_fotos_last
procesa_codigo_fotos_last()
{
IS_procesa_codigo_fotos_last="Genera las categorias pendientes en razon al codigo para el ultimo viaje"
INFO_SCRIPT=${IS_procesa_codigo_fotos_last}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_procesa_codigo_fotos_last=${INFO_SCRIPT}

CODIGO_PASADO=$1
FICHERO=$2
SEP=$3

SALIDA_procesa_codigo_fotos_last=0

NOMBRE_SCRIPT_procesa_codigo_fotos_last=procesa_codigo_fotos_last
PARAMETROS_SCRIPT_procesa_codigo_fotos_last="codigo [separador] [fichero_codigos]"

if [ "${CODIGO_PASADO}" == "" ]; then
CODIGO_PASADO="-?"
fi

if [ "${SEP}" == "" ]; then
SEP=";"
fi

if [ "${FICHERO}" == "" ]; then
FICHERO=${RECFOTOS}zpart/last/entidad/zfoto_codigos.dat
fi

if [ "${CODIGO_PASADO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_procesa_codigo_fotos_last} ${PARAMETROS_SCRIPT_procesa_codigo_fotos_last} 

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------


let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
procesa_codigo_fotos ${CODIGO_PASADO} ${FICHERO} ${SEP}
SALIDA_procesa_codigo_fotos_last=${SALIDA_procesa_codigo_fotos}
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
PARAMETROS_MOTIVO_05="Pais           : ${PENDIENTE_PAIS}"
PARAMETROS_MOTIVO_06="Ciudad         : ${PENDIENTE_CIUDAD}"
PARAMETROS_MOTIVO_07="Lugar          : ${PENDIENTE_LUGAR}"
PARAMETROS_MOTIVO_08="Naturaleza     : ${PENDIENTE_NATURALEZA}"
PARAMETROS_MOTIVO_09="Construccion   : ${PENDIENTE_CONSTRUCCION}"
PARAMETROS_MOTIVO_10="Temporada      : ${PENDIENTE_TEMPORADA}"
PARAMETROS_MOTIVO_11="Evento         : ${PENDIENTE_EVENTO}"
PARAMETROS_MOTIVO_12="Circunstancia  : ${PENDIENTE_CIRCUNSTANCIA}"
PARAMETROS_MOTIVO_13="Encanto        : ${PENDIENTE_ENCANTO}"

#-Esto se pone por claridad pero no es necesario
SALIDA_procesa_codigo_fotos_last=0

else

SALIDA_procesa_codigo_fotos_last=1

MOTIVO_FUNCION="Codigo incorrecto"

#----====----====----====----====----====----====----====----====---
#----- [1] Fin Existe el codigo para la foto
#----====----====----====----====----====----====----====----====---
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_procesa_codigo_fotos_last}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_procesa_codigo_fotos_last}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_procesa_codigo_fotos_last}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_procesa_codigo_fotos_last}
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
