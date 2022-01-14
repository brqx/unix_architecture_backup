#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.4" #  Version del Script actual
FECHA_SCRIPT="Enero 2012"
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
#-- tipo_perfil_was
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- linea_normal - linea_alterna
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Lista los perfiles en el entorno websphere indicado
#-------------------------------------------------------------------
#- Sistema de Meta tags en scripts
#-------------------------------------------------------------------
#T listado perfiles websphere 
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P LINEA_CARPETA_Y_ARCHIVO
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E tipo_perfil_was		--		Devuelve el tipo de perfil solicitado
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 


#-La idea es que te muestre los perfiles y los tipos de los mismos
tipo_perfil_was()
{
IS_tipo_perfil_was="Devuelve el tipo de perfil del WAS"
INFO_SCRIPT=${IS_tipo_perfil_was}

PERFIL_PASADO=${1}

if [ "${PERFIL_PASADO}" == "-?" ]; then
## Sistema de auto documentacion de funciones

e_pmt tipo_perfil_was "PERFIL"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

${WPS_RUN}manageprofiles.sh -profileName ${PERFIL_PASADO} -listAugments > ${PERFIL_PASADO}_salida_aumentos

cat ${PERFIL_PASADO}_salida_aumentos | grep "wbm" > /dev/null
WBM=$?

cat ${PERFIL_PASADO}_salida_aumentos | grep "esbserver" > /dev/null
ESB=$?

cat ${PERFIL_PASADO}_salida_aumentos | grep "wbiserver" > /dev/null
WPS=$?

if [ "${WBM}" -eq "0"  ] ; then
#----- Tiene monitor ---------------------------------------------

if [ "${ESB}" -eq "0"  ] ; then
echo "Perfil-${PERFIL_PASADO} WBM-ESB"
else
if [ "${WPS}" -eq "0"  ] ; then
echo "Perfil-${PERFIL_PASADO} WBM-WPS"
else
echo "Perfil-${PERFIL_PASADO} WBM"
fi
fi

#----- Tiene monitor ---------------------------------------------
else
#- No tiene monitor

if [ "${ESB}" -eq "0"  ] ; then
echo "Perfil-${PERFIL_PASADO} ESB"
fi

if [ "${WPS}" -eq "0"  ] ; then
echo "Perfil-${PERFIL_PASADO} WPS"
fi


fi

#- Eliminamos el fichero generado
#--------------------------------------------------------------
rm -f ${PERFIL_PASADO}_salida_aumentos
#--------------------------------------------------------------

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

