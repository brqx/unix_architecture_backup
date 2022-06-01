#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="7.0" #  Version del Script actual
FECHA_SCRIPT="Febrero 2012"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="ejecuciones"
CONCEPT_ARQUETIPO_04="terminal"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Ejecuciones:
#-------------------------------------------------------------------
#-- Se debe cambiar a una funcion que te de el espacio de una ruta
#-------------------------------------------------------------------

### - Gestion de espacio en disco :

echo "=============================================================="

#- Igual hay que adaptarlo segun que version de df tengamos

echo "Espacio en ruta local    : $(df -h . | tail -1 | tr -s ' ' | cut -d ' ' -f4-5 )"


if [ "${SYSTEM_OS}" == "linux" ] ; then

echo "Espacio en raiz servidor : $(df -h . | tail -1 | tr -s ' ' | cut -d ' ' -f4-5 )"

echo "Espacio en opt           : $(df -h /opt/ | tail -1 | tr -s ' ' | cut -d ' ' -f4-5 )"

echo "Espacio en shm           : $(df -h /dev/shm/ | tail -1 | tr -s ' ' | cut -d ' ' -f4-5 )"

echo "Espacio en temporal      : $(df -h /var/tmp/ | tail -1 | tr -s ' ' | cut -d ' ' -f4-5 )"

echo "Espacio en var log       : $(df -h /var/log/ | tail -1 | tr -s ' ' | cut -d ' ' -f4-5 )"

fi

