#!/usr/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2009
#-------------------------------------------------------------------
VERSION_SCRIPT="V 5.0"          #  Version del Script actual
FECHA_SCRIPT="Noviembre 2009"
#-------------------------------------------------------------------
LEVEL_NIVEL=04
CONCEPT_CARACTER="especifico"
CONCEPT_MOLDE="funcion"
CONCEPT_ARQUETIPO="oracle"
CONCEPT_LEVEL="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO} ${CONCEPT_CARACTER}"
#-==================================================================
#+ Funciones definidos:
#-------------------------------------------------------------------
#-- fserv
#-------------------------------------------------------------------
#- Funciones Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------

#-==================================================================

#- Muestra el estado de los servicios pasados como parametro 
fserv()
{
SERVICIOS=`cat $1 | tr "\n" " "`

for i in $SERVICIOS
do
echo "Servicio $i : Estado `tnsping $i | tail -1`"
done

}
