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
#-- genera_matriz_localidades
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- posiciona - e_pmt - genera_celda_localidades
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
#P LINEA [SEP] [URL]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E genera_matriz_localidades LINEA -- Genera la tupla de la matriz de recuerdos
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

##- GENERA PAISES LUGARES Y CIUDADES

#-- Vamos a generar una generacion de celda y un proceso general


genera_matriz_localidades()
{
IS_genera_matriz_localidades="Genera las matrices necesarias para generar los lugares"
INFO_SCRIPT=${IS_genera_matriz_localidades}

INFO_SCRIPT_genera_matriz_localidades=${INFO_SCRIPT}

FICHERO_PASADO=${1}

SALIDA_genera_matriz_localidades=0

NOMBRE_SCRIPT_genera_matriz_localidades=genera_matriz_localidades
PARAMETROS_SCRIPT_genera_matriz_localidades="[FICHERO] [SEP] [URL] "

#-Gestionamos el separador de campos

if [ "${FICHERO_PASADO}" == "" ]; then
FICHERO_PASADO=${REPO_VIAJES}zpart/full/viaje_last.dat
fi  

if [ "${FICHERO_PASADO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_genera_matriz_localidades} ${PARAMETROS_SCRIPT_genera_matriz_localidades}

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
#--------========--------========--------========--------========---
#----- [1] Inicio comprobacion fichero
#--------========--------========--------========--------========---

#-Opcion de cambiar a codcat - pero hemos chequeado que no haya espacios
for u in $(cat ${FICHERO_PASADO} )
do
LINEA_FICHERO="${u}"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
##echo "Procesando : ${LINEA_FICHERO}"
genera_celda_localidades ${LINEA_FICHERO}
SALIDA_genera_matriz_localidades=${SALIDA_genera_celda_localidades}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

done

PARAMETROS_MOTIVO_01="Senda Pasada   : ${SENDA}"
PARAMETROS_MOTIVO_02="Fichero Pasado : ${FICHERO}"
PARAMETROS_MOTIVO_03="Separador      : ${SEP}"

MOTIVO_FUNCION="Fichero existe"

else

MOTIVO_FUNCION="Fichero no existe"
PARAMETROS_MOTIVO_01="Fichero Pasado : ${FICHERO}"

SALIDA_genera_matriz_localidades=3

#----====----====----====----====----====----====----====----====---
#----- [1] Fin comprobacion fichero
#----====----====----====----====----====----====----====----====---
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_genera_matriz_localidades}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_genera_matriz_localidades}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_genera_matriz_localidades}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_genera_matriz_localidades}
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
