#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.5
@pythonver: 3.3
-----------------------------------------------------------
+ Clases definidas                  : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- PostProcesoMsg        - Clase de gestion de mensajes de PostPc
-----------------------------------------------------------
-+ Clases heredadas                 : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- getsetGen             - Clase de get y sets
-----------------------------------------------------------
+ Librerias Primeur requeridas      :
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
-----------------------------------------------------------
+ Librerias Sistema requeridas      :
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
===========================================================
+ Process Status  : [130701]
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Quality        : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Comments       : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Info           : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Just           : [0] [1] [2] [3] [_] [5]
===========================================================
"""

#- Importacion de clases

from oo_getsetgen import getsetGen


class PostProcesoMsg(getsetGen):

    #-Variable estatica para indicar el nombre de la clase
    __cls                   = "PostProcesoMsg"
    __mth                   = ""    
    __log_level             = 0
    __log_class_level       = 0

    __log_show              = "screen"
    __log_file              = ""    
    __log_file_alt          = ""    # Log file alterno
    __log_file_err          = ""    # Log file de errores

    #-Atributos publicos
    #-Literales para impresion de log especificos    

    msg_destination_filename            = "Fichero Destino"
    msg_destination_filename_no_ext     = "Fichero Destino sin extension"

    msg_directory                       = "Ruta Destino"

    msg_process                         = "Proceso"
    msg_trigger                         = "Fichero Bandera"

    msg_copydup                         = "Control de duplicados"
    msg_delete_file                     = "Opcion de borrado una vez extraido"

    msg_delete_trigger                  = "Borrado trigger una vez generado"

    msg_compress                        = "Compresion"
    msg_post_args                       = "Argumentos postproceso"

    msg_full_path_filename              = "Ruta completa del fichero a extraer"

    msg_full_path_trigger               = "Ruta completa del trigger generado"

    #-Atributos gestion de mensajes de salida

    msg_exit_code                       = "Codigo de retorno de la funcion"
    msg_exit_str                        = "Mensaje de retorno de la funcion"
    
    msg_exit_str_ok                     = "Proceso correcto"
    
    #-Codigos de salida del Post Proceso
    #- Pendiente de implementar    
    

    #-Mensajes de salida del Post Proceso
    #- Pendiente de implementar    
    


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

        
        getsetGen.__init__(self                     , 
                           log_level                , 
                           log_class_level          ,
                           log_show                 ,
                           log_file                 ,
                           log_size                 )


        if log_level > log_class_level:
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

