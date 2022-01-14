#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2012
#-------------------------------------------------------------------
VERSION_SCRIPT="2.3" #  Version del Script actual
FECHA_SCRIPT="Enero 2012"
STATUS_SCRIPT="pending"
#-------------------------------------------------------------------
LEVEL_NIVEL=04    # Variable control profundidad alcanzada
LEVEL_NIVEL_04=04 # Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_PRODUCTO_04="main"
CONCEPT_MOLDE_04="funciones"
CONCEPT_ARQUETIPO_04="present"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
#+ Funciones / Variables definidas:
#-------------------------------------------------------------------
#-- ajusta_cadena_guiones
#-------------------------------------------------------------------
#+ Funciones / Variables Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#+ Informacion : 
#-------------------------------------------------------------------
#I Establece la maxima longitud para presentar las cadenas
#-------------------------------------------------------------------
#T establecer set max maxima longitud
#-------------------------------------------------------------------
#+ Parametros : 
#-------------------------------------------------------------------
#P LINEA_ENTRADA
#-------------------------------------------------------------------
#+ Ejemplo : 
#-------------------------------------------------------------------
#E ajusta_cadena_guiones 20	-- Prepara la cadena con 20 posiciones
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 

#-Establece la maxima longitud de las proximas cadenas a presentar
ajusta_cadena_guiones()
{
IS_ajusta_cadena_guiones="Genera la cadena para que tenga la longitud indicada"
INFO_SCRIPT=${IS_ajusta_cadena_guiones}

LON_CADENA=$1
CADENA_PASADA=$2

if [ "${LON_CADENA}" == "" ]; then
LON_CADENA="-?"
fi

if [ "${CADENA_PASADA}" == "" ]; then
LON_CADENA="-?"
fi


if [ "${LON_CADENA}" == "-?" ]; then

e_pmt ajusta_cadena_guiones "LONGITUD"

else
#-------------------------------------------------------------------
#- Inicio de la funcion
#-------------------------------------------------------------------

j=0
CADENA_AJUSTADA=${CADENA_PASADA}
while [ "$j" != "$LON_CADENA" ] ; do
CADENA_AJUSTADA="${CADENA_AJUSTADA}_"
let j++
done

SALIDA_ajusta_cadena_guiones=${CADENA_AJUSTADA}

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
