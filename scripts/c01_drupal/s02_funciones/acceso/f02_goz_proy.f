#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="2.2" #  Version del Script actual
FECHA_SCRIPT="Junio 2011"
STATUS_SCRIPT="developing"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="drupal"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="acceso"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- goz
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- S_RCT
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Muy util para entrar en la ruta de un archivo en la estructura brqx
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T entrada carpeta proyecto go unix project
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P USUARIO PROYECTO
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E goz za unix   -- Entra en /home/za/www/brqxng/proyectos/prof/unix/
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

##-PENDING TO ADDAPT
## - Se encarga de ir al portal correspondiente considerando la ruta actual
goz()
{
IS_goz="Accede a una ruta del proyecto unix en cuestion en el usuario pasado"
INFO_SCRIPT=${IS_goz}

USUARIO=$1
PROYECTO=$2

if [ "${USUARIO}" == "" ] ; then
USUARIO="-?"
fi


if [ "${USUARIO}" == "-?" ] ;  then

e_pmi goz "usuario proyecto"

else


## Hara un filtro del tipo de portal

FICHERO=${S_RCT}proyectos.dat

ENFOQUE=$( cat $FICHERO | grep ${PROYECTO} | cut -d ":" -f3 )

#- Ahora vamos a la ruta

cd /home/${USUARIO}/www/brqxng/proyectos/${ENFOQUE}/${PROYECTO}

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
