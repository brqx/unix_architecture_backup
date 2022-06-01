#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.4
@pythonver: 3.3
-----------------------------------------------------------
+ Clases definidas      : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- FileSearchEst      - Clase de estructura para FileSearch
-----------------------------------------------------------
-+ Clases heredadas     : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- getsetGen          - Clase de get y set
-----------------------------------------------------------
-+ Metodos definidos    : 
-----------------------------------------------------------
- insertLine            - Inserta una linea en la estructura
-----------------------------------------------------------
- getLinea              - Obtiene una linea
-----------------------------------------------------------
- getkeyLine            - Obtiene la clave de la linea
-----------------------------------------------------------
- getvalueLine          - Obtiene el valor de la linea
-----------------------------------------------------------
- getNumLineas          - Obtiene el numero de lineas
-----------------------------------------------------------
- setNumLineas          - Establece el numero de lineas
-----------------------------------------------------------
- getNumLineasOcupadas  - Obtiene el numero de lineas
-----------------------------------------------------------
- getFirstLine          - Obtiene la primera linea
-----------------------------------------------------------
- getLastLine           - Obtiene la ultima linea
-----------------------------------------------------------
- printAllLines         - Imprime todas las lineas
-----------------------------------------------------------
- searchClean           - Vacia la estructura de busqueda
-----------------------------------------------------------
- endSearch             - Finaliza la busqueda
-----------------------------------------------------------
- getComment            - Obtiene el caracter de comentario
-----------------------------------------------------------
- setComment            - Establece el caracter de comentario
-----------------------------------------------------------
+ Librerias Primeur requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
-----------------------------------------------------------
+ Librerias Sistema requeridas
-----------------------------------------------------------
- re
===========================================================
+ Process Status  : [130531]
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Quality        : [0] [1] [2] [_] [4] [5]
-----------------------------------------------------------
#- Comments       : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Info           : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Just           : [0] [1] [2] [3] [_] [5]
===========================================================
"""

#- Importacion de librerias
##import os

#- Python 3.3

import re

#- Importacion de clases heredadas

from oo_filesearch_msg import FileSearchMsg


class FileSearchEst(FileSearchMsg):

    #-Variable estatica para indicar el nombre de la clase
    __cls                   = "FileSearchEst"
    __mth                   = ""    
    __log_level             = 0
    __log_class_level       = 0

    __log_show              = "screen"
    __log_file              = ""    # Log file por defecto
    __log_file_alt          = ""    # Log file alterno
    __log_file_err          = ""    # Log file de errores


    __lineas                = {}  # Declaramos un array con las posibles 
                                  # lineas de la busqueda
    __numlineas             = -1  # Indica que la estructura esta vacia  
    __comment               = ";" # Comentario por defecto de los ficheros

    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------

    def __init__(self                               , 
                 comment                = ";"       ,
                 log_level              = 0         ,
                 log_class_level        = 0         ,
                 log_show               = "screen"  ,
                 log_file               =   ""          ,
                 log_file_err           =   ""          ,
                 log_size               =   1000000     ):
        """ Constructor de estructura FileSearch
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


        FileSearchMsg.__init__( self                    , 
                                log_level               , 
                                log_class_level         ,
                                log_show                ,
                                log_file                ,
                                log_size                )
       
        self.setComment(comment)       
       

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



    def insertLine(self, linea_pasada):    
        """ Inserta una linea en la tabla de lineas
        """
        self.__numlineas                = self.__numlineas + 1
        self.__lineas[self.__numlineas] = linea_pasada


    def getLinea(self, posicion_linea):
        """ Obtiene una linea
        """
        mth = "getLinea"

        linea_devuelta = ""
        try:
            linea_devuelta = self.__lineas[posicion_linea]            
        except KeyError as e:            
            self.__Log("Clave no disponible"        , 
                       str(e)                       , mth )
            
        return linea_devuelta

        
    #-- Estas funciones son de strings no de aqui    
    def getkeyLine(self, linea_pasada , separador = "="):
        """ Devuelve la clave de la linea pasada
        """
        linea_actual = re.split(separador,linea_pasada)                                      

        return linea_actual[0]
        

    def getvalueLine(self, 
                     linea_pasada           , 
                     separador      = "="   ,
                     posicion       = 1     ):
        """ Devuelve el valor de la linea pasada
        """
        mth = "getvalueLine"

        #-Que pasa si no hay separador        
        valor_linea = ""
        if linea_pasada != "":
            linea_actual = re.split(separador,linea_pasada)                                      
            num_campos = len(linea_actual) -1

            if num_campos >= posicion:            
                valor_linea = linea_actual[posicion]                            
            else:
                self.__Log("Posicion incorrecta"    , 
                           posicion                 , mth)
                self.__Log("Linea pasada"           , 
                           linea_pasada             , mth)

        return valor_linea

        
    def getNumLineas(self):
        """ Devuelve el numero de lineas
        """
        return self.__numlineas

    
    def setNumLineas(self, argumento):
        """ Establecimiento del comentario
        """    

        variable_a_establecer = self.__numlineas

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_comment)

        self.__numlineas = argumento



    def getNumLineasOcupadas(self):
        """ Devuelve el numero de lineas ocupadas
        """
        num_lineas_ocupadas = self.getNumLineas()
        return num_lineas_ocupadas


    def getFirstLine(self):
        """ Devuelve la ultima linea
            Falta gestionar excepciones
        """
        primera_linea_ocupada = 0
        return self.getLinea(primera_linea_ocupada)


    def getLastLine(self):
        """ Devuelve la ultima linea
        """
        ultima_linea_ocupada = self.__numlineas
        return self.getLinea(ultima_linea_ocupada)


    def printAllLines(self):
        """ Imprime todas las lineas
        """
        mth = "printAllLines"

        cont = 0
        num_lineas_ocupadas = self.getNumLineas()

        self.__Log("Numero Lineas"              , 
                   str(num_lineas_ocupadas)     ,
                   mth                          ,
                   "simple_simple"              )

        while cont <= num_lineas_ocupadas:
            self.__Log ("Linea" + str(cont)        , 
                        self.getLinea(cont)        , mth ) 
            cont = cont + 1


    def searchClean(self):
        """ Debe limpiar la estructura creada
        """
        num_lineas_ocupadas = self.getNumLineas()
        linea_vacia = ""

        cont = 0
        while cont <= num_lineas_ocupadas:
            self.__lineas[cont] = linea_vacia
            cont = cont + 1

        self.setNumLineas(-1)
   

    def endSearch(self):
        self.searchClean()
        self.__lineas       = {}

            
    def getComment(self):
        """ Retorno del comentario
        """    

        valor_a_devolver = self.__comment
        self.logGet(valor_a_devolver, self.msg_comment)
        return valor_a_devolver

    
    def setComment(self, argumento):
        """ Establecimiento del comentario
        """    

        variable_a_establecer = self.__comment

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_comment)

        self.__comment = argumento

            
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
