#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2010
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.1"          #  Version del Script actual
FECHA_SCRIPT="Diciembre 2010"
#-------------------------------------------------------------------
LEVEL_NIVEL=04		# Variable control profundidad alcanzada
LEVEL_NIVEL_04=04	# Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_MOLDE_04="funciones"
CONCEPT_PRODUCTO_04="mysql"
CONCEPT_ARQUETIPO_04="global"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-==================================================================
#+ Funciones Especificas de las plataformas - Mysql - Nivel 04
#-==================================================================
# Exporta todas las BBDD del servidor a la carpeta por defecto o a
# una indicada como parametro
#-==================================================================
#+ Funciones definidos:
#-------------------------------------------------------------------
#-- dbg_export_databases
#-------------------------------------------------------------------
#- Funciones Requeridas
#-------------------------------------------------------------------
#-- Exporta todas las bases de datos en la ruta actual o en la que le
#   pasemos como parametro
#-------------------------------------------------------------------
#-- Estado : Pendiente - Pensado - Codificado - [Linkado] - Probado
#-==================================================================

#alias dbx
dbg_export_databases()
{

CARPETA_DESTINO=$1
RUTA_ACTUAL=$PWD

if [ "${CARPETA_DESTINO}" != "/?" ] ; then
#- No se solicita ayuda


if [ "${CARPETA_DESTINO}" != "" ] ; then
cd ${CARPETA_DESTINO} ;
else
cd ${DB_GLOBAL_EXPORT}
fi


echo "Exportando Bases de datos del servidor $(uname -n)"
echo "--------------------------------------------------"

## Aqui igual hay que cambiarlo por solo las de drupal
for i in $(mysql -s -e "show databases")
do 
mysqldump --single-transaction --quick -e $i > $i.sql
done

echo "Generando los archivos comprimidos"

for i in *
do 
tar zcpvf ./$i.tar.gz $i
rm -f $i
done

cd ${RUTA_ACTUAL}

else

#- No se le pasa bbdd

echo "=================================================="
echo " Script dbg_export_databases - Error de parametros"
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=="
echo " Formato :					"
echo "--------------------------------------------------"
echo  "dbg_export_databases [<carpeta_destino>]			  "
echo "=================================================="

fi

}