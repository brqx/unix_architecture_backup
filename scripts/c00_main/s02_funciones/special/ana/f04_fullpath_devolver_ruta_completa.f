#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.3" #  Version del Script actual
FECHA_SCRIPT="Julio 2012"
STATUS_SCRIPT="checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="special"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#L-- fullpath
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- creapath
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Devuelve una ruta completa una vez pasado un archivo o parte de la ruta
#-------------------------------------------------------------------
#+ Sistema de meta tags: 
#-------------------------------------------------------------------
#T generar ruta completa full path
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [palabra_de_la_ruta]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E fullpath /a/c   -- Devuelve la ruta /home/../a/c
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

## - Elimina la doble barra de un path pasado

fullpath()
{
IS_fullpath="Devuelve la ruta completa"
INFO_SCRIPT=${IS_fullpath}

PATH_PASADO=${1}
RUTA_FULL_PASADA=${2}


if [ "${PATH_PASADO}" == "" ]; then
PATH_PASADO="-?"
fi

if [ "${RUTA_FULL_PASADA}" == "" ]; then
RUTA_FULL_PASADA=${PWD}
fi


if [ "${PATH_PASADO}" == "-?" ] ;  then

e_pmt fullpath "PATH PASADO"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

RUTA_FICHERO_ORIGEN=(${@})


#-Lo primero que debemos saber es que tipo de consulta queremos hacer
#-- Si contiene una / al principio debe ser una ruta absoluta, por tanto no hay que crearla

PRIMER_CARACTER=$(echo ${RUTA_FICHERO_ORIGEN} | cut -c1 )

if [ "${PRIMER_CARACTER}" == "/" ] ; then
#-Ya es una ruta absoluta
## echo " es una ruta absoluta"
RUTA_FINAL=${RUTA_FICHERO_ORIGEN}
else
## echo " no es ruta absoluta "
creapath ${RUTA_FICHERO_ORIGEN} ${RUTA_FULL_PASADA}
RUTA_FINAL=${SALIDA_creapath}
fi

#-Ahora tenemos que puede ser un fichero o un directorio 
# y solo si es carpeta hay que ponerle barra
# Aqui nos ha compuesto el path : 
#-- /a/b -- fichero
#-- /a/B/ carpeta

if [ -f ${RUTA_FINAL} ] ; then
#-En este caso solo hay que devolverla
SALIDA_fullpath=${RUTA_FINAL}
return 0
elif [ -d ${RUTA_FINAL} ] ; then
#-Aqui le vamos a poner una barra
cleanpath "${RUTA_FINAL}/"
SALIDA_fullpath=${SALIDA_cleanpath}
## echo "Es una carpeta y su ruta es : ${SALIDA_fullpath}"
return 0
else
echo "Error : No existe la ruta. No se debe hacer nada."
SALIDA_fullpath=
return 1
fi

#-------------------------------------------------------------------
#- Fin de la funcion
#-------------------------------------------------------------------
fi
}

#-------------------------------------------------------------------
#+ Sistema de trazado N4 - desactivado
#-------------------------------------------------------------------
#N4# echo "$LEVEL_NIVEL	-	Ejecutadas $CONCEPT_LEVEL"
#-------------------------------------------------------------------

#-==================================================================
#+ Vaciado de Variables
#-------------------------------------------------------------------
limpia_variables;
#-==================================================================
