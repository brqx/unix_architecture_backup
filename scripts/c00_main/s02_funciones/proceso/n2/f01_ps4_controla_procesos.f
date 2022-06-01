#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="2.2" #  Version del Script actual
FECHA_SCRIPT="Junio 2011"
STATUS_SCRIPT="all checked"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="fichero"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- psmemcontrol
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- linea_normal - linea_caracter - p4
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Controla la memoria utilizada por los procesos filtrados
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T control memoria proceso
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P [filtro_procesos] [pausa]
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E psmemcontrol  -- Control procesos Java
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

psmemcontrol()
{
IS_psmemcontrol="Controla la memoria utilizada por los procesos filtrados"
INFO_SCRIPT=${IS_psmemcontrol}

FILTRO_PROCESOS=${1}
PAUSA=${2}

if [ "${PAUSA}" == "" ]; then
PAUSA=10
fi

if [ "${FILTRO_PROCESOS}" == "-?" ]; then

e_pmt psmemcontrol "[FILTRO] [PAUSA]"

else

#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

while true; 
do 
echo "Procesos filtrados ${FILTRO_PROCESOS} - Hora : $(date '+%H:%M:%S') " ; 
linea_normal; 

if [ "${FILTRO_PROCESOS}" != "" ] ; then
p4 | grep ${FILTRO_PROCESOS} | grep -v "grep" ; 
else
p4
fi

linea_normal; 
linea_alterna ; 
sleep ${PAUSA} ; 

done

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

#-==================================================================
#+ Vaciado de Variables
#-------------------------------------------------------------------
limpia_variables;
#-==================================================================

