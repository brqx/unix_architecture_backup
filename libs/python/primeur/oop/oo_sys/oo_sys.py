#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.4
@pythonver: 3.3
-----------------------------------------------------------
+ Clases definidas              : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Sys               - Clase de Sistema
-----------------------------------------------------------
-+ Clases heredadas             : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- SysMsg            - Clase de mensajes de sistema
-----------------------------------------------------------
-+ Metodos definidos            : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- runSys            - Ejecuta la orden de sistema
-----------------------------------------------------------
- get/setrunStr     - Comando a ejecutar
-----------------------------------------------------------
- get/setSysOutStr  - Cadena Resultado del comando
-----------------------------------------------------------
- get/setSysCode    - Codigo Resultado del comando
-----------------------------------------------------------
+ Librerias Primeur requeridas  :
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- pm_string
-----------------------------------------------------------
+ Librerias Sistema requeridas  :
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- subprocess
===========================================================
+ Process Statuss : [130624]
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Quality        : [0] [1] [2] [3] [4] [_]
-----------------------------------------------------------
#- Comments       : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Info           : [0] [1] [2] [3] [4] [_]
-----------------------------------------------------------
#- Just           : [0] [1] [2] [3] [4] [_]
===========================================================
"""

#- Python 3.3
import subprocess 

#- Python 2.7
##import commands

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
    __log_show              = "screen"

    __log_file              = ""    # Log file por defecto
    __log_file_err          = ""    # Log file de error

    __log_file_alt          = ""    # Log file por defecto
    

    #- Atributos publicos
    runstr                  = ""  # Comando a lanzar

    outstr                  = ""  # Salida del comando
    
    syscode                 = 0   # Resultado del comando

    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                                   , 
                 full_command           =   ""          ,
                 log_level              =   0           ,
                 log_class_level        =   0           ,
                 log_show               =   "screen"    ,
                 log_file               =   ""          ,
                 log_file_err           =   ""          ,
                 log_size               =   1000000     ):
        """ Constructor de ordenes de sistema
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
        self.__log_file_err =   log_file_err  

        SysMsg.__init__(self                        ,
                        log_level                   ,
                        log_class_level             ,
                        log_show                    ,
                        log_file                    ,
                        log_size                    )

##        cadena_out = "Lanzando setrunstr:" + full_command
##        print (cadena_out)

        self.setRunStr(full_command)
        
##        cadena_out = "Lanzando getrunstr:" + self.getRunStr()
##        print (cadena_out)

  
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


    #-Clase de log de error
    def __ErrLog(self                           ,
              texto                             ,
              valor         =   ""              ,
              mth           =   "init"          ,
              dec           =   "normal"        ):
        """ Log de la clase para error
        """        
        self.__log_file_alt  = self.__log_file_err

        self.__LogAlt(texto                 ,
                      valor                 ,
                      mth                   ,
                      dec                   )


    def runSys(self):
        """ Ejecuta el comando
        """        
        mth = "runSys"

        self.LogInitMethod(self.__cls)

        codigo_resultado        = 0
        salida_orden            = ""
        salida_orden_parseada   = ""

        self.__Log("Comprobacion Comando"               ,
                   self.runstr                          ,
                   mth                                  ,
                   "simple_alt"                         )

        
 
        if self.runstr != "":
            #- Metodo python 2.7
##            codigo_resultado, salida_orden = \
##                commands.getstatusoutput(self.runstr)

            #- Metodo python 3.3

            self.__Log("Comando Pasado"                 ,
                       self.runstr                      ,
                       mth                              ,
                       "simple_alt"                     )


            command = self.runstr
            process = subprocess.Popen(command, 
                                       shell=True, 
                                       stdout=subprocess.PIPE, 
                                       stderr=subprocess.STDOUT, 
                                       universal_newlines=True)

            #- Ojo que devuelve una tupla                                           
            output = process.communicate()
            retcode = process.poll()

            codigo_resultado        = retcode
            str_codigo_resultado    = str(retcode)

            self.__Log("Resultado_comando"                  ,
                       str_codigo_resultado                 ,
                       mth                                  ,
                       "simple_alt"                         )


            if retcode != 0:
                    raise subprocess.CalledProcessError(retcode             , 
                                                        command             , 
                                                        output=output[0]    )

            
            #- Ponemos el primer valor de la tupla
            #- El segundo puede ser la salida de error            
            salida_orden        = output[0]


            if retcode == 0:
                self.__Log("Codigo Orden"           ,   
                           str_codigo_resultado     ,
                           mth                      ,
                           "simple_alt"             )
    
    
                self.__Log("Salida Orden"           ,   
                           salida_orden             ,
                           mth                      ,
                           "double_alt"             )


            self.setSysCode(codigo_resultado)

            #-Aqui ponemos los separadores
            if self.syscode == 0:
                #-Recuperamos la cadena parseada con separador arroba
                salida_orden_parseada= \
                    pm_string.str_parseallln(salida_orden, "@")

                self.__Log("Salida Orden Parseada"          ,   
                           salida_orden_parseada            ,
                           mth                              ,
                           "double_alt"                     )

                self.setSysOutStr(salida_orden_parseada)

                self.__Log("Salida Orden Parseada - Sys"    ,   
                           self.getSysOutStr()              ,
                           mth                              ,
                           "double_alt"                     )


            else:
                self.__ErrLog ("Error en comando"           ,
                               self.runstr                  ,
                               mth                          ,
                               "double_alt"                 )


        self.LogEndMethod(self.__cls)
        
            
    def getRunStr(self):
        """ Retorno de cadena de ejecucion del comando
        """    

        valor_a_devolver = self.runstr
        
        self.logGet(
            valor_a_devolver        , 
            self.msg_runstr         ,
            self.log_level          )
            
        return valor_a_devolver


    def setRunStr(self, argumento):
        """ Establecimiendo cadena de ejecucion del comando
        """    

        variable_a_establecer = self.runstr 

        self.logSet(
            variable_a_establecer   , 
            argumento               , 
            self.msg_runstr         ,
            self.log_level          )

        self.runstr = argumento


    def getSysOutStr(self):
        """ Retorno de cadena de salida de sistema
        """    

        valor_a_devolver = self.outstr
        
        self.logGet(
            valor_a_devolver        , 
            self.msg_sysoutstr      ,
            self.log_level          )
            
        return valor_a_devolver


    def setSysOutStr(self, argumento):
        """ Establecimiendo cadena de salida de sistema
        """    

        variable_a_establecer = self.outstr

        self.logSet(
            variable_a_establecer   , 
            argumento               , 
            self.msg_sysoutstr      ,
            self.log_level          )

        self.outstr = argumento
            

    def getSysCode(self):
        """ Retorno del metodo de Extraccion
        """    

        valor_a_devolver = self.syscode
        
        self.logGet(
            valor_a_devolver        , 
            self.msg_syscode        ,
            self.log_level          )
            
        return valor_a_devolver


    def setSysCode(self, argumento):
        """ Establecimiendo de SysCode
            De momento no informamos
        """    

        variable_a_establecer = str(self.syscode)

        self.logSet(variable_a_establecer       , 
                    argumento                   , 
                    self.msg_syscode            ,
                    self.log_level              )

        self.syscode = argumento
    
    
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

## log_level       = 90
## log_class_level = 0
## log_show        = "screen"
## log_file        = "sys_log.log"
## log_err         = "sys_log.err"

## comando         = "ls -la"
## sep             = " "
## sep_lineas      = "-_--_-"


## cmd = Sys (comando          ,
##             log_level        ,
##             log_class_level  ,
##             log_show         ,
##             log_file         ,
##             log_err          )

## print (cmd.getRunStr())

## cmd.runSys()

## print (cmd.getSysOutStr())
