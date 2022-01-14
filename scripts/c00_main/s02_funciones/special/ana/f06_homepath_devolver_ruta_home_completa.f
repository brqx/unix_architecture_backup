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
#L-- homepath
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- creapath
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Devuelve una ruta homecompleta una vez pasado un archivo o parte de la ruta
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
#E homepath /a/c   -- Devuelve la ruta /home/../a/c
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

## - Elimina la doble barra de un path pasado

homepath()
{
IS_homepath="Devuelve la ruta homecompleta"
INFO_SCRIPT=${IS_homepath}

PATH_PASADO=$1

if [ "${PATH_PASADO}" == "" ]; then
PATH_PASADO="-?"
fi


if [ "${PATH_PASADO}" == "-?" ] ;  then

e_pmt homepath "PATH PASADO"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

RUTA_FICHERO_ORIGEN=(${@})

#-Primero debemos saber si la ruta existe, pero claro antes hay qu componerla
#-El home es sin barra

#-No pasamos el home pues lo va a pillar
creapath ${RUTA_FICHERO_ORIGEN}
RUTA_FINAL=${SALIDA_creapath}

#-Ahora tenemos que puede ser un fichero o un directorio 
# y solo si es carpeta hay que ponerle barra
# Aqui nos ha compuesto el path : 
#-- /a/b -- fichero
#-- /a/B/ carpeta

if [ -f ${RUTA_FINAL} ] ; then
#-En este caso solo hay que devolverla
SALIDA_homepath=${RUTA_FINAL}
return 0
elif [ -d ${RUTA_FINAL} ] ; then
#-Aqui le vamos a poner una barra
cleanpath "${RUTA_FINAL}/"
SALIDA_homepath=${SALIDA_cleanpath}
## echo "Es una carpeta y su ruta es : ${SALIDA_fullpath}"
return 0
else
echo "Error : No existe la ruta"
SALIDA_homepath=
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
