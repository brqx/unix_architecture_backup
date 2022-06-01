#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.1
-----------------------------------------------------------
+ Clases definidas : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- getsetGen      : Clase de get  y set
-----------------------------------------------------------
-+ Clases heredadas : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- Log           : Clase de Logs
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
+ Process Status  : [130517]
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Quality        : [0] [1] [2] [_] [4] [5]
-----------------------------------------------------------
#- Comments       : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Info           : [0] [1] [2] [_] [4] [5]
-----------------------------------------------------------
#- Just           : [0] [1] [?] [3] [4] [5]
===========================================================
"""

#- Importacion de clases heredadas

from oo_log import Log


class getsetGen(Log):

    #-Variable estatica para indicar el nombre de la clase
    __cls           = "getsetGen"
    __mth           = ""    
    __log_level         = 0
    __log_class_level   = 0

    
    #-Literales para impresion de log genericos
    msg_set             =   "Estableciendo"
    msg_get             =   "Accediendo"

    msg_literal_clase   =   "Clase"
    msg_literal_init    =   "construida"


    #- Literales genericos para manejar mensajes
    __msg               =   ""
    
    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                               , 
                 log_level              = 0         ,
                 log_class_level        = 0         ,
                 log_show               = "screen"  ):
        """ Constructor de mensajes get y set
        """

        self.__log_level = log_level

        self.LogInitConstructor()
        log_class_level = log_class_level + 1        

        self.__log_class_level = log_class_level
        
        
        Log.__init__(self, log_level)    



        if log_level > log_class_level:
            self.sInfoConstructor(self.__cls)
            self.__Log(self.msg)

        self.LogEndConstructor()


    def __Log(self                      ,
              texto                     ,
              valor     =   ""          ,
              mth       =   "init"      ,
              dec       =   "normal"    ):
        """ Log de la clase
        """        
        if mth == "":
            mth = self.__mth

        cls = self.__cls

        log_level       = self.__log_level
        log_class_level = self.__log_class_level
            
        self.log(texto              , 
                 valor              ,
                 cls                ,
                 mth                ,        
                 dec                ,
                 log_level          ,
                 log_class_level    )        

    
    def logGet(self                                 , 
               variable_a_devolver                  , 
               msg_pasado   = "valor sin indicar"   , 
               mth          = "get"                 ,
               log_level    = 0):
        """ logea la obtencion de un parametro
        """

        self.__texto_msg = \
            self.msg_get + self.sep + msg_pasado            

        self.__valor_msg = variable_a_devolver

        if log_level > 50:
            self.__Log(self.__texto_msg, self.__valor_msg, mth)        


    def logSet(self, 
               variable_a_establecer                , 
               argumentos                           , 
               msg_pasado   = "valor sin indicar"   ,
               mth          = "set"                 ,
               log_level    = 0                     ):
        """ Logea el establecimiento de un parametro
        """

        self.__texto_msg = \
            self.msg_set + self.sep + msg_pasado            

        self.__valor_msg = argumentos

        if log_level > 40:
            self.__Log(self.__texto_msg, self.__valor_msg, mth)        
  
  
    def getMsg(self):
        """ Obtiene el ultimo mensaje que se ha generado
        """
        return self.msg
        ## Hay que iterar en la cadena y comprobar las variables
    
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

