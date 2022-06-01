#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="2.2" #  Version del Script actual
FECHA_SCRIPT="Julio 2011"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="websphere"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="proceso"
CONCEPT_VARIANTE_04="admin"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- wsadmin_pyth
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Lanza el wsadmin del websphere indicado
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T wsadmin scripts was websphere config server python
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P ARCHIVO_PYTHON [RUTA VARIABLES]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E wsadmin_pyth scrip.py	-- Lanza el script indicado
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#- Alias wspyth
#-- Por defecto buscara en la celda, sino hay que pasarle la ruta para que sea nodo o servidor
wsadmin_run_pyth()
{
IS_wsadmin_run_pyth="Ejecuta el script python"
INFO_SCRIPT=${IS_wsadmin_run_pyth}

ARCHIVO_PYTHON=$1
RUTA_VARIABLES=$2


if [ "${ARCHIVO_PYTHON}" != "" ] ; then
#- Si no es vacio seguirmos, sino sacaremos info de error

if [ "${RUTA_VARIABLES}" == "" ] ; then
#- Solo se ha pasado un parametro
RUTA_VARIABLES=${WPS_PD}bin/
fi

##sudo ./wsadmin.sh -username app-arq  -password Arqu1t3ctura  
##-conntype SOAP -host LES000900200 -port 8879 
##-lang jython -f /tmp/Workshop_CEAR/install_a1_app.py

#- Lanzamos la aplicacion
${RUTA_VARIABLES}wsadmin.sh -username ${ADMIN_DMGR_USER} -password ${ADMIN_DMGR_PASS}  \
-conntype SOAP -host ${ADMIN_DMGR_HOST} -port ${ADMIN_DMGR_PORT} \
-lang jython -f ${ARCHIVO_PYTHON}

else

e_pmp wsadmin_run_pyth "SCRIPT_PYTH [RUTA]"

fi

}


