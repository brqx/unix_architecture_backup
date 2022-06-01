#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.5" #  Version del Script actual
FECHA_SCRIPT="Febrero 2012"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="websphere"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="proceso"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- install_app_python
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- linea_normal - linea_alterna - linea_caracter
#-------------------------------------------------------------------
#-- WEBSPHERE_APPS
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Instala aplicacion python en el servidor usando puerto del DMGR
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T instalacion aplicacion python
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P APLICACION [SERVIDOR] [PUERTO]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E install_app_python ARQ_GesSolPres_SDPS		--		Desinstala el proceso
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

install_app_python()
{
IS_install_app_python="Instala una aplicacion en el servidor usando un script python"
INFO_SCRIPT=${IS_install_app_python}

SCRIPT_PASADO=${1}
HOST_PASADO=${2}
PUERTO_PASADO=${3}


if [ "${HOST_PASADO}" != "" ]; then
HOST_PASADO=${USUARIO_PASADO}
fi

if [ "${PUERTO_PASADO}" != "" ]; then
PUERTO_PASADO=${CLAVE_PASADA}
fi


if [ "${SCRIPT_PASADO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt install_app_python "Script Pasado Host Puerto"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

##/opt/ibm/WebSphere/ProcServer/profiles/AppSrv01/bin/wsadmin.sh -conntype SOAP -host les000900290 -port 8881 
##-lang jython -f /tmp//MADOC_ConsultaDocumento_SOAMED/install_app.py

#-Debe recibir como parametro el script, el host y el puerto


NOMBRE_COMANDO=${WPW_RUN}wsadmin.sh -conntype SOAP -host ${HOST_PASADO} -port ${PUERTO_PASADO} -lang jython -f ${SCRIPT_PYTHON_PASADO}

${NOMBRE_COMANDO}

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

