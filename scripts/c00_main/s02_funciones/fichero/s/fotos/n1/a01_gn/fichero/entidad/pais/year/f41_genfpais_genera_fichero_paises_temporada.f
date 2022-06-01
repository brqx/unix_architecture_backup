#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2013
#-------------------------------------------------------------------
VERSION_SCRIPT="2.3" #  Version del Script actual
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
#-- genera_fichero_paises_temporada
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- genera_cadena_lugares
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Genera la salida de todas las temporadas
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T generacion fichero fotos temporadas
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [SENDA] [FICHERO] [SEPARADOR] [URL_BASE]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E genera_fichero_paises_temporada -- Genera una linea con la cadena del evento
#-------------------------------------------------------------------
#E genera_fichero_paises_temporada 2006
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

##- SE BASA EN UNA MATRIZ YA GENERADA

genera_fichero_paises_temporada()
{
IS_genera_fichero_paises_temporada="Genera la salida de todas los lugares para el ultimo viaje"
INFO_SCRIPT=${IS_genera_fichero_paises_temporada}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_genera_fichero_paises_temporada=${INFO_SCRIPT}

TEMPORADA_PASADA=${1}
SENDA=${2}
FICHERO_RECURSOS=${3}
SEP=${4}

SALIDA_genera_fichero_paises_temporada=0
NOMBRE_PANTALLA_genera_fichero_paises_temporada=paises_last.dat
PANTALLA_BORRAR_genera_fichero_paises_temporada=paises_last_borrar.dat

NOMBRE_SCRIPT_genera_fichero_paises_temporada=genera_fichero_paises_temporada
PARAMETROS_SCRIPT_genera_fichero_paises_temporada="TEMPORADA [SENDA] [FICHERO] [SEP]"

if [ "${TEMPORADA_PASADA}" == "" ]; then
TEMPORADA_PASADA=2012
fi


if [ "${SENDA}" == "" ]; then
#-La senda puede ser personal e impersonal o viva
SENDA="personal"
fi

if [ "${FICHERO_RECURSOS}" == "" ]; then
FICHERO_RECURSOS=${RECFOTOS}zpart/year/${TEMPORADA_PASADA}/entidad/zfoto_paises_${TEMPORADA_PASADA}.dat
fi

#-Gestionamos el separador de campos
if [ "${SEP}" == "" ]; then
SEP=";"
fi

if [ "${SENDA}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_genera_fichero_paises_temporada} ${PARAMETROS_SCRIPT_genera_fichero_paises_temporada}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Procesar archivo
#-- [2] Codificar linea
#-- [3] Generar salida lugares con linea procesada
#--------========--------========--------========--------========---


#- Va a generar el contenido con cinco fotos

CR='\015'  # Carriage return.
           # 015 is octal ASCII code for CR.
           # Lines in a DOS text file end in CR-LF.
           # Lines in a UNIX text file end in LF only.

if [ -f ${FICHERO_RECURSOS} ] ; then
#--------========--------========--------========--------========---
#----- [1] Inicio comprobacion fichero
#--------========--------========--------========--------========---

#-borramos el fichero de lugares que vamos a generar
rm -f ${NOMBRE_PANTALLA_genera_fichero_paises_temporada}

SW_ALGUN_LUGAR=1
cont_archivo=0

for i in $(codcat ${FICHERO_RECURSOS} )
do

LINEA_FICHERO="${i}"

posiciona "${cont_archivo}-${lugar}"
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
echo "Llamamndo con ${LINEA_FICHERO}"
genera_cadena_paises "${LINEA_FICHERO}"
SALIDA_genera_fichero_paises_temporada=${SALIDA_genera_cadena_paises}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#-Solo debe tener pantall si hay lugares
if [ "${SALIDA_genera_cadena_paises}" == "0" ] ; then
echo "${CADENA_PAISES}"  >> ${NOMBRE_PANTALLA_genera_fichero_paises_temporada}
echo "${CADENA_PAISES}"  >> ${PANTALLA_BORRAR_genera_fichero_paises_temporada}
PANTALLA_SCRIPT="${NOMBRE_PANTALLA_genera_fichero_paises_temporada}"

SW_ALGUN_PAIS=0
fi

let cont_archivo++
done

SALIDA_genera_fichero_paises_temporada="${SW_ALGUN_LUGAR}"

PARAMETROS_MOTIVO_01="Senda Pasada   : ${SENDA}"
PARAMETROS_MOTIVO_02="Fichero Pasado : ${FICHERO}"
PARAMETROS_MOTIVO_03="Separador      : ${SEP}"

if [ "${SW_ALGUN_PAIS}" == "0" ] ; then
MOTIVO_FUNCION="Hay paises en la matriz y se ha generado el archivo."
else
MOTIVO_FUNCION="Error. No hay paises en la matriz."
fi

else

MOTIVO_FUNCION="Error al intentar abrir el archivo."

#--------========--------========--------========--------========---
#----- [1] Fin Carga de datos 
#--------========--------========--------========--------========---
fi

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_genera_fichero_paises_temporada}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_genera_fichero_paises_temporada}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_genera_fichero_paises_temporada}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi


return ${SALIDA_genera_fichero_paises_temporada}
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
