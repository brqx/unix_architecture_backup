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
- LogLight          - Clase de gestion de logs
-----------------------------------------------------------
-+ Clases heredadas             : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- LogMths           - Clase de acceso al sistema
-----------------------------------------------------------
-+ Clases utilizadas            : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- LightFile         - Clase de acceso al sistema
-----------------------------------------------------------
-+ Metodos definidos            : 
-----------------------------------------------------------
- print_spaces      -   Genera cadenas de espacios
-----------------------------------------------------------
- output_set        -   Justifica la salida
-----------------------------------------------------------
- text_set          -   Ajuste del texto
-----------------------------------------------------------
- value_set         -   Ajuste del valor
-----------------------------------------------------------
- jlog              -   Log ya justificado
-----------------------------------------------------------
- loglight          -   Funcion de log principal
-----------------------------------------------------------
+ Librerias Primeur requeridas  :
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
-----------------------------------------------------------
+ Librerias Sistema requeridas  :
-----------------------------------------------------------
- os
-----------------------------------------------------------
- datetime
===========================================================
+ Process Status  : [130529]
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Quality        : [0] [1] [2] [3] [4] [_]
-----------------------------------------------------------
#- Comments       : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Info           : [0] [1] [2] [4] [_] [5]
-----------------------------------------------------------
#- Just           : [0] [1] [2] [3] [4] [_]
===========================================================
"""

#- Importacion de librerias

import os, datetime

#- Importacion de clases heradadas

from oo_log_mths import LogMths

#- Importacion de clases utilizadas

#-- no puedo importar file pues hace una herencia circular
from oo_lightfile import LightFile


class LogLight(LogMths):

    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------

    def __init__(self                               , 
                 log_level          =   0           ,
                 log_class_level    =   0           ,
                 log_show           =   "screen"    ,
                 log_file           =   ""          ,
                 log_size           =   1000000     ):

        """ Constructor de Log Light
        """

        LogMths.__init__(self                   , 
                        log_level               ,
                        log_class_level         ,
                        log_show                ,
                        log_file                ,
                        log_size                )                

        
    def print_spaces(self               ,
                     num_spaces         ):
        """ Genera cadena de espacios
        """
        cont = 0
        space_string = ""
        while cont < num_spaces:
            space_string = space_string + self.space
            cont = cont + 1
        return space_string


    def output_set(self                         , 
                   cadena           =   ""      , 
                   justificacion    =   30      ):
        """ Va a justificar la salida
            Hay que tratar si la cadena es mas grande
            que la longitud tambien -- FALTA --
        """

        longitud_cadena = len(cadena)
        num_spaces = justificacion - longitud_cadena
        espacios_cadena = self.print_spaces (num_spaces) 
        
        return cadena +  espacios_cadena       


    def text_set(self                   ,
                 cadena                 ):
        """ Justifica cadena de texto
        """        
        cad_text_len = self.getlog_text_len()

        cad_text_justify = \
            self.output_set(cadena, cad_text_len)

        self.setlog_text_justify(cad_text_justify)

         
        cad_text_msg = \
            self.sep_ini_text       + self.sep_text + \
            cad_text_justify        + self.sep_text + \
            self.sep_end_text    

        self.setlog_text_msg(cad_text_msg)

        #- Devolvemos el valor pero no es necesario
##        return self.__text_msg

   
    def value_set(self                  ,
                  cadena        =   ""  , 
                  cls           =   ""  , 
                  mth           =   ""  ):
        """ Log de valores
            Recibe como argumentos:
            -cadena : Cadena que se quiere mostrar
            -cls    : Clase desde la que se ha invocad
            -mth    : Metodo desde el que se ha invocado
        """        
        if cadena != "":

            if cls == "":
                cls = self.cls
            if mth == "":
                mth = self.meth
    
    
            cad_value_len = self.getlog_value_len()
            
            cad_value_justify = \
                self.output_set(cadena, cad_value_len)
    
            self.setlog_value_justify(cad_value_justify)
    
            cad_value_msg = \
                self.sep_ini_value          +   self.sep    +   \
                cad_value_justify           +   self.sep    +   \
                self.sep_end_value    
    
    
            cadena_ajustada = cls + "_"     +   \
                              mth + "-"     +   cad_value_msg
    
    
            self.setlog_value_msg(cadena_ajustada)

        else:
            self.setlog_value_msg(cadena)
        
    
    def jlog(self                                       , 
             argumentos         =   ""                  ,
             log_show           =   "screen"            ,
             log_file           =   ""                  ,
             log_size           =   10000000            ):
        """ Justificacion del log -- FALTA --
            Vamos a justificar la salida 
            Igual usamos una clase de strings
        """

        fecha_actual = datetime.datetime.now()        

        sep = ":"

##        centesimas = str( int(time.time() * 100)  )       
        fecha = fecha_actual.strftime('%Y%m%d%H%M%S')
        ## 22/Apr/2013:11_52_AM

        #-Esta fallando aqui en el getpid

        precadena = ""
        ##precadena = fecha + centesimas + precadena
        precadena = fecha + precadena

##        if self.sys_ind != "nt":
            #-Orden solo de Unix
        pid = str(os.getpid())

        precadena           = precadena + sep + pid + sep   

        cadena              = precadena + argumentos

        cadena_a_imprimir   = precadena + argumentos


        if log_show.startswith("screen"):
            print (cadena)
        
        clave_fichero = "file"

        if log_file == "":
            log_file = self.get_log_file()

        if log_file == None:
            log_file = ""


##        print ("Log file" + log_file)

        if clave_fichero in log_show:
            #- Falta saber que hacemos con el size log
          
            str_log_file = str(log_file)
            
            if str_log_file != "":
                # Max Log Size

                if log_size != 0:
                    max_log_size        = log_size
                else:
                    max_log_size        = self.get_log_size()

                str_max_log_size        = str(max_log_size)
    
                # Current Log Size - 
                #- Mirar si existe el archivo

                #-Contenedor de archivos
 
                #- Debe crear el archivo si no existe
                f = LightFile(log_file)

                if os.path.exists(log_file):
                    size_log_trc            = os.path.getsize(log_file)        
 
                str_size_log_trc        = str(size_log_trc)

   
                if size_log_trc < max_log_size:
                        
                    f.printFile(cadena_a_imprimir   , 
                                log_file            )        
                else:
                    #- En este punto ya es mayor
                    #- Copiar en uno de backup con timestamp
                    #- Vaciar el actual
                    print("Current Size Log " + str_size_log_trc )
                    print("Max Log Size Log " + str_max_log_size )

                    print("Generando copia de backup")
                    fcopy = LightFile(log_file)
                    fcopy.copyMonthstamp(log_file)
                    fcopy.deleteFile(log_file)
                    fcopy.createFile(log_file)
                    #-Volvemos a llamar a jlog una vez hemos vaciado el log
                    self.jlog(argumentos                ,
                              log_show                  ,
                              log_file                  )
                                       
            else:
                log_level = self.get_log_level()
                if log_level > 90:
                    print("No hay log")


                

    def loglight(self                   , 
            texto       = ""            , 
            valor       = ""            ,
            cls         = ""            ,
            mth         = ""            ,
            log_show    = "screen"      ,
            log_file    = ""            ,
            log_size    = 1000000       ):
        """ Necesitamos que se imprima pero justificando los valores
            y tambien justificando la linea
            Parametros:
            - texto     : texto de la expresion
            - valor     : valor de la expresion
            - cls-mth   : Clase y metodo
            - sw_pantalla (screen)
            - dec       : Decorado ( tipo de presentacion)
        """

        
##        if log_file != "":
##            print("Log4 a usar de error" + log_file)
       
        self.text_set (texto)
        self.value_set(valor        ,   
                       cls          ,   
                       mth          )
            
    
        fixed_text  = self.getlog_text_msg()
        fixed_value = self.getlog_value_msg()
    
            ## print ("Texto "    + ":"      + fixed_text           + ":")
            ## print ("Separador" + ":"      + self.sep_text_value  + ":")
            ## print ("Valor "    + ":"      + fixed_value          + ":")
    
            
        cadena_a_imprimir = \
                fixed_text            + \
                self.sep_text_value   + \
                fixed_value

    
        if log_file == "":
            log_file = self.get_log_file()

   
   
            #- Impresion en pantalla  y/o en fichero      
        self.jlog(cadena_a_imprimir     ,
                  log_show              ,
                  log_file              ,
                  log_size              )
                  
    
            
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

##ej = Log("pepe")

##ej.Log("hola amigos")

## ejl.log(cad1, val1)
