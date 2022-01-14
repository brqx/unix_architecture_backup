#!/usr/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2010
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.1"          #  Version del Script actual
FECHA_SCRIPT="Enero 2011"
#-------------------------------------------------------------------
LEVEL_NIVEL=04		# Variable control profundidad alcanzada
LEVEL_NIVEL_04=04	# Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_MOLDE_04="variables"
CONCEPT_PRODUCTO_04="mysql"
CONCEPT_ARQUETIPO_04="user"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-==================================================================
#+ Variables Especificas de las plataformas - Nivel 02
#-==================================================================
#+ Funciones definidos:
#-------------------------------------------------------------------
#-- db_global_clean
#-------------------------------------------------------------------
#+ Funciones Requeridas
#-------------------------------------------------------------------
#-- 
#-------------------------------------------------------------------
#-- Estado : Pendiente - Pensado - Codificado - [Linkado] - Probado
#-==================================================================

## - Limpia la cache de drupal de todas las BBDD
db_global_clean()
{
USUARIO=$1
CADENA_BD=$2

if [ "${USUARIO}" != "" ] ; then
#- Se le pasa Usuario


echo "Limpieza total de BD -  Servidor $(uname -n)"
echo "------------------------------------------------------"

for i in `cat /brqx/zbbdd_servidor.dat`
do
USUARIO=`echo $i | cut -d ":" -f1`
CADENA_BD=`echo $i | cut -d ":" -f2`

##echo "$USUARIO - $CADENA_BD "

php -f ${RUTA_LIBRERIAS}php/bbdd/clear/clear_database.php \
$USUARIO $CADENA_BD  # \
##&> /tmp/replace.log

done

else

#- No se le pasa bbdd

echo "=================================================="
echo " Script db_global_clean - Error de parametros	  "
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=="
echo " Formato :													  "
echo "--------------------------------------------------"
echo  "db_global_clean <usuario>	<cadena_bd>				  "
echo "=================================================="


fi


}





