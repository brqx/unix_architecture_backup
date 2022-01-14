#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 2.0"          #  Version del Script actual
FECHA_SCRIPT="Marzo 2011"
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

fullstat_instant()
{
#- No tiene while
# Queremos que devuelva una linea :
# [ Maquina - Memoria - Carga - Procesos - Espacio ]
# ibrqx - 

#Convertimos el tiempo en segundos

echo " "
echo "==============================================================================================================="
echo "                             Control des sistema V 2.0	[Marzo 2011]														"
echo "=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--"
echo "SERVIDOR     -   MEMORIA    /  SWAP  -       CARGA        -       PROCESOS         -          ESPACIO          "
echo "---------------------------------------------------------------------------------------------------------------"

SERVIDOR=$(uname -n |  tr '[:upper:]' '[:lower:]' )

linea_freemem
MEMORIA=${RETURN_LINEA_FREEMEM}

linea_carga
CARGA=${RETURN_LINEA_CARGA}

dame_instancias_proceso java
PROCESOS=${RETURN_INSTANCIAS_PROCESO}

dame_instancias_proceso apache
PROCESOS=" java : ${PROCESOS} / apache : ${RETURN_INSTANCIAS_PROCESO}"

dame_espacio_ruta
ESPACIO=${RETURN_ESPACIO_RUTA}

dame_espacio_ruta /tmp
ESPACIO=" / : ${ESPACIO} - /tmp : ${RETURN_ESPACIO_RUTA} "

echo "${SERVIDOR} :: ${MEMORIA} :: ${CARGA} :: ${PROCESOS} :: ${ESPACIO} "

echo "==============================================================================================================="
}


