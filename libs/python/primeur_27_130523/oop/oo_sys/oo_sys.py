#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.3
-----------------------------------------------------------
+ Clases definidas : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Sys      : Clase de Sistema
-----------------------------------------------------------
-+ Clases heredadas : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- SysMsg           : Clase de mensajes de sistema
-----------------------------------------------------------
-+ Metodos definidos : 
-----------------------------------------------------------
- Pendiente  (init, gets y sets)
-----------------------------------------------------------
+ Librerias Primeur requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- pm_String
-----------------------------------------------------------
+ Librerias Sistema requeridas
-----------------------------------------------------------
- commands
===========================================================
+ Process Statuss : [130516]
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


##import subprocess
import commands

#- Importacion de librerias de primeur

import pm_string

#- Importacion de clases heredadas
from oo_sys_msg import SysMsg



class Sys(SysMsg):

    #-Variable estatica para indicar el nombre de la clase
    __cls                   = "Sys"
    __mth                   = ""    
    __log_level             = 0
    __log_class_level       = 0


    #- Atributos publicos
    runstr                  = ""  # Comando a lanzar

    outstr                  = ""  # Salida del comando
    
    syscode                 = 0   # Resultado del comando

    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                               , 
                 full_command           = ""        ,
                 log_level              = 0         ,
                 log_class_level        = 0         ,
                 log_show               = "screen"  ):
        """ Constructor de ordenes de sistema
        """

        self.LogInitConstructor()
        log_class_level = log_class_level + 1        

        SysMsg.__init__(self                        ,
                        log_level                   ,
                        log_class_level             ,
                        log_show                    )


        self.setRunStr(full_command)

  
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


    def runSys(self):
        """ Ejecuta el comando
        """        

        self.LogInitMethod(self.__cls)

        codigo_resultado        = 0
        salida_orden            = ""
        salida_orden_parseada   = ""

 
        if self.runstr != "":
            codigo_resultado, salida_orden = \
                commands.getstatusoutput(self.runstr)


            self.setSysCode(codigo_resultado)

            #-Aqui ponemos los separadores
            if self.syscode != 999:
                salida_orden_parseada= \
                    pm_string.str_parseallln(salida_orden, "@")

                self.setSysOutStr(salida_orden_parseada)


        self.LogEndMethod(self.__cls)
        
            
    def getRunStr(self):
        """ Retorno de cadena de ejecucion del comando
        """    

        valor_a_devolver = self.runstr
        
        self.logGet(
            valor_a_devolver, 
            self.msg_runstr,
            self.log_level)
            
        return valor_a_devolver

    def setRunStr(self, argumento):
        """ Establecimiendo cadena de ejecucion del comando
        """    

        variable_a_establecer = self.runstr 

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_runstr,
            self.log_level)

        self.runstr = argumento

    def getSysOutStr(self):
        """ Retorno de cadena de salida de sistema
        """    

        valor_a_devolver = self.outstr
        
        self.logGet(
            valor_a_devolver, 
            self.msg_sysoutstr,
            self.log_level)
            
        return valor_a_devolver

    def setSysOutStr(self, argumento):
        """ Establecimiendo cadena de salida de sistema
        """    

        variable_a_establecer = self.outstr

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_sysoutstr,
            self.log_level)

        self.outstr = argumento
            

    def getSysCode(self):
        """ Retorno del metodo de Extraccion
        """    

        valor_a_devolver = self.syscode
        
        self.logGet(
            valor_a_devolver, 
            self.msg_syscode,
            self.log_level)
            
        return valor_a_devolver

    def setSysCode(self, argumento):
        """ Establecimiendo de SysCode
            De momento no informamos
        """    

        variable_a_establecer = str(self.syscode)

#--        self.logSet(
#--            variable_a_establecer , 
#--            argumento , 
#--            self.msg_syscode,
#--            self.log_level)

        self.syscode = argumento
    
            
    
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

