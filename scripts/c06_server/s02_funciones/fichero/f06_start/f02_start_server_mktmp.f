#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.1"          #  Version del Script actual
FECHA_SCRIPT="Febrero 2011"
#-------------------------------------------------------------------
LEVEL_NIVEL=04
CONCEPT_PRODUCTO="cpanel"
CONCEPT_MOLDE="funcion"
CONCEPT_ARQUETIPO="fichero"
CONCEPT_LEVEL="Lista $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO}"
#-==================================================================
# Funciones definidas:
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#- start_server_mktmp
#-------------------------------------------------------------------
# Ejemplo base:
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#
# "Sincronizando   Local    ${RUTA_LOCAL}                        "
# "--------------------------------------------------------------"
# "  Local      EBRQX -   ${RUTA_LOCAL}                          "
# "  Destino    ABRQX -   ${RUTA_DESTINO}                        "
# "--------------------------------------------------------------"
#
# start_server_mktmp "${RUTA_LOCAL}" ${RUTA_DESTINO}
#-------------------------------------------------------------------
# Informacion
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# La idea es auto sincronizar rutas paralelas entre servidores
#-------------------------------------------------------------------
#- Adaptacion ABRQX
#- =================================================================
# Recibe como primer parametro el fuente y como segundo el destino
# La idea es que sincronice la carpeta actual, pues pasarle una carpeta
# al ser la ruta tan larga es un poco absurdo.

start_server_mktmp()
{
IS_start_server_mktmp="Regenera las carpetas temporales para Drupal"
INFO_SCRIPT=${IS_gvim}

# Primiero creamos las carpetas principales
LISTA_MAIN_SITES=`cat /home/zsitestmp.dat | grep -v "subdomain" | tr "\n" " "`;
LISTA_SUBDOMAIN=`cat /home/zsitestmp.dat | grep "subdomain" | cut -d ":" -f1 |  tr "\n" " "`;

for i in ${LISTA_MAIN_SITES}
do
mkdir -p /dev/shm/cache/$i/tmp

chown -R $i:$i /dev/shm/cache/$i/tmp
sleep 2
echo "Actualizado $i"
done

# Second part subdomain

for i in ${LISTA_SUBDOMAIN}
do
ARCHIVO=/home/$i/www/subdominios.dat
for j in `cat $ARCHIVO`
do
COLECCION=`echo $j | cut -d ":" -f1`
PORTAL=`echo $j | cut -d ":" -f2`

echo "Creando /dev/shm/cache/$i/${COLECCION}/${PORTAL}/tmp"
mkdir -p /dev/shm/cache/$i/${COLECCION}/${PORTAL}/tmp

done
done

for i in ${LISTA_MAIN_SITES}
do
echo "Cambiando usuario $i :  /dev/shm/cache/$i"
chown -R $i:$i /dev/shm/cache/$i
done
}

#------------------------------------------------------------------------

test_server_mktmp()
{
# Primiero creamos las carpetas principales
LISTA_MAIN_SITES=`cat /home/zsitestmp.dat | grep -v "subdomain" | tr "\n" " "`;
LISTA_SUBDOMAIN=`cat /home/zsitestmp.dat | grep "subdomain" | cut -d ":" -f1 |  tr "\n" " "`;

for i in ${LISTA_MAIN_SITES}
do

sleep 2
echo "Actualizado $i :  /dev/shm/cache/$i/tmp"
## mkdir -p /dev/shm/cache/$i/tmp
done

# Second part subdomain

for i in ${LISTA_SUBDOMAIN}
do
ARCHIVO=/home/$i/www/subdominios.dat
for j in `cat $ARCHIVO`
do
COLECCION=`echo $j | cut -d ":" -f1`
PORTAL=`echo $j | cut -d ":" -f2`

echo "Creando /dev/shm/cache/$i/${COLECCION}/${PORTAL}/tmp"
## mkdir -p /dev/shm/cache/$i/${COLECCION}/${PORTAL}/tmp
done
done

#- User change
for i in ${LISTA_MAIN_SITES}
do

sleep 2
echo "Cambiando usuario $i :  /dev/shm/cache/$i"
## chown -R $i:$i /dev/shm/cache/$i
done


}


#-------------------------------------------------------------------
#+ Sistema de trazado N5 - parametrizado
#-------------------------------------------------------------------
if [ "${N5}" != "" ] ; then
echo "${LEVEL_NIVEL_05}/${LEVEL_NIVEL}--${CONCEPT_LEVEL_05}"
fi
#-------------------------------------------------------------------

#-==================================================================
#+ Vaciado de Variables
#-------------------------------------------------------------------
limpia_variables;
#-==================================================================
