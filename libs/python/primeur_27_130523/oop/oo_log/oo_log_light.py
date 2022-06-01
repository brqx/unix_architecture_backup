#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.3
-----------------------------------------------------------
+ Clases definidas : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Log   : Clase de gestion de logs
-----------------------------------------------------------
- Nivel    : 7 - Refleja la profundidad de herencia maxima
-----------------------------------------------------------
+ Librerias Primeur requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- pendiente        : pendiente
-----------------------------------------------------------
+ Librerias Sistema requeridas
-----------------------------------------------------------
- pendiente
===========================================================
+ Process Status  : [130517]
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

#- Importacion de librerias

import os, datetime , time

#- Importacion de clases heradadas

from oo_log_mths import LogMths

#- Importacion de clases utilizadas

#-- no puedo importar file pues hace una herencia circular
from oo_lightfile import LightFile


class LogLight(LogMths):


    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------

    def __init__(self                           , 
                 log_level          = 0         ,
                 log_class_level    = 0         ,
                 log_show           = "screen"  ,
                 log_file           = ""        ):
        """ De momento sin argumentos
        """

        LogMths.__init__(self                   , 
                        log_level               ,
                        log_class_level         ,
                        log_show                ,
                        log_file                )                



        
    def print_spaces(self,num_spaces):
        """ De momento sin argumentos
        """
        cont = 0
        space_string = ""
        while cont < num_spaces:
            space_string = space_string + self.space
            cont = cont + 1
        return space_string

    def output_set(self, cadena, justificacion):
        """ Va a justificar la salida
            Hay que tratar si la cadena es mas grande
            que la longitud tambien -- FALTA --
        """

        longitud_cadena = len(cadena)
        num_spaces = justificacion - longitud_cadena
        espacios_cadena = self.print_spaces (num_spaces) 
        
        return cadena +  espacios_cadena       

    def text_set(self,cadena):
        """ Vamos a justificar los valores        
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
   
    def value_set(self,
                  cadena, 
                  cls="", 
                  mth=""):
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
                self.sep_ini_value         + self.sep + \
                cad_value_justify          + self.sep + \
                self.sep_end_value    
    
    
            cadena_ajustada = cls + "_" + \
                              mth + "-"  + cad_value_msg
    
    
            self.setlog_value_msg(cadena_ajustada)

        else:
            self.setlog_value_msg(cadena)
        
            #- Devolvemos el valor pero no es necesario
    ##        return self.__value_msg

    
    def jlog(self           , 
             argumentos     = "",
             log_show       = "screen",
             log_file       = ""):
        """ Justificacion del log -- FALTA --
            Vamos a justificar la salida 
            Igual usamos una clase de strings
        """

        fecha_actual = datetime.datetime.now()        

##        print (datetime.datetime.now()	)

        #-Esta funcion parece solo para unix
        sep = ":"

        #- Acepta el parseo %Y%m%d
        #- Falla el parseo %H%M%S


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

        precadena = precadena + sep + pid + sep   

        cadena              = precadena + argumentos

        cadena_a_imprimir   = precadena + argumentos


        if log_show.startswith("screen"):
            print (cadena)
        
        clave_fichero = "file"

        if clave_fichero in log_show:
            #- Falta saber que hacemos con el size log
            size_log = self.get_log_size()
            f = LightFile(log_file)
            
            f.printFile(cadena_a_imprimir   , 
                        log_file            )        
        


    def loglight(self                   , 
            texto                       , 
            valor       = ""            ,
            cls         = ""            ,
            mth         = ""            ,
            log_show    = "screen"      ,
            log_file    = ""            ):
        """ Necesitamos que se imprima pero justificando los valores
            y tambien justificando la linea
            Parametros:
            - texto     : texto de la expresion
            - valor     : valor de la expresion
            - cls-mth   : Clase y metodo
            - sw_pantalla (screen)
            - dec       : Decorado ( tipo de presentacion)
        """

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
                  log_file              )
    
           
            
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

##ej = Log("pepe")

##ej.Log("hola amigos")

## ejl.log(cad1, val1)
