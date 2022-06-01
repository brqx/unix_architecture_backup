#!/usr/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2010
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.0"          #  Version del Script actual
FECHA_SCRIPT="Enero 2010"
#-==================================================================
#+ Funciones:
#-------------------------------------------------------------------
#- fullstat	  : Inserta en varios archivos la información del sistema
#		    con objeto de sacar luego estadísticas
#-==================================================================
#+ Requerimientos:
#-------------------------------------------------------------------
#- instancias_out : Va guardando las instancias de apache
#- freemem_out    : Almacenamos la memoria del sistema
#- carga_out      : Guardamos la carga actual del sistema
#-------------------------------------------------------------------

r_fullstat_instant()
{
#- No tiene while
# Queremos que devuelva una linea :
# [ Maquina - Memoria - Carga - Procesos - Espacio ]
# ibrqx - 

#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2011
#-------------------------------------------------------------------

SERVER=${1}
PORT=${2}

if [ "${SERVER}" == "" ]; then
## Activamos un servidor por defecto
##	SERVER=ibrqx
SERVER=core
fi  

if [ "${PORT}" == "" ]; then
## Activamos un puerto por defecto
##	PORT=65533
PORT=22
fi  


echo " "
echo "==============================================================================================================="
echo "                             Control des sistema V 2.0	[Marzo 2011]														"
echo "=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--"
echo "SERVIDOR     -   MEMORIA    /  SWAP  -       CARGA        -       PROCESOS         -          ESPACIO          "
echo "---------------------------------------------------------------------------------------------------------------"

SERVIDOR=${SERVER}

r_linea_freemem $@
MEMORIA=${RETURN_LINEA_FREEMEM}

r_linea_carga $@
CARGA=${RETURN_LINEA_CARGA}


r_dame_instancias_proceso ${SERVER} ${PORT} java
PROCESOS=${RETURN_INSTANCIAS_PROCESO}

r_dame_instancias_proceso ${SERVER} ${PORT} apache
PROCESOS="java:${PROCESOS} / apache :${RETURN_INSTANCIAS_PROCESO}"

r_dame_espacio_ruta ${SERVER} ${PORT}
ESPACIO=${RETURN_ESPACIO_RUTA}

r_dame_espacio_ruta ${SERVER} ${PORT} /tmp
ESPACIO=" / :${ESPACIO} - /tmp :${RETURN_ESPACIO_RUTA} "

echo "${SERVIDOR}   :: ${MEMORIA} :: ${CARGA} :: ${PROCESOS} :: ${ESPACIO} "

echo "==============================================================================================================="
}


