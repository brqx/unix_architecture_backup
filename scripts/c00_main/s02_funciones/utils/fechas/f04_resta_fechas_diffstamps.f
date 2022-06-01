#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="V 5.0"          #  Version del Script actual
FECHA_SCRIPT="Febrero 2012"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="main"
CONCEPT_MOLDE_05="function"
CONCEPT_ARQUETIPO_05="utils"
CONCEPT_LEVEL_05="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} "
#-==================================================================
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- diffstamps
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Obtiene una instantanea de la fecha actual
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T instantanea fecha actual
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P Fecha
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E diffstamps $fech1 $fech2	-	Devuelve la diferencia entre dos fechas
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Alias resta_fechas
diffstamps()
{
IS_diffstamps="Devuelve la diferencia entre dos fechas dadas"
INFO_SCRIPT=${IS_diffstamps}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_diffstamps=${INFO_SCRIPT}

FECHA_01="$1"
FECHA_02="$2"

SALIDA_diffstamps=0

NOMBRE_SCRIPT_diffstamps=diffstamps
PARAMETROS_SCRIPT_diffstamps="Fecha"


if [ "${FECHA_01}" == "-?" ] ; then
	
e_pmt ${NOMBRE_SCRIPT_diffstamps} ${PARAMETROS_SCRIPT_diffstamps}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Generar instantanea
#--------========--------========--------========--------========---

if [ "${FECHA_01}" -eq "${FECHA_01}" ] 2>/dev/null; then
dte2=${FECHA_01}
else
#-Se ha pasado una fecha
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
date2stamp "${FECHA_01}"
dte2=${RETORNO_date2stamp}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--
fi

if [ "${FECHA_02}" -eq "${FECHA_02}" ] 2>/dev/null; then
dte1=${FECHA_02}
else
#-Se ha pasado una fecha
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
date2stamp "${FECHA_02}"
dte1=${RETORNO_date2stamp}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--
fi

INSTANTANEA_DIFERENCIA=$(expr ${dte2} - ${dte1} )

if [ ${INSTANTANEA_DIFERENCIA} -ge 0 ] ; then
#--------========--------========--------========--------========---
#----- [1] Inicio conversion de la diferencia
#--------========--------========--------========--------========---

#-Devolveremos los valores en timestamp y en formato fecha

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
stamp2date ${INSTANTANEA_DIFERENCIA}
FECHA_DIFERENCIA=${RETORNO_stamp2date}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

MOTIVO_FUNCION="Diferencia entre fechas correcta"
PARAMETROS_MOTIVO_01="Fecha mayor: ${FECHA_02}"
PARAMETROS_MOTIVO_02="Fecha menor: ${FECHA_01}"
PARAMETROS_MOTIVO_03="Instantanea Resultado : ${INSTANTANEA_DIFERENCIA} segundos"
PARAMETROS_MOTIVO_04="Tiempo Resultado      : ${FECHA_DIFERENCIA}"

else

MOTIVO_FUNCION="Parametros incorrectos. Revisar posicion fechas entrada"
PARAMETROS_MOTIVO_01="Fecha mayor: ${FECHA_02}"
PARAMETROS_MOTIVO_02="Fecha menor: ${FECHA_01}"

SALIDA_diffstamps=1

#--------========--------========--------========--------========---
#----- [1] Fin conversion de la diferencia
#--------========--------========--------========--------========---
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_diffstamps}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_diffstamps}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_diffstamps}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

RETORNO_diffstamps=${INSTANTANEA_DIFERENCIA}
RETORNO_difffechas=${FECHA_DIFERENCIA}


return ${SALIDA_diffstamps}
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

