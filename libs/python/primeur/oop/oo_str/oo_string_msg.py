#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.3
@pythonver: 3.3
-----------------------------------------------------------
+ Clases definidas          : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- StringMsg         - Clase de gestion de mensajes de Spazio
-----------------------------------------------------------
-+ Clases heredadas         : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- getsetGen         - Clase de get y sets
-----------------------------------------------------------
-+ Metodos definidos : 
-----------------------------------------------------------
- Pendiente  (init, gets y sets)
-----------------------------------------------------------
+ Librerias Primeur requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
-----------------------------------------------------------
+ Librerias Sistema requeridas
-----------------------------------------------------------
- Ninguna
===========================================================
+ Process Status  : [130520]
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Quality        : [0] [1] [2] [_] [4] [5]
-----------------------------------------------------------
#- Comments       : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Info           : [0] [1] [2] [_] [4] [5]
-----------------------------------------------------------
#- Just           : [0] [1] [_] [3] [4] [5]
===========================================================
"""

#- Importacion de clases

from oo_getsetgen import getsetGen


class StringMsg(getsetGen):

    #-Variable estatica para indicar el nombre de la clase
    __cls                   = "StringMsg"
    __mth                   = ""    
    __log_level             = 0
    __log_class_level       = 0

    __log_show              = "screen"
    __log_file              = ""    # Log file por defecto
    __log_file_alt          = ""    # Log file alterno

    #-Atributos publicos
    msg_cadena              = "Cadena a parsear"
    
    msg_left                = "Parte izda del separador"
    msg_right               = "Parte dcha del separador"

    msg_pos_comodin         = "Posicion del comodin si existe"
    msg_pos_finalizador     = "Posicion del finalizador si existe"

    msg_pos_separador       = "Posicion del primer separador si existe"

    msg_first_separador     = "Primer separador si existe"


    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                                   , 
                 log_level              = 0             ,
                 log_class_level        = 0             ,
                 log_show               = "screen"      ,
                 log_file               = ""            ,
                 log_size               = 1000000       ):
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
        self.__log_file     =   log_file
        self.__log_show     =   log_show

        
        getsetGen.__init__( self                        , 
                            log_level                   , 
                            log_class_level             ,
                            log_show                    ,
                            log_file                    ,
                            log_size                    )

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

