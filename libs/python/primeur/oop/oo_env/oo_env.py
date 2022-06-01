#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.3
-----------------------------------------------------------
+ Clases definidas : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Env      : Clase de entorno
-----------------------------------------------------------
-+ Clases heredadas : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- EnvSys           : Clase de sitema de entorno
-----------------------------------------------------------
-+ Metodos definidos : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- initEnv           - Inicia la clase Env
-----------------------------------------------------------
- setFailVar        - Establece fallo 
-----------------------------------------------------------
- setOkVar          - Establece ok
-----------------------------------------------------------
- checkVar          - Comprobacion de la variable
-----------------------------------------------------------
- setOk             - Establece Ok en el entorno
-----------------------------------------------------------
- setFail           - Establece Fallo en el entorno
-----------------------------------------------------------
- showEstado        - Actualiza el estado
-----------------------------------------------------------
+ Librerias Primeur requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
-----------------------------------------------------------
+ Librerias Sistema requeridas
--=----=----=----=----=----=----=----=----=----=----=----=-
- Ninguna
===========================================================
+ Process Status  : [130523]
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

#- Importacion de librerias
# import os

#- Importacion de clases heredadas
from oo_envsys import EnvSys


class Env(EnvSys):

    #-Variable estatica para indicar el nombre de la clase
    __cls                       = "Env"
    __mth                       = ""    
    __log_level                 = 0
    __log_class_level           = 0


    __log_show                  = "screen"
    __log_file                  = ""    # Log file por defecto
    __log_file_err              = ""    # Log file de error

    __log_file_alt              = ""    # Log file alterno


    __estado_entorno= 0 #- Estado del entorno
                        #  Si es correcto sera 0, sino hay problemas

    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self, *cadena_variables):
        """ Clase para gestion del entorno
        """
        ## Hay que iterar en la cadena y comprobar las variables
        #- Pendiente de revisar

        self.LogInitConstructor()
##        log_class_level = log_class_level + 1        
        

        #-Primero lo ponemos Ok y luego vamos negando        
        self.setOk()

        cont = 0
        while cont < len (cadena_variables):
            variable = cadena_variables[cont]            
            self.checkVar(variable)            
            cont = cont + 1

        self.sInfoConstructor(self.__cls)

##        if log_level > log_class_level:
##            self.__Log(self.msg)

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


    def initEnv(self,aa):
        """ Inicio de clase Env
            La idea es cambiar la funcionalidad del constructor
        """        
        


    #------------------------------------------------------
    #------------------ Funciones privadas ----------------
    #------------------------------------------------------

    def setFailVar(self,variable):
        self.msgClassVarFail(variable)
        self.setCadVarFail(variable)


    def setOkVar(self,variable):
        self.setCadVar(variable)
        self.setCadVarOk(variable)


    def checkVar(self, variable):
        """ Comprobacion de una variable y establecimiento
            Algoritmo:
            - Obtener variable del sistema
            - Si esta definida, actualizar variable y cadena
            - Si no esta definida, actualizar cadena resultado 
        """
        valor_variable = self.getSystemVar(variable)

        if valor_variable != "":
            self.setVar(variable,valor_variable)
            self.setCadVar(variable,valor_variable)               
        else:
            self.SetCadVarFail(variable)
            self.setFail()

    #------------------------------------------------------
    #------------------ Estado del entorno ----------------
    #------------------------------------------------------

    def setOk(self):
        """ Establece el estado del entorno como estable
        """
        self.__estado_entorno = 0

    def setFail(self):
        """ Establece el estado del entorno como inestable
        """
        self.__estado_entorno = 1

    def showEstado(self):
        """ Informa del estado del entorno
        """
        if self.__estado_entorno == 0:
            return "Estado estable"
        else:
            return "Estado inestable"            
     
    
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=


###ej = Env("PYTHONPATH","BASEPYTHON","PEPE")

##print (ej.showEstado())



## ej.setVar(variable , ej.getSystemVar(variable) + ":/rrrct/")
## ej.setSystemVar(variable , ej.getSystemVar(variable) + ":/rct/")
## ej.sfcSystemVar(variable)



