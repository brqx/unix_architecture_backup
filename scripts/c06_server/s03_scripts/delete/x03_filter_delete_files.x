#!/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2022
#-------------------------------------------------------------------
VERSION_SCRIPT="V 1.0.1"          #  Version del Script actual
FECHA_SCRIPT="Febrero 2022"
#-------------------------------------------------------------------
LEVEL_NIVEL=04
CONCEPT_PRODUCTO="cpanel"
CONCEPT_MOLDE="script"
CONCEPT_ARQUETIPO="fichero"
CONCEPT_LEVEL="Unix $CONCEPT_MOLDE ${CONCEPT_ARQUETIPO}"
#-==================================================================
# Funciones definidas:
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# La idea es eliminar las carpetas _BORRAR en todos los nodos sincronizados de forma segura
#- ==================================================================


##FECHA=$(date +%G_%m_%d_%H-%M)
##2022_01_14_09-30
FECHA=$(date +%G_%m)
##2022_01

SYNC_LOG_FILE=${TMPDIR}zsync_cron_${FECHA}.log

##DOCS_FOLDER=/Library/Documentos/
DOCS_FOLDER=/Library/ric/testsync/

#Usuario local por defecto
USERPERMS_LOCAL=ric

# farmacia=$(dig +short 8325.coessegur.net | grep -v webhop)

# Funcion que recibe usa variables definidas
# - Directorios SOURCE y TARGET
# - Servidor remoto USER - SERVER y PORT
# - Ejemplo Library/dir1

brqx_filter_delete_files_to_spaces()
{
VER=0.0.2
# Hay que insertar un seguro de FOLDER

if [ "${FOLDER}" != "" ] ; then 
SOURCE=$1
OLD_PATH=${PWD}
cd ${SOURCE}
EXISTE_RUTA=$?

if [ "${EXISTE_RUTA}" == "0" ] ; then
#Ready to sync
#--------------------------------------------------------------------------------------

if [ "${TMPDIR}" == "" ] ; then
TMPDIR=/tmp/
fi

echo "Eliminando ficheros filtrados ${SOURCE} en ${SERVER} ${VER}"
#xfrom_mac
# Borrado local

CARPETAS_A_BORRAR="${TMPDIR}carpetas_a_borrar.dat"

if [ -f "${CARPETAS_A_BORRAR}_totales" ] ; then
rm -f "${CARPETAS_A_BORRAR}_totales"
fi

if [ -f "${CARPETAS_A_BORRAR}_espacios" ] ; then
rm -f "${CARPETAS_A_BORRAR}_espacios"
fi

if [ -f "${CARPETAS_A_BORRAR}_sin_espacios" ] ; then
rm -f "${CARPETAS_A_BORRAR}_sin_espacios"
fi

if [ -f "${CARPETAS_A_BORRAR}_rmt" ] ; then
rm -f "${CARPETAS_A_BORRAR}_rmt"
fi

CARPETAS_TOTALES="${CARPETAS_A_BORRAR}_totales"

# echo "P0 - ${CARPETAS_A_BORRAR}_totales - $PWD"

find . -type f -name "*_BORRAR" | sed "s/ /=/g"  > ${CARPETAS_TOTALES}

# echo "P1 - ${CARPETAS_A_BORRAR}_totales"

cat "${CARPETAS_A_BORRAR}_totales" | grep    '=' > "${CARPETAS_A_BORRAR}_espacios"
cat "${CARPETAS_A_BORRAR}_totales" | grep -v '=' > "${CARPETAS_A_BORRAR}_sin_espacios"

#  echo "Borrando carpetas con espacios"

for carpeta_con in $( cat ${CARPETAS_A_BORRAR}_espacios ) ; do

carpeta="$(echo ${carpeta_con} | sed 's/=/ /g')"

## echo "Analizando - $carpeta"
relacionada=$(echo ${carpeta} | sed "s/_BORRAR//g" )

if [ -f "${carpeta}" ] ; then
## echo "Borrando carpeta ${carpeta}"
rm -f "${carpeta}" 2> /dev/null
fi

if [ -f "${relacionada}" ] ; then
## echo "Borrando carpeta ${relacionada}"
rm -f "${relacionada}" 2> /dev/null
fi

done

for carpeta in $( cat ${CARPETAS_A_BORRAR}_sin_espacios ) ; do

## echo "Analizando - $carpeta"
relacionada=$(echo ${carpeta} | sed "s/_BORRAR//g" )

if [ -f "${carpeta}" ] ; then
## echo "Borrando carpeta ${carpeta}"
rm -f "${carpeta}" 2> /dev/null
fi

if [ -f "${relacionada}" ] ; then
## echo "Borrando carpeta ${relacionada}"
rm -f "${relacionada}" 2> /dev/null
fi

done

# La ruta es en tmp
rm -f "${CARPETAS_A_BORRAR}_*"

#---=== G E S T I O N   R E M O T A ---===

# Esperamos 1 segundo
nc -z ${SERVER} ${PORT} -w 1
READY_TO_SYNC=$?

if [ "${READY_TO_SYNC}" == "0" ] ; then
#Ready to sync

# El fichero se guarda en local en tmp 

ssh -oPort=${PORT} -oPasswordAuthentication=no ${USER}@${SERVER} "find ${SOURCE} -type f -name '*_BORRAR'| sed 's/ /=/g' "  > ${CARPETAS_A_BORRAR}_rmt 2> /dev/null

cat ${CARPETAS_A_BORRAR}_rmt | grep "="    > ${CARPETAS_A_BORRAR}_espacios
cat ${CARPETAS_A_BORRAR}_rmt | grep -v "=" > ${CARPETAS_A_BORRAR}_sin_espacios


for carpeta_con in $( cat ${CARPETAS_A_BORRAR}_espacios ) ; do

carpeta="$(echo ${carpeta_con} | sed 's/=/ /g')"
relacionada=$(echo ${carpeta} | sed "s/_BORRAR//g" )

# echo "Borrando carpeta remota ${carpeta}"
ssh -oPort=${PORT} -oPasswordAuthentication=no ${USER}@${SERVER} "rm -f \"${carpeta}\"" 2> /dev/null

# echo "Borrando carpeta remota ${relacionada}"
ssh -oPort=${PORT} -oPasswordAuthentication=no ${USER}@${SERVER} "rm -f \"${relacionada}\"" 2> /dev/null
#rm -f $carpeta

done


for carpeta in $( cat ${CARPETAS_A_BORRAR}_sin_espacios ) ; do

relacionada=$(echo ${carpeta} | sed "s/_BORRAR//g" )

# echo "Borrando carpeta remota ${carpeta}"
ssh -oPort=${PORT} -oPasswordAuthentication=no ${USER}@${SERVER} "rm -f ${carpeta}"     2> /dev/null

# echo "Borrando carpeta remota ${relacionada}"
ssh -oPort=${PORT} -oPasswordAuthentication=no ${USER}@${SERVER} "rm -f ${relacionada}" 2> /dev/null

done

#ssh -oPort=${PORT} -oPasswordAuthentication=no ${USER}@${SERVER} "rm -f ${CARPETAS_A_BORRAR}_espacios" 2> /dev/null
#ssh -oPort=${PORT} -oPasswordAuthentication=no ${USER}@${SERVER} "rm -f ${CARPETAS_A_BORRAR}_sin_espacios" 2> /dev/null
#ssh -oPort=${PORT} -oPasswordAuthentication=no ${USER}@${SERVER} "rm -f ${CARPETAS_A_BORRAR}_rmt" 2> /dev/null
#ssh -oPort=${PORT} -oPasswordAuthentication=no ${USER}@${SERVER} "rm -f ${CARPETAS_A_BORRAR}_totales" 2> /dev/null


else
echo "Server ${SERVER} : ${PORT} not ready to sync-filter-delete"

#END Ready to sync
#--------------------------------------------------------------------------------------
fi
else

echo "Ruta no existe para sincronizar/fiter delete en  ${SERVER} : ${PORT} - > ${SOURCE} "

#END Existe ruta
#--------------------------------------------------------------------------------------
fi 

rm -f "${CARPETAS_A_BORRAR}_*"

cd ${OLD_PATH}
fi
}

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# XYN - SINCRONISMO - BORRADO DE CARPETAS EN TODOS LOS EQUIPOS
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

# Sincronismo hacia lenovo
filter_delete_files_leno()
{
FOLDER=$1
SERVER=lenovo ; PORT=60022 ; USER=ric  ; USERPERMS=ric ; USERPERMSRMT=ric
brqx_filter_delete_files_to_spaces ${FOLDER}
}

# Sincronismo hacia mac mini i7
filter_delete_files_mac7()
{
FOLDER=$1
SERVER=maci7 ; PORT=22 ; USER=macminii7  ; USERPERMS=macminii7 ; USERPERMSRMT=macminii7 
brqx_filter_delete_files_to_spaces ${FOLDER}
}

# Sincronismo hacia mac mini i7
filter_delete_files_mac_salon()
{
FOLDER=$1
SERVER=mac_salon ; PORT=22 ; USER=ric  ; USERPERMS=ric
brqx_filter_delete_files_to_spaces ${FOLDER}
}

# Sincronismo hacia mac mini i7
filter_delete_files_farm()
{
# No funciona el cambio de usuario apache 
# Linea de cron */10 9-19 * * * chmod -R 775 /ssd/Documentos && chown -R apache. /ssd/Documentos &> /dev/null

FOLDER=$1
SERVER=8325.coessegur.net ; PORT=60022 ; USER=ric  ; USERPERMS=ric
brqx_filter_delete_files_to_spaces ${FOLDER}
}

# Sincronismo hacia DS
filter_delete_files_revo()
{
FOLDER=$1
SERVER=revo ; PORT=60022 ; USER=ric  ; USERPERMS=ric
brqx_filter_delete_files_to_spaces ${FOLDER}
}

# Sincronismo hacia DS
filter_delete_files_zt()
{
FOLDER=$1
SERVER=tbrqx.com ; PORT=60022 ; USER=ric  ; USERPERMS=ric
brqx_filter_delete_files_to_spaces ${FOLDER}
}

# Sincronismo hacia DS
filter_delete_files_za()
{
FOLDER=$1
SERVER=abrqx.com ; PORT=60022 ; USER=ric  ; USERPERMS=ric
brqx_filter_delete_files_to_spaces ${FOLDER}
}

# Sincronismo hacia DS
filter_delete_files_zd()
{
FOLDER=$1
SERVER=dbrqx.com ; PORT=60022 ; USER=ric  ; USERPERMS=ric
brqx_filter_delete_files_to_spaces ${FOLDER}
}

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# SYN_FOR - SINCRONISMO ESPECIFICO PARA LOS EQUIPOS
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

filter_delete_files_for_lenovo()
{
filter_delete_files_farm ${DOCS_FOLDER}a
filter_delete_files_farm ${DOCS_FOLDER}c

filter_delete_files_mac7 ${DOCS_FOLDER}a
filter_delete_files_mac7 ${DOCS_FOLDER}c

filter_delete_files_revo ${DOCS_FOLDER}a
filter_delete_files_revo ${DOCS_FOLDER}c

filter_delete_files_zt ${DOCS_FOLDER}a
filter_delete_files_zt ${DOCS_FOLDER}c

filter_delete_files_za ${DOCS_FOLDER}a
filter_delete_files_za ${DOCS_FOLDER}c

filter_delete_files_zd ${DOCS_FOLDER}a
filter_delete_files_zd ${DOCS_FOLDER}c

}

filter_delete_files_for_revo()
{
filter_delete_files_leno ${DOCS_FOLDER}a
filter_delete_files_leno ${DOCS_FOLDER}c
}

filter_delete_files_for_macsalon()
{
filter_delete_files_leno ${DOCS_FOLDER}a
filter_delete_files_leno ${DOCS_FOLDER}c
}

## xyn_for_lenovo

DOCS_FOLDER=/Library/Documentos/

filter_delete_files_for_lenovo
