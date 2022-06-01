#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.4" #  Version del Script actual
FECHA_SCRIPT="Mayo 2012"
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
#-- uplevel_down
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- uplevel_path
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Sube N niveles todos los ficheros actuales cocatenandolos ruta final
#-------------------------------------------------------------------
#I Para que funcione requiere que los archivos esten siempre al mismo nivel
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T subida nivel nombre ficheros fotos
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [corte_ruta] [corte_fichero] [cadena] [ruta] 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E uplevel_down 10 15  -- Genera una copia de los ficheros que haya con nombre establecido
#-------------------------------------------------------------------
#E                        Diez caracteres para la carpeta y 15 para el archivo concatenado
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Mini alias upld
uplevel_down()
{
IS_uplevel_down="Sube los ficheros que haya a la ruta actual concatenando padre"
INFO_SCRIPT=${IS_uplevel_down}

INFO_SCRIPT_uplevel_down=${INFO_SCRIPT}


CORTE_CADENA_RUTA=$1
CORTE_CADENA_ARCHIVO=$2
CADENA_RUTA_ORIGEN=$3
RUTA_PASADA_DESTINO=$4

SALIDA_uplevel_down=0

NOMBRE_SCRIPT_uplevel_down=uplevel_down
PARAMETROS_SCRIPT_uplevel_down="[corte_ruta] [corte_arch] [cadena_ruta] [ruta_destino]"


if [ "${RUTA_PASADA_DESTINO}" == "" ]; then
RUTA_PASADA_DESTINO=${PWD}
fi


if [ "${CORTE_CADENA_RUTA}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_uplevel_down} ${PARAMETROS_SCRIPT_uplevel_down}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#- Va a subir los ficheros dos niveles

#-Almacenamos la ruta actual para poder volver
RUTA_ACTUAL=${PWD}

#-- Permitimos actuaciones en rutas remotas
cd ${RUTA_PASADA_DESTINO}
#- Tenemos esta estructura
#-A - n1 --> lanzar umulti
#   - n2        " "
#-B - n1        " "
#   - n2        " "

#-Hay que ir para dentro - justo al final
#- Supongo que son los niveles menos uno

#-Contamos los niveles hasta las fotos

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
contlevel

SALIDA_uplevel_down=${SALIDA_contlevel}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

NIVELES_BUSQUEDA=${RETORNO_num_niveles}

NUM_FICHEROS=$(find -maxdepth $NIVELES_BUSQUEDA -mindepth $NIVELES_BUSQUEDA -type d | wc -l )

if [ ${NUM_FICHEROS} -gt 0 ]; then
#--------========--------========--------========--------========---
#------- [2] Inicio hay ficheros a subir
#--------========--------========--------========--------========---

cont_for=0
RUTA_FOR=$PWD

for i in $(find -maxdepth $NIVELES_BUSQUEDA -mindepth $NIVELES_BUSQUEDA -type d | cut -d "/" -f2- ) 
do
cd $i
#- Aqui ya estamos en la ruta

#Solo debe lanzar el multi en los niveles finales
#echo "Lanza : $i ${CORTE_CADENA_RUTA} ${CORTE_CADENA_ARCHIVO} ${CADENA_RUTA_ORIGEN}"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
uplevel_path ${RUTA_FOR} ${CORTE_CADENA_RUTA} ${CORTE_CADENA_ARCHIVO} ${CADENA_RUTA_ORIGEN}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

#- Volvemos N Niveles
cd ${RUTA_FOR}
posiciona "${cont_for}/${NUM_FICHEROS}"
let cont_for++
done

MOTIVO_FUNCION="Existen ficheros en la ruta. Lanzamiento correcto."
PARAMETROS_MOTIVO_01="Ruta  : ${RUTA_PASADA_DESTINO}"
PARAMETROS_MOTIVO_02="Nivel : ${NIVELES_BUSQUEDA}"

SALIDA_uplevel_down=0

else
MOTIVO_FUNCION="No hay ficheros en la ruta indicada en el nivel establecido"
PARAMETROS_MOTIVO_01="Ruta  : ${RUTA_PASADA_DESTINO}"
PARAMETROS_MOTIVO_02="Nivel : ${NIVELES_BUSQUEDA}"

SALIDA_uplevel_down=1

#--------========--------========--------========--------========---
#------- [2] Fin hay ficheros
#--------========--------========--------========--------========---
fi

#- Volvemos a la ruta inicial
cd ${RUTA_ACTUAL}


if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_uplevel_down}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_uplevel_down}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_uplevel_down}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

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
