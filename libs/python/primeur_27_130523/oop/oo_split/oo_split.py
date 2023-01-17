#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.3
-----------------------------------------------------------
+ Clases definidas : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Split      : Clase de gestion de subcadenas
-----------------------------------------------------------
-+ Clases heredadas : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- SplitEst           : Clase de estructura de subcadenas
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
+ Process Statuss : [130520]
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
import sys

#- Importacion de clases heredadas

from oo_split_est import SplitEst


class Split(SplitEst):

    #-Variable estatica para indicar el nombre de la clase
    __cls           = "Split"
    __mth           = ""    
    __log_level             = 0
    __log_class_level       = 0


    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                               , 
                cadena_a_dividir        = ""        ,
                separator               = "."       ,
                 log_level              = 0         ,
                 log_class_level        = 0         ,
                 log_show               = "screen"  ):
        """ Constructor de sub cadenas
        """

        self.__log_level = log_level

        self.LogInitConstructor()
        log_class_level = log_class_level + 1        

        self.__log_class_level = log_class_level


        SplitEst.__init__(self                      ,
                          cadena_a_dividir          ,
                          separator                 , 
                          log_level                 ,
                          log_class_level           ,
                          log_show                  )

                    
        ## De momento runParse no hace nada

        self.runSplit()
##                
  
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
        

    def runSplit(self):
        """ Parsea nombre con el que se extrae el fichero y 
            podrá tener wild cards para indicar:
            Debe dividir cadenas por un separador
        """        
        cadena      = self.getCadena()
        separator   = self.getSeparator() 


        conjunto_lineas = cadena.split(separator)
        numero_campos   = len(conjunto_lineas)

        cont = 0      
    
        while cont < numero_campos:        
            linea_actual = conjunto_lineas[cont]
            self.addField(linea_actual , cont)
            cont = cont + 1
            
        self.setNumFields(numero_campos - 1)
        self.setLastField()
            
        
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=


## cad1="lapera.pepito del moreno.pompero.jpg"


## cad_sys = sys.argv[1]

## pa= Split(cad1)

## print (pa.getFileNameNoExt())
## print (pa.getLastField())

