#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.3
-----------------------------------------------------------
+ Clases definidas              : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- SpazioSpv   - Clase de Spazio de re-envio - Spv
-----------------------------------------------------------
+- Clases heredadas             : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- Spazio      - Clase principal de Spazio
-----------------------------------------------------------
+- Metodos definidos    : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- init        - Constructor (Spazio) - initSpDsp
-----------------------------------------------------------
+ Librerias Primeur requeridas  :
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
-----------------------------------------------------------
+ Librerias Sistema requeridas  :
-----------------------------------------------------------
- Ninguna
===========================================================
+ Process Status  : [130519]
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Quality        : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Comments       : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Info           : [0] [1] [2] [_] [4] [5]
-----------------------------------------------------------
#- Just           : [0] [1] [_] [3] [4] [5]
===========================================================
"""

#- Importacion de clases heredadas

from oo_spazio_est import SpazioEst


class SpazioSpv(SpazioEst):

    #-Variable estatica para indicar el nombre de la clase
    __cls               = "SpazioSpv"
    __mth               = ""    
    __log_level         = 0
    __log_class_level   = 0
    
    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                           , 
                 qmname                         , 
                 queue                          , 
                 numint                         , 
                 log_level          = 0         ,
                 log_class_level    = 0         ,
                 log_show           = "screen"  ):
        """ Procesa e inicializa las clases de Spazio para Acq
        """

        self.__log_level = log_level

        self.LogInitConstructor()
        log_class_level = log_class_level + 1        

        self.__log_class_level = log_class_level
        
        Spazio.__init__(self        , 
            qmname                  , 
            queue                   , 
            numint                  , 
            log_level               ,
            log_class_level         ,
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
