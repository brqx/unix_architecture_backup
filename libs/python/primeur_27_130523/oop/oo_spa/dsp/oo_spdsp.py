#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.3
-----------------------------------------------------------
+ Clases definidas : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- SpazioDsp   : Clase de Spazio de envio - Dsp
-----------------------------------------------------------
+- Clases heredadas : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- Spazio      : Clase principal de Spazio
-----------------------------------------------------------
+- Metodos definidos : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- init        : Constructor (Spazio) - initSpDsp
-----------------------------------------------------------
+ Librerias Primeur requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
-----------------------------------------------------------
+ Librerias Sistema requeridas
-----------------------------------------------------------
- Ninguna
===========================================================
+ Process Status : [130520]
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Quality       : [0] [1] [2] [3] [4] [_]
-----------------------------------------------------------
#- Comments      : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Info          : [0] [1] [2] [_] [4] [5]
-----------------------------------------------------------
#- Just          : [0] [1] [2] [3] [_] [5]
===========================================================
"""

#- Importacion de clases Heredadas

from oo_spazio import Spazio


class SpazioDsp(Spazio):

    #-Variable estatica para indicar el nombre de la clase
    __cls                   = "SpazioDsp"
    __mth                   = ""    
    __log_level             = 0
    __log_class_level       = 0

    
    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                               ,  
                 qmname                             ,
                 queue                              ,
                 destination_filename               , 
                 source_filename                    , 
                 sender                             ,
                 userclass                          ,
                 description                        ,
                 standard                           ,
                 compressor                         ,
                 dirbackup                          ,
                 user                               ,
                 passwd                             ,
                 log_level              = 0         ,
                 log_class_level        = 0         ,
                 log_show               = "screen"  ):
        """ Inicia Spazio para procesar el Envio - Dsp
        """
        self.LogInitConstructor()
        log_class_level = log_class_level + 1        

        numint = ""   #- En envio no conocemos el numint
        
        Spazio.__init__(self                    , 
                        qmname                  , 
                        queue                   , 
                        numint                  , 
                        log_level               ,
                        log_class_level)        ,
                        log_show                )


        self.initSpDsp( destination_filename    , 
                        source_filename         , 
                        sender                  ,
                        userclass               ,
                        description             ,
                        standard                ,
                        compressor              ,
                        dirbackup               ,
                        user                    ,
                        passwd                  ,
                        log_level               ,
                        log_class_level)        ,
                        log_show                )

        
        if log_level > log_class_level:
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

