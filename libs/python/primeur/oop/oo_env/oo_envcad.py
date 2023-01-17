#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.2
-----------------------------------------------------------
+ Clases definidas : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- EnvCad   : Clase de cadenas de gestion del entorno
-----------------------------------------------------------
-+ Clases heredadas : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- LastMsg           : Clase de gestion de mensajes de clase
-----------------------------------------------------------
-+ Metodos definidos : 
-----------------------------------------------------------
- Pendiente  (init, gets y sets)
-----------------------------------------------------------
+ Librerias Primeur requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- pendiente        : pendiente
-----------------------------------------------------------
+ Librerias Sistema requeridas
-----------------------------------------------------------
- os
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

import os

#- Importacion de clases heredadas

from oo_lastmsg import LastMsg


class EnvCad(LastMsg):

    #-Variable estatica para indicar el nombre de la clase
    __cls                   = "EnvCad"
    __mth                   = ""    
    __log_level             = 0
    __log_class_level       = 0

    __log_show              = "screen"
    __log_file              = ""    # Log file por defecto
    __log_file_alt          = ""    # Log file alterno


    __vars  =   {}      #- Array que almacena las variables de entorno
    __cadvars = {}      #  Array de mensajes de variables
                        #  Pensado para la salida

    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------

    def __init__(self                                   ,
                 log_level              =   0           ,
                 log_class_level        =   0           ,
                 log_show               =   "screen"    ,
                 log_file               =   ""          ,
                 log_size               =   1000000     ):
        """ Constructor de cadenas de entorno
        """

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


        LastMsg.__init__(self)
        

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

    #------------------------------------------------------
    #-------------------- Vars - Mensajes -----------------
    #------------------------------------------------------
    def getCodVar(self, variable_entorno):
        """ Obtiene una variable de la clase
        """
        return self.__vars[variable_entorno]

    

    def setCodVar(self, variable_entorno, valor_variable):
        """ Establece una variable de la clase
        """
        self.__vars[variable_entorno] = valor_variable

    #------------------------------------------------------
    #-------------------- Vars - Agiles -------------------
    #------------------------------------------------------

    def SetCodVarOk(self, variable_entorno):
        """ Establece el valor ok de una variable 
        """
        valor_variable = 0
        self.setCodVar(variable_entorno, valor_variable)



    def SetCodVarFail(self, variable_entorno):
        """ Establece error en la informacion de una variable
        """
        valor_variable = 1
        self.setCodVar(variable_entorno, valor_variable)


    #------------------------------------------------------
    #------------------ CadVar - Mensajes -----------------
    #------------------------------------------------------

    def getCadVar(self, variable_entorno):
        """ Obtiene una variable de la clase
        """
        return self.__cadvars[variable_entorno]
    

    def setCadVar(self, variable_entorno,valor_variable):
        """ Establece una variable de la clase
        """
        self.__cadvars[variable_entorno] = valor_variable

    #------------------------------------------------------
    #------------------ CadVar - Agiles -----------------
    #------------------------------------------------------

    def SetCadVarOk(self, variable_entorno,valor_variable):
        """ Establece el valor ok de una variable 
        """
        msg = self.msgClassVarOk(variable_entorno, valor_variable)
        self.setCadVar(variable_entorno, msg)



    def SetCadVarFail(self, variable_entorno):
        """ Establece error en la informacion de una variable
        """
        msg = self.msgClassVarFail(variable_entorno)
        self.setCadVar(variable_entorno, msg)
    
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=


