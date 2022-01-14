#!/usr/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2007
#-------------------------------------------------------------------
VERSION_SCRIPT="V 2.0"          #  Version del Script actual
FECHA_SCRIPT="Septiembre 2007"
#-==================================================================
#
#- Este script se encarga de mostrar todos los procesos JAR que hay
#  Nos viene muy bien para poder testear los simuladores que hay en
#  un momento dado.
#-------------------------------------------------------------------


while true
do
clear
echo "Procesos JAR : Simuladores en ejecucion"
echo "======================================="
ps -eaf | grep -v "grep" | grep "jar" | cut -c4-   2> /dev/null
sleep 5
done

