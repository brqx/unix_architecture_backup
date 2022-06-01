#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 2.1"          #  Version del Script actual
FECHA_SCRIPT="Diciembre 2011"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=05
CONCEPT_PRODUCTO_05="server"
CONCEPT_MOLDE_05="funcion"
CONCEPT_ARQUETIPO_05="fichero"
CONCEPT_LEVEL_05="Lista ${CONCEPT_MOLDE_05} ${CONCEPT_ARQUETIPO_05}"
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- bk_site_to_server
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - bk_files_to_server - bk_db_to_server
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Genera un backup (tar.gz) de la ruta indicada en el servidor 
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T backup site ssh scp servidor
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [usuario] [servidor]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E bk_site_to_server palillos soa7a -- backup de palillos en servidor soa7a
#-------------------------------------------------------------------
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-mini alias bkss
bk_site_to_server()
{
IS_bk_site_to_server="Backup site en servidor destino."
INFO_SCRIPT=${IS_bk_site_to_server}

CUENTA=${1}
SERVIDOR=${2}

if [ "${CUENTA}" == "" ]; then
## Activamos un usuario por defecto
CUENTA="-?"
fi  

if [ "${SERVIDOR}" == "" ]; then
##	SERVER=ibrqx
SERVIDOR=soa7a
fi  

if [ "${CUENTA}" == "-?" ]; then

e_pmt bk_site_to_server "[usuario] [servidor]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#-1. Hacer backup de la carpeta files o de todo
#-- Si lo hace completo debe vaciar los logs

bk_files_to_server ${CUENTA} ${SERVIDOR}

#-3. Hacer backup de la bbdd
#-- Debe vaciar/limpiar la BBDD antes de hacerlo

bk_db_to_server ${CUENTA} ${SERVIDOR}

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
