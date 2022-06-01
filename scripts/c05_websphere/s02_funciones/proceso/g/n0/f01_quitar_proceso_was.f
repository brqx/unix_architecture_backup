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
#-- quitar_proceso_was
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- linea_normal - linea_alterna - linea_caracter
#-------------------------------------------------------------------
#-- WEBSPHERE_APPS
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Desinstala el proceso eliminando todas sus instancias y tareas humanas
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T desinstalacion borrado proceso was quitar
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P Proceso
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E quitar_proceso_was ARQ_GesSolPres_SDPS		--		Desinstala el proceso
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

quitar_proceso_was()
{
IS_quitar_proceso_was="Desinstala el proceso eliminando las instancias y tareas humanas"
INFO_SCRIPT=${IS_quitar_proceso_was}

PROCESO_PASADO=${1}
USUARIO_PASADO=${2}
CLAVE_PASADA=${3}


if [ "${USUARIO_PASADO}" != "" ]; then
ADMIN_DMGR_USER=${USUARIO_PASADO}
fi

if [ "${CLAVE_PASADA}" != "" ]; then
ADMIN_DMGR_PASS=${CLAVE_PASADA}
fi


if [ "${SERVICIO_PASADO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt quitar_proceso_was "Proceso Pasado"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

##./wsadmin.sh -f /opt/WebSphere61/AppServer/ProcessChoreographer/admin/bpcTemplates.jacl -uninstall nombre_del_proceso -force -username usuario_administrador_dmgr -password password_usuario

NOMBRE_COMANDO=${WPW_RUN}ProcessChoreographer/admin/bpcTemplates.jacl -uninstall nombre_del_proceso -force -username ${USUARIO_PASADO} -password ${CLAVE_PASADA}

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

