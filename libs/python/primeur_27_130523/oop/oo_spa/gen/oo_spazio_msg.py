#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.1
-----------------------------------------------------------
+ Clases definidas : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- SpazioMsg   : Clase de gestion de mensajes de Spazio
-----------------------------------------------------------
+ Librerias Primeur requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- pendiente        : pendiente
-----------------------------------------------------------
+ Librerias Sistema requeridas
-----------------------------------------------------------
- pendiente
===========================================================
+ Process Status  : [1308]
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Quality        : [0] [1] [2] [_] [4] [5]
-----------------------------------------------------------
#- Comments       : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Info           : [0] [1] [2] [_] [4] [5]
-----------------------------------------------------------
#- Just           : [0] [_] [2] [3] [4] [5]
===========================================================
"""

#- Importacion de clases

from oo_getsetgen import getsetGen


class SpazioMsg(getsetGen):

    __cls               = "SpazioMsg"
    __mth               = ""    
    __log_level         = 0
    __log_class_level   = 0


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


    msg_post_process                = "Post Procesoo"
    msg_post_process_args           = "Argumentos Post Proceso"

    msg_tuple_correl_id             = "Tupla correl id"
    msg_rules_file                  = "Fichero de Reglas"

    msg_nod                         = "Nod Filelist"
    msg_csv                         = "Csv Filelist"
    msg_banner                      = "Banner Filelist"

    #-Atributos preproceso

    msg_user_class            = "Clase de usuario"    
    msg_standard              = "Standard"    
    msg_compressor            = "Compressor"    
    msg_backup_dir            = "Ruta de backup"    
    msg_modification_time     = "Tiempo minimo de modificacion"    

    msg_result                = "Resultado de la operación"    
    

    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self, 
                 log_level          = 0         ,
                 log_class_level    = 0         ,
                 log_show           = "screen"  ):
        """ De momento sin argumentos
        """
        self.__log_level = log_level

        self.LogInitConstructor()
        log_class_level = log_class_level + 1        

        self.__log_class_level = log_class_level
        
        getsetGen.__init__(self, 
                           log_level, 
                           log_class_level)

        if log_level >log_class_level:
            self.sInfoConstructor(self.__cls)
            self.__Log(self.msg)

        self.LogEndConstructor()
        

    def __Log(self                          ,
              texto                         ,
              valor         =   ""          ,
              mth           =   "init"      ,
              dec           =   "normal"    ):
        """ Log de la clase
        """        
        if mth == "":
            mth = self.__mth

        cls = self.__cls

        log_level       = self.__log_level
        log_class_level = self.__log_class_level

           
        self.log(texto      , 
                 valor      ,
                 cls                ,
                 mth                ,        
                 dec                ,
                 log_level          ,
                 log_class_level    )        

    
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

