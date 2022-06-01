#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.4
@pythonver: 3.3
-----------------------------------------------------------
+ Clases definidas          : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- SpazioMsg         - Clase de gestion de mensajes de Spazio
-----------------------------------------------------------
-+ Clases heredadas         : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- getsetGen         - Clase de get y sets
-----------------------------------------------------------
+ Librerias Primeur requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
-----------------------------------------------------------
+ Librerias Sistema requeridas
-----------------------------------------------------------
- Ninguna
===========================================================
+ Process Status  : [130624]
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Quality        : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Comments       : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Info           : [0] [1] [2] [3] [4] [_]
-----------------------------------------------------------
#- Just           : [0] [1] [2] [3] [_] [5]
===========================================================
"""

#- Importacion de clases

from oo_getsetgen import getsetGen


class SpazioMsg(getsetGen):

    __cls                           = "SpazioMsg"
    __mth                           = ""    
    __log_level                     = 0
    __log_class_level               = 0

    __log_show                      = "screen"
    __log_file                      = ""    # Log file por defecto
    __log_file_alt                  = ""    # Log file alterno

    #-Atributos publicos
    #-Literales para impresion de log especificos    
    msg_destination_filename        = "Destination FileName"
    msg_source_filename             = "Source FileName"
    msg_destination_filename_no_ext = "Destination FileName"
    msg_source_filename_no_ext      = "Source FileName"


    msg_qmname                      = "Gestor de Colas"
    msg_queue                       = "Cola"
    msg_numint                      = "Numint"
    msg_correl_id                   = "Correl Id"
    msg_sender                      = "Sender"
    msg_directory                   = "Directorio destino"
    msg_description                 = "Description"
    msg_modality                    = "Modality"
    msg_user                        = "User"
    msg_passwd                      = "Passwd"


    msg_LOG_SHOW                    = "Nivel de log"
    msg_log_show                    = "Nivel de log en presentacion"

    msg_extraccion                  = "Extraccion"
    msg_sobrescritura               = "Sobrescritura"
    msg_compress                    = "Compresion"
    msg_trigger                     = "Bandera"

    #-Duplicados
    msg_copydup                     = "CopyDup - Gestion de duplicados"
    msg_delete_file                 = "Opcion de borrado una vez extraido"


    msg_post_process                = "Post Procesoo"
    msg_post_process_args           = "Argumentos Post Proceso"

    msg_tuple_correl_id             = "Tupla correl id"
    msg_rules_file                  = "Fichero de Reglas"

    msg_nod                         = "Nod Filelist"
    msg_csv                         = "Csv Filelist"
    msg_banner                      = "Banner Filelist"

    #-Atributos preproceso

    msg_user_class                  = "Clase de usuario"    
    msg_standard                    = "Standard"    
    msg_compressor                  = "Compressor"    
    msg_backup_dir                  = "Ruta de backup"    
    msg_modification_time           = "Tiempo minimo de modificacion"    

    msg_result                      = "Resultado de la operación"    
    

    #-Atributos spev

    msg_sess_id                     = "Identificador de sesion"    
    msg_spev_type                   = "Tipo de reintento"


    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                                       , 
                 log_level              =   0               ,
                 log_class_level        =   0               ,
                 log_show               =   "screen"        ,
                 log_file               =   ""              ,
                 log_size               =   1000000         ):
        """ De momento sin argumentos
        """

        mth = "init"

        #- Establecimiento nivel de log
        self.__log_level = log_level

        self.LogInitConstructor(log_level           , 
                                log_class_level     , 
                                log_show            )

        log_class_level = log_class_level + 1        

        self.__log_class_level = log_class_level

        #-Estableciendo fichero de log
        self.__log_show     =   log_show
        
        self.__log_file     =   log_file

        
        getsetGen.__init__( self                , 
                            log_level           , 
                            log_class_level     ,
                            log_show            ,
                            log_file            ,
                            log_size            )



        if log_level >log_class_level:
            self.sInfoConstructor(self.__cls)

            if log_level > 80:
                self.__Log(self.msg         ,
                           self.bline       ,
                           mth              ,
                           "simple_simple"  )

        self.LogEndConstructor()
        

    #-Clase de log alternada
    def __LogAlt(self                           ,
              texto         =   ""              ,
              valor         =   ""              ,
              mth           =   "init"          ,
              dec           =   "normal"        ):
        """ Log de la clase
        """        
        if mth == "":
            mth = self.__mth

        cls = self.__cls

        log_level       = self.__log_level
        log_class_level = self.__log_class_level
        log_show        = self.__log_show
        log_file_alt    = self.__log_file_alt

           
        self.log(texto              , 
                 valor              ,
                 cls                ,
                 mth                ,        
                 dec                ,
                 log_level          ,
                 log_class_level    ,
                 log_show           ,
                 log_file_alt       )        


    #-Clase de log de traza
    def __Log(self                          ,
              texto                         ,
              valor         =   ""          ,
              mth           =   "init"      ,
              dec           =   "normal"    ):
        """ Log de la clase para traza
        """        

        self.__log_file_alt  = self.__log_file

        self.__LogAlt(texto                 ,
                      valor                 ,
                      mth                   ,
                      dec                   )

    
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

