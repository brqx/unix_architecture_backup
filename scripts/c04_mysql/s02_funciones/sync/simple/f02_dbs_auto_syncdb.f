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
CONCEPT_CARACTER_04="especifico"
CONCEPT_MOLDE_04="funciones"
CONCEPT_PRODUCTO_04="mysql"
CONCEPT_ARQUETIPO_04="simple"
#-------------------------------------------------------------------
CONCEPT_LEVEL_04="${CONCEPT_FORMATO_04} ${CONCEPT_MOLDE_04} ${CONCEPT_CARACTER_04} ${CONCEPT_ARQUETIPO_04}"
CONCEPT_LEVEL_04="${CONCEPT_LEVEL_04} ${CONCEPT_PRODUCTO_04} "
#-==================================================================
#+ Funciones Especificas de las plataformas - Mysql - Nivel 04
#-==================================================================
#- Sincroniza la base de datos indicada
# + Para ello usara todos los parametros del fichero zdominios
#-==================================================================
#+ Funciones definidos:
#-------------------------------------------------------------------
#-- dbg_export_currentdate
#-------------------------------------------------------------------
#- Funciones Requeridas
#-------------------------------------------------------------------
#-- dbg_export_databases
#-------------------------------------------------------------------
#- Ejemplo
#-------------------------------------------------------------------
#-- dbs_xyncdb ${BD1} ${BD2} ${DB_SERVER_DESTINO} ${ENTORNO_DESTINO}  ${ENTORNO_DESTINO};
#-==================================================================

#alias dbc
dbs_auto_xyncdb()
{
        db_local=${1};
        db_remote=${2};
        db_server=${3};
        usuario_destino=${4};

#- Recuperacion de los parametros de Zdominios



#- Recuperacion de variables globales : 

	local_outgoing=${DB_GLOBAL_SYNC_OUT}

#- Exportar base de datos
	dbs_exportdb ${db_local} ${db_remote}

#- Sincronizar base de datos
	dbs_syncdb ${db_remote}

#- Carga de la BD en el servidor remoto	
	ssh -oPort=22 root@${db_server} "/root/scripts/load_db.x  ${db_remote}"

#- Generar privilegios en servidor remoto

	echo "Lanzando : mysql -u root -e 'grant all privileges  ON ${db_remote}.* to '${usuario_destino}_brqx'@'localhost';"
        ssh -oPort=22 root@${db_server} \
        "mysql -u root -e 'grant all privileges \
        ON ${db_remote}.* to ${usuario_destino}_brqx@localhost; flush privileges'"

# Ahora falta eliminar todo

##        ssh -oPort=65533 root@ebrqx.com "rm -f ${local_outgoing}/*sql*"


}