#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2013
#-------------------------------------------------------------------
VERSION_SCRIPT="2.5" #  Version del Script actual
FECHA_SCRIPT="Febrero 2013"
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
#-- genera_matriz_localidades_temporada
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- posiciona - e_pmt - genera_celda_localidades_temporada
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Genera las matrices necesarias para generar los recuerdos
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T generacion matrices matriz arrays tabla recuerdos
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [YEAR] [CORTE] [URL] [FICHERO_DATOS]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E genera_matriz_localidades_temporada 2012 -- Genera la las matrices para temporada 12
#-------------------------------------------------------------------
#E genera_matriz_localidades_temporada 2006 7 - Matrices year 2006 con posicion corte 7 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

##- GENERA PAISES LUGARES Y CIUDADES

#-- Vamos a generar una generacion de celda y un proceso general

genera_matriz_localidades_temporada()
{
IS_genera_matriz_localidades_temporada="Genera las matrices necesarias para generar los lugares"
INFO_SCRIPT=${IS_genera_matriz_localidades_temporada}

INFO_SCRIPT_genera_matriz_localidades_temporada=${INFO_SCRIPT}


TEMPORADA_PASADA=${1}
POSICION_CORTE_FICHERO=${2}
URL_BASE=${4}
FICHERO_PASADO=${4}


SALIDA_genera_matriz_localidades_temporada=0

NOMBRE_SCRIPT_genera_matriz_localidades_temporada=genera_matriz_localidades_temporada
PARAMETROS_SCRIPT_genera_matriz_localidades_temporada="[TEMPORADA] [FICHERO] [SEP] [URL] "

if [ "${TEMPORADA_PASADA}" == "" ]; then
TEMPORADA_PASADA=2012
fi

#-Gestionamos el separador de campos
if [ "${SEP}" == "" ]; then
SEP=";"
fi

if [ "${POSICION_CORTE_FICHERO}" == "" ]; then
POSICION_CORTE_FICHERO=7
fi

if [ "${FICHERO_PASADO}" == "" ]; then
FICHERO_PASADO=${REPO_VIAJES}zpart/year/viaje_test_${TEMPORADA_PASADA}.dat
fi  


if [ "${PAIS_PASADO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_genera_matriz_localidades_temporada} ${PARAMETROS_SCRIPT_genera_matriz_localidades_temporada}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Comprobar fichero
#-- [2] iterar linea por linea invocando a la celdas
#-- [3] Preparar varias matrices con los lugares ciudades y paises indicados
#--------========--------========--------========--------========---

if [ -f ${FICHERO_PASADO} ] ; then
#----====----====----====----====----====----====----====----====---
#----- [1] Inicio comprobacion fichero
#----====----====----====----====----====----====----====----====---

echo "Entra en fichero pasado"

#-Opcion de cambiar a codcat - pero hemos chequeado que no haya espacios
cont_celdas_a_procesar=0
cont_celda_lugares=0  ; cont_celda_tlugares=0  ;
cont_celda_ciudades=0 ; cont_celda_tciudades=0 ;
cont_celda_paises=0   ; cont_celda_tpaises=0   ;
cont_celda_lugares_aleatorio=0  ; cont_celda_tlugares_aleatorio=0  ;
cont_celda_ciudades_aleatorio=0 ; cont_celda_tciudades_aleatorio=0 ;
cont_celda_paises_aleatorio=0   ; cont_celda_tpaises_aleatorio=0   ;


num_filas_fichero=$(cat ${FICHERO_PASADO} | wc -l )
num_paises_fichero=$(cat ${FICHERO_PAISES} | wc -l )     ; let num_paises_fichero--
num_ciudades_fichero=$(cat ${FICHERO_CIUDADES} | wc -l ) ; let num_ciudades_fichero--
num_lugares_fichero=$(cat ${FICHERO_LUGARES} | wc -l )   ; let num_lugares_fichero--

#--Preprocesamos primero para ver si es correcto

PRIMERA_LINEA_FICHERO=$(cat ${FICHERO_PASADO} | head -1)

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
genera_celda_localidades_temporada ${TEMPORADA_PASADA} ${PRIMERA_LINEA_FICHERO} ${POSICION_CORTE_FICHERO} ${URL_BASE}
SALIDA_genera_matriz_localidades_temporada=${SALIDA_genera_celda_localidades_temporada}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

if [ "${SALIDA_genera_celda_localidades_temporada}" == "0" ] ; then
#------======------======------======------======------======------=
#----- [2] Inicio comprobacion estructura del fichero
#------======------======------======------======------======------=

for u in $(cat ${FICHERO_PASADO} )
do
LINEA_FICHERO="${u}"
INICIO_LINEA=$(echo ${LINEA_FICHERO} | cut -c1-10 )
posiciona "${TEMPORADA_PASADA}_${cont_celdas_a_procesar}/${num_filas_fichero}:${codigo}"
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
##echo "Procesando : ${LINEA_FICHERO}"
genera_celda_localidades_temporada ${TEMPORADA_PASADA} ${LINEA_FICHERO} ${POSICION_CORTE_FICHERO} ${URL_BASE}
SALIDA_genera_matriz_localidades_temporada=${SALIDA_genera_celda_localidades_temporada}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

let cont_celdas_a_procesar++

done

PARAMETROS_MOTIVO_01="Senda Pasada    : ${SENDA}"
PARAMETROS_MOTIVO_02="Fichero Pasado  : ${FICHERO}"
PARAMETROS_MOTIVO_03="Separador       : ${SEP}"
PARAMETROS_MOTIVO_04="Filas archivo   : ${cont_celdas_a_procesar}"
PARAMETROS_MOTIVO_05="Lugares  / TLug : ${cont_celda_lugares} [${cont_celda_lugares_aleatorio}]  - ${cont_celda_tlugares} [${cont_celda_tlugares_aleatorio}] / ${num_lugares_fichero}"
PARAMETROS_MOTIVO_06="Ciudades / TCiu : ${cont_celda_ciudades} [${cont_celda_ciudades_aleatorio}]  - ${cont_celda_tciudades} [${cont_celda_tciudades_aleatorio}] / ${num_ciudades_fichero}"
PARAMETROS_MOTIVO_07="Paises   / Tpai : ${cont_celda_paises} [${cont_celda_paises_aleatorio}]  - ${cont_celda_tpaises} [${cont_celda_tpaises_aleatorio}] / ${num_paises_fichero}"

case ${SALIDA_genera_matriz_localidades_temporada} in
'0' )
MOTIVO_FUNCION="Fichero existe. Celdas procesadas y matrices actualizadas."
;;
'1' )
MOTIVO_FUNCION="Fichero existe. Celdas no procesadas. Error en codigo de entrada."
;;
'2' )
MOTIVO_FUNCION="Fichero existe. Celdas no se han procesado. Error en posicion linea de entrada."
;;
esac


else

MOTIVO_FUNCION="Fichero no tiene la estructura adecuada"
PARAMETROS_MOTIVO_01="Fichero Pasado : ${FICHERO}"
PARAMETROS_MOTIVO_02="Primera Linea  : ${FICHERO}"


SALIDA_genera_matriz_localidades_temporada=2

#------======------======------======------======------======------=
#----- [2] Fin comprobacion estructura del fichero
#------======------======------======------======------======------=
fi
else

MOTIVO_FUNCION="Fichero no existe"
PARAMETROS_MOTIVO_01="Fichero Pasado : ${FICHERO}"

SALIDA_genera_matriz_localidades_temporada=3

#----====----====----====----====----====----====----====----====---
#----- [1] Fin comprobacion fichero
#----====----====----====----====----====----====----====----====---
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_genera_matriz_localidades_temporada}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_genera_matriz_localidades_temporada}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_genera_matriz_localidades_temporada}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_genera_matriz_localidades_temporada}
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
