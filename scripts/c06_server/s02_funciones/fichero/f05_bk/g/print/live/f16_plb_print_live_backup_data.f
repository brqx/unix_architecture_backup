#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.3"          #  Version del Script actual
FECHA_SCRIPT="Noviembre 2011"
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
#-- print_live_backup_data
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- e_pmt - get_server_info
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Muestra los parametros para hacer el backup del site
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T impresion parametros get backup ficheros ssh scp servidor
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [cuenta] [proyecto]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E print_live_backup_data zi  -- Muestra los datos para la cuenta zi
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-mini alias plbk
print_live_backup_data()
{
IS_print_live_backup_data="Muestra los parametros de live backup para la cuenta indicada"
INFO_SCRIPT=${IS_print_live_backup_data}
#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2012
#-------------------------------------------------------------------

#-Los sites son el despliegue de un proyecto en una cuenta de un servidor

CUENTA_ORIGEN=${1}
PROYECTO_ORIGEN=${2}
CUENTA_DESTINO=${3}
PROYECTO_DESTINO=${4}

if [ "${CUENTA_ORIGEN}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt print_live_backup_data "[proyecto_origen] [site_origen] [proyecto_destino] [site_destino]"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#-Debe devolver ruta del site - no de backup
get_live_backup_data ${CUENTA_ORIGEN} ${PROYECTO_ORIGEN} ${CUENTA_DESTINO} ${PROYECTO_DESTINO}

linea_normal
echo "Parametros para la copia : "
echo "${CUENTA_ORIGEN} : ${PROYECTO_ORIGEN} ==>> ${CUENTA_DESTINO} : ${PROYECTO_DESTINO}"
linea_alterna
echo "Ruta FS origen  : ${RUTA_FICHERO_FS_ORIGEN}		"
echo "DB local        : ${DB_LOCAL}					    "
echo "DB remota       : ${DB_REMOTA}					"
echo "Servidor Remoto : ${SERVER}						"
echo "Usuario         : ${USUARIO_CONEXION}				"
echo "Puerto          : ${PORT}							"
echo "Ruta LB remota  : ${RUTA_BACKUP_DESTINO_GLOBAL}   "
linea_normal

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

#-==================================================================
#+ Vaciado de Variables
#-------------------------------------------------------------------
limpia_variables;
#-==================================================================
