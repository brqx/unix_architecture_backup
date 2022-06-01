#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.5
@pythonver: 3.3
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
- logGet/Set           - Traza para los get/set
-----------------------------------------------------------
- getMsg               - Ultimo mensaje generado - no se usa
-----------------------------------------------------------
+ Librerias Primeur requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
-----------------------------------------------------------
+ Librerias Sistema requeridas
-----------------------------------------------------------
- Ninguna
===========================================================
+ Process Status  : [130530]
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Quality        : [0] [1] [2] [3] [4] [_]
-----------------------------------------------------------
#- Comments       : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Info           : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Just           : [0] [1] [2] [3] [4] [_]
===========================================================
"""

#- Importacion de clases heredadas

from oo_log import Log


class getsetGen(Log):

    #-Variable estatica para indicar el nombre de la clase
    __cls                   = "getsetGen"
    __mth                   = ""    
    __log_level             = 0
    __log_class_level       = 0
    __log_show              = "screen"

    __log_file              = ""    # Log file por defecto
    __log_file_alt          = ""    # Log file alternada

    
    #-Literales para impresion de log genericos
    msg_set                 =   "Estableciendo"
    msg_get                 =   "Accediendo"

    msg_literal_clase       =   "Clase"
    msg_literal_init        =   "construida"


    #- Literales genericos para manejar mensajes
    __msg                   =   ""
    
    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                                   , 
                 log_level              =   0           ,
                 log_class_level        =   0           ,
                 log_show               =   "screen"    ,
                 log_file               =   ""          ,
                 log_size               =   1000000     ):
        """ Constructor de mensajes get y set
        """

        mth = "init"
        
        #-Estableciendo niveles de log
        self.__log_level = log_level

        self.LogInitConstructor(log_level           , 
                                log_class_level     , 
                                log_show            )

        log_class_level = log_class_level + 1        

        self.__log_class_level = log_class_level
        
        #-Estableciendo fichero de log
        self.__log_show     =   log_show

        self.__log_file     =   log_file

        
        #-Esta parte creo que no es necesaria
        comando = ""
        Log.__init__(   self                    ,
                        comando                 ,
                        log_level               ,
                        log_class_level         ,
                        log_show                ,
                        log_file                ,
                        log_size                )                
                     

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

    
    def logGet(self                                             , 
               variable_a_devolver      = ""                    , 
               msg_pasado               = "valor sin indicar"   , 
               mth                      = "get"                 ,
               log_level                = 0                     ):
        """ logea la obtencion de un parametro
        """

        self.__texto_msg = \
            self.msg_get + self.sep + msg_pasado            

        self.__valor_msg = variable_a_devolver

        if log_level > 50:
            self.__Log(self.__texto_msg         , 
                       self.__valor_msg         , 
                       mth                      )        


    def logSet(self, 
               variable_a_establecer    =    ""                 , 
               argumentos               =    ""                 , 
               msg_pasado               = "valor sin indicar"   ,
               mth                      = "set"                 ,
               log_level                = 0                     ):
        """ Logea el establecimiento de un parametro
        """

        self.__texto_msg = \
            self.msg_set + self.sep + msg_pasado            

        self.__valor_msg = argumentos

        if log_level > 40:
            self.__Log(self.__texto_msg         , 
                       self.__valor_msg         , 
                       mth                      )        
  
  
    def getMsg(self):
        """ Obtiene el ultimo mensaje que se ha generado
        """
        return self.msg
        ## Hay que iterar en la cadena y comprobar las variables
    
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

