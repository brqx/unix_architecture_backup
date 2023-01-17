#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.3
-----------------------------------------------------------
+ Clases definidas : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- ParseFechaEst      : Clase de estructgura de parse de fechas
-----------------------------------------------------------
-+ Clases heredadas : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- ParseFechaMsg      : Clase de mensajes de parso de fechas
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
+ Process Status  : [130516]
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


#- Importacion de clases heredadas

from oo_parse_fecha_msg import ParseFechaMsg


class ParseFechaEst(ParseFechaMsg):

    #-Variable estatica para indicar el nombre de la clase
    __cls           = "ParseFechaEst"
    __mth           = ""    
    __log_level             = 0
    __log_class_level       = 0


    __valor_resultado = ""


    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                               , 
                 log_level              = 0         ,
                 log_class_level        = 0         ,
                 log_show               = "screen"  ):
        """ Constructor de estructura de parseo de fechas
        """
        self.__log_level = log_level

        self.LogInitConstructor()
        log_class_level = log_class_level + 1        

        self.__log_class_level = log_class_level

        ParseFechaMsg.__init__( self                    ,
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



    def getValorResultado(self):
        """ Retorno del Nombre Fichero Destino
        """    

        valor_a_devolver = self.__valor_resultado
        self.logGet(valor_a_devolver, 
                    self.msg_valor_resultado)
        return valor_a_devolver

    
    def setValorResultado(self, argumento):
        """ Establecimiento del Sender
        """    

        variable_a_establecer = self.__valor_resultado

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_valor_resultado)

        self.__valor_resultado = argumento


#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
