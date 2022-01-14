#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.3" #  Version del Script actual
FECHA_SCRIPT="Mayo 2012"
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
#-- wrunsudo_remote_standalone
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- ssh_sudorun
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Lanza el wsadmin del websphere indicado
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T was websphere cluster start inicio server
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P 
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E wrunsudo_remote_standalone soa7a 	-- Lanza el script indicado para el servidor soa7a
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

wrunsudo_remote_standalone()
{
IS_wrunsudo_remote_standalone="Inicia un servidor standalone remoto con un solo nodo"
INFO_SCRIPT=${IS_wrunsudo_remote_standalone}

#-Guardamos la informacion actual del script. Es necesario si se invoca a scripts intermedios
INFO_SCRIPT_wrunsudo_remote_standalone=${INFO_SCRIPT}

ID_WAS=${1}

SALIDA_wrunsudo_remote_standalone=0

NOMBRE_SCRIPT_wrunsudo_remote_standalone=wrunsudo_remote_standalone
PARAMETROS_SCRIPT_wrunsudo_remote_standalone="ID_WAS"


if [ "${ID_WAS}" == "" ]; then
	ID_WAS="-?"
fi  


#- Vamos a insertar un sistema de autodocumentacion tipo unix -?
if [ "${ID_WAS}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt ${NOMBRE_SCRIPT_wrunsudo_remote_standalone} ${PARAMETROS_SCRIPT_wrunsudo_remote_standalone}

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

#--------========--------========--------========--------========---
#-Algoritmo : 
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#-- [1] Cargar Datos
#-- [2] Arrancar Servidor
#--------========--------========--------========--------========---

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
was_load_parameters ${ID_WAS}
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

posiciona "00_Start:Carga de parametros-${SERVER}"

SALIDA_wrunsudo_remote_standalone=${SALIDA_was_load_parameters}

if [ "${SALIDA_was_load_parameters}" == "0" ] ; then
#--------========--------========--------========--------========---
#----- [1] Carga de datos contra el WAS indicado
#--------========--------========--------========--------========---

posiciona "01_Start:Servidor-Iniciandose-${SERVER}"

let SW_LLAMADA_DESDE_NIVEL_SUPERIOR++
ssh_sudorun ${USUARIO_CONEXION} ${SERVER} ${PORT} "${LINEA_COMANDO_SERVIDOR_01}"
let SW_LLAMADA_DESDE_NIVEL_SUPERIOR--

posiciona "02_Start:Servidor-Arrancado-${SERVER}"

SALIDA_wrunsudo_remote_standalone=${SALIDA_ssh_sudorun}

if [ "${SALIDA_ssh_sudorun}" == "0" ] ; then
#--------========--------========--------========--------========---
#------- [2] Inicio Servidor del SWAS
#--------========--------========--------========--------========---

MOTIVO_FUNCION="Ejecuccion correcta.Servidor Standalone arrancado."

else
MOTIVO_FUNCION="Error al ejecutar el comando"
PARAMETROS_MOTIVO_01="Conexion: ${USUARIO_CONEXION} ${SERVER} ${PORT}"
PARAMETROS_MOTIVO_02="Comando : ${LINEA_COMANDO_SERVIDOR_01}"

#--------========--------========--------========--------========---
#------- [2] Fin Servidor del WAS
#--------========--------========--------========--------========---
fi
else
MOTIVO_FUNCION="Error al acceder a los datos"
PARAMETROS_MOTIVO_01="Identificador: ${ID_WAS}"

#--------========--------========--------========--------========---
#----- [1] Fin Carga de datos contra el WAS indicado
#--------========--------========--------========--------========---
fi

##ssh -t localhost 'sudo su - ldaprole -c "id ; exec bash"' 

#ssh_surun ibm frontal6a 22 /opt/WebSphere61/AppServer/profiles/dmgrarqv3/bin/startManager.sh

#ssh_surun ibm frontal6a 22 /opt/WebSphere61/AppServer/profiles/nodearqv301/bin/startNode.sh

#ssh_surun ricabel core7a 22 /opt/WebSphere7/AppServer/profiles/nodecorearq01/bin/startNode.sh

#- Matar un proceso
#sudo ./wsadmin.sh -f /opt/WebSphere7/ArqServer/ProcessChoreographer/admin/bpcTemplates.jacl -uninstall TAQ_GesSolPres_SDPSApp -force -username adm-soa -password adm-soa

#- Lanzar java en bg

#sudo nohup /opt/WebSphere7/ArqServer/java/bin/java -jar /opt/AppDynamicsLite/viewer/adlite-viewer.jar &

#- Mirar arbol jndi

#sudo ./dumpNameSpace.sh -url corbaname:iiop:LES000900202.es.mapfre.net:2811/NameServiceCellPersistentRoot
#sudo ./dumpNameSpace.sh -url corbaname:iiop:LES000900200.es.mapfre.net:9812/NameServiceCellPersistentRoot

if [ "${SW_LLAMADA_DESDE_NIVEL_SUPERIOR}" == "0" ] ; then
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Inicio cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

INFO_SCRIPT=${INFO_SCRIPT_wrunsudo_remote_standalone}
NOMBRE_SCRIPT=${NOMBRE_SCRIPT_wrunsudo_remote_standalone}
PARAMETROS_SCRIPT=${PARAMETROS_SCRIPT_wrunsudo_remote_standalone}

e_pms 

else
#- Si no se presenta se deben eliminar parametros del nivel actual
limpia_parametros

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Fin cuerpo presentacion
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
fi

return ${SALIDA_wrunsudo_remote_standalone}
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

