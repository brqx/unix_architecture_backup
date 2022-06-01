#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="2.2" #  Version del Script actual
FECHA_SCRIPT="Junio 2011"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="websphere"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="logs"
CONCEPT_VARIANTE_04=""
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- control_logs_was
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- f2
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Informa de los logs del was y los ordena por fecha
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T logs was control
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E control_logs_was	-- Saca los logs del WAS en cuestion 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-Informa de los logs del was y los ordena por fecha
control_logs_was()
{
IS_control_logs_was="Informa de los logs del was y los ordena por fecha"
INFO_SCRIPT=${IS_control_logs_was}

#-Funcion que te muestre los cambios en los logs de un WAS

RUTA_ACTUAL=$PWD

#-Nos vamos a la ruta de perfiles por defecto del servidor , o bien a la indicada

RUTA_PERFILES=$1

if [ "${RUTA_PERFILES}" == "" ] ; then
#- Si no se pasa ruta entonces coge la de la celda
RUTA_PERFILES=${WPS_PF}
fi

cd ${RUTA_PERFILES}

#-Debe partir de la ruta del WAS (perfil actual)
# LES000900203:/opt/WebSphere7/ProcServer/profiles>

f2 log SystemOut | xargs ls -la | cut -d " " -f5- | cut -d "-" -f2- | sort -r

cd ${RUTA_ACTUAL}

}


