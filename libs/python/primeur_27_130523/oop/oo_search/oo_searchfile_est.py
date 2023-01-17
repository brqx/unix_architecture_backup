#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.3
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
#- Just           : [0] [1] [_] [3] [4] [5]
===========================================================
"""

#- Importacion de librerias
##import os


#- Importacion de clases heredadas

from oo_searchfile_msg import FileSearchMsg


class FileSearchEst(FileSearchMsg):

    #-Variable estatica para indicar el nombre de la clase
    __cls           = "FileSearchEst"
    __mth           = ""    
    __log_level         = 0
    __log_class_level   = 0


    __lineas    = {}  # Declaramos un array con las posibles lineas de la busqueda
    __numlineas = -1  # Indica que la estructura esta vacia  
    __comment   = ";" # Comentario por defecto de los ficheros

    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------

    def __init__(self                               , 
                 comment                = ";"       ,
                 log_level              = 0         ,
                 log_class_level        = 0         ,
                 log_show               = "screen"  ):
        """ Constructor de estructura FileSearch
        """

        self.__log_level = log_level

        self.LogInitConstructor()
        log_class_level = log_class_level + 1        

        self.__log_class_level = log_class_level


        FileSearchMsg.__init__(self                     , 
                               log_level                , 
                               log_class_level          ,
                               log_show                 )
       
        self.setComment(comment)       
       

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
            
        self.log(texto              , 
                 valor              ,
                 cls                ,
                 mth                ,        
                 dec                ,
                 log_level          ,
                 log_class_level    )        



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
        linea_actual = linea_pasada.split(separador)                                      

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
            linea_actual = linea_pasada.split(separador)                                      
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
