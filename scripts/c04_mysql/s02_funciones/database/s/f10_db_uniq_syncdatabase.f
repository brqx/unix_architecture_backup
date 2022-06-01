#!/usr/bin/bash
#-------------------------------------------------------------------
# Funciones Entornos Unix - Brqx Site - Brqx Org
# Brqx Org - Rct - 2011
#-------------------------------------------------------------------
VERSION_SCRIPT="V 6.2"          #  Version del Script actual
FECHA_SCRIPT="Enero 2011"
#-------------------------------------------------------------------
LEVEL_NIVEL=04		# Variable control profundidad alcanzada
LEVEL_NIVEL_04=04	# Variable control script
CONCEPT_FORMATO_04="script"
CONCEPT_MOLDE_04="variables"
CONCEPT_PRODUCTO_04="mysql"
CONCEPT_ARQUETIPO_04="database"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04}  ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-==================================================================
#+ Variables Especificas de las plataformas - Nivel 02
#-==================================================================
#-==================================================================
#+ Funciones definidos:
#-------------------------------------------------------------------
#-- dbs_syncdb
#-------------------------------------------------------------------
#- Funciones Requeridas
#-------------------------------------------------------------------
#-- sql_sync- dbr_drop - dbr_create - dbr_restore
#-------------------------------------------------------------------
#-- Ejemplo : 
#-------------------------------------------------------------------
#-- dbs_syncdb za_d50palil ibrqx.com 22
#-------------------------------------------------------------------
#-- xypdb ...
#-------------------------------------------------------------------
#-- Estado : Pendiente - Pensado - [Codificado] - Linkado - Probado
#-==================================================================

# alias xypdb
## - Sincroniza la base de datos en un servidor remoto
dbs_syncdb()
{
if   [ "$#" = "3" ] ; then
#echo "Pasado minutos";


# Recibe como parametro la cadena de la BD remota, el servidor y el puerto

	db_remote=${1};
	db_server=${2};
	db_port=${3};

#- Recuperacion de variables globales : 

	local_outgoing=${DB_GLOBAL_SYNC_OUT}
	remote_outgoing=${DB_GLOBAL_SYNC_IN}

echo "==--==--==--==--==--==--==--==--==--==--==--==--=="
echo " Haciendo sincronizacion :			"
echo "--------------------------------------------------"
echo " Servidor : ${db_server}::${db_remote}:${db_port}	"
echo " ${local_outgoing} ==>  ${remote_outgoing}	"
echo "==--==--==--==--==--==--==--==--==--==--==--==--=="


#- Sincronizar base de datos - el fichero

	sql_sync ${db_remote} ${db_server} ${db_port}

	rsync -avz -e "ssh -oPort=${db_port}" ${local_outgoing}/${db_remote}.sql* root@${db_server}:${remote_outgoing}

#- Recrear la BBDD
	dbr_drop ${db_remote} ${db_server} ${db_port}
	dbr_create ${db_remote} ${db_server} ${db_port}

#- Carga de la BD en el servidor remoto	
	dbr_restore ${db_remote} ${db_server} ${db_port}

#- Falta Eliminar ficheros residuales

else

echo "==--==--==--==--==--==--==--==--==--==--==--==--=="
echo "Parametros insuficientes				"
echo "--------------------------------------------------"
echo "Ejemplo:						"
echo "--------------------------------------------------"
echo "dbs_syncdb <Nombre_BBDD> <Servidor> <Puerto>	"
echo "==--==--==--==--==--==--==--==--==--==--==--==--=="
fi

}

