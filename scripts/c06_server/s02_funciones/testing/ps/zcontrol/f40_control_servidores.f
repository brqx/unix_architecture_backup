#!/bin/bash
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

control_servidores()
{
#- No tiene while
# Queremos que devuelva una linea :
# [ Maquina - Memoria - Carga - Procesos - Espacio ]
# ibrqx - 

#-------------------------------------------------------------------
#--AJUSTE_SERVIDOR_2011
#-------------------------------------------------------------------


echo " "
echo "================================================================================================================================================"
echo "                                   Control del sistema V 2.1 : Servidores V6	[Marzo 2011]            "
echo "=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--=--"
echo "SERVIDOR     -   MEMORIA      /    SWAP  -           CARGA        -             PROCESOS               -          ESPACIO                       "
echo "------------------------------------------------------------------------------------------------------------------------------------------------"


linea_fullstat_instant
LINEA_SERVIDOR=${RETURN_LINEA_FULL_INSTANT}
echo ${LINEA_SERVIDOR} | gawk '{printf "%-13s%-3s%-6s%-2s%-6s%-3s%-5s%-2s%-5s%-3s%4s%2s%5s%2s%5s%3s%6s%3s%3s%3s%7s%3s%4s%4s%4s%3s%5s%6s%3s%5s%3s%5s%4s\n", \
$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21,$22,$23,$24,$25,$26,$27,$28,$29,$30,$31,$32,$33}'

r_linea_fullstat_instant "core      "
LINEA_SERVIDOR=${RETURN_LINEA_FULL_INSTANT}
##                                             ::    mm        :: 0    /   0   ::    carga       ::     :                ::  /          -
echo ${LINEA_SERVIDOR} | gawk '{printf "%-13s%-3s%-6s%-2s%-6s%-3s%-5s%-2s%-5s%-3s%4s%2s%5s%2s%5s%3s%6s%3s%3s%3s%7s%3s%4s%4s%4s%3s%5s%6s%3s%5s%3s%5s%4s\n", \
$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21,$22,$23,$24,$25,$26,$27,$28,$29,$30,$31,$32,$33}'


r_linea_fullstat_instant "frontal   "
LINEA_SERVIDOR=${RETURN_LINEA_FULL_INSTANT}
echo ${LINEA_SERVIDOR} | gawk '{printf "%-13s%-3s%-6s%-2s%-6s%-3s%-5s%-2s%-5s%-3s%4s%2s%5s%2s%5s%3s%6s%3s%3s%3s%7s%3s%4s%4s%4s%3s%5s%6s%3s%5s%3s%5s%4s\n", \
$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21,$22,$23,$24,$25,$26,$27,$28,$29,$30,$31,$32,$33}'

r_linea_fullstat_instant "wsrr      "
LINEA_SERVIDOR=${RETURN_LINEA_FULL_INSTANT}
echo ${LINEA_SERVIDOR} | gawk '{printf "%-13s%-3s%-6s%-2s%-6s%-3s%-5s%-2s%-5s%-3s%4s%2s%5s%2s%5s%3s%6s%3s%3s%3s%7s%3s%4s%4s%4s%3s%5s%6s%3s%5s%3s%5s%4s\n", \
$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21,$22,$23,$24,$25,$26,$27,$28,$29,$30,$31,$32,$33}'

r_linea_fullstat_instant "wbm       "
LINEA_SERVIDOR=${RETURN_LINEA_FULL_INSTANT}
echo ${LINEA_SERVIDOR} | gawk '{printf "%-13s%-3s%-6s%-2s%-6s%-3s%-5s%-2s%-5s%-3s%4s%2s%5s%2s%5s%3s%6s%3s%3s%3s%7s%3s%4s%4s%4s%3s%5s%6s%3s%5s%3s%5s%4s\n", \
$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21,$22,$23,$24,$25,$26,$27,$28,$29,$30,$31,$32,$33}'


echo "================================================================================================================================================"
}


