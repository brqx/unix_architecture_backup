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

##import os

#- Importacion de clases heradadas

from oo_log_est import LogEst


#- Importacion de clases utilizadas

class LogMths(LogEst):


    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------

    def __init__(self                           , 
                 log_level          = 0         ,
                 log_class_level    = 0         ,
                 log_show           = ""        ,
                 log_file           = ""        ):
        """ De momento sin argumentos
        """

        LogEst.__init__(self                    , 
                        log_level               ,
                        log_class_level         ,
                        log_show                ,
                        log_file                )                


        #-Ajuste del indicador y del sistema



    def sInfoConstructor(self           ,
                         cls        = ""):
        """ Prepara el mensaje de constructor
        """

        self.msg =  self.msg_literal_clase  + self.sep +    \
                    cls                     + self.sep +    \
                    self.msg_literal_init
       

    
    def LogInitConstructor(self):
        """ Metodo para presentar el inicio del constructor
        """
        cls = self.dlines
        mth = self.lines

        log_level = self.get_log_level()
        
        if log_level > 60:
            self.log(self.s_cls      , 
                     self.bline      ,
                     cls        ,
                     mth        
                     )        

    def LogEndConstructor(self):
        """ Metodo para presentar el final del constructor
        """
        cls = self.dlines
        mth = self.lines

        log_level = self.get_log_level()
        
        if log_level > 60:
            self.log(self.e_cls      , 
                     self.bline      ,
                     cls        ,
                     mth        
                     )        


    def LogInitMethod(self          ,
                      cls = "init"):
        """ De momento sin argumentos
        """
        mth = self.lines

        log_level = self.get_log_level()
        
        if log_level > 70:
            self.log(self.s_mth      , 
                     self.bline      ,
                     cls        ,
                     mth        
                     )        

    def LogEndMethod(self           ,
                     cls    = "init"):
        """ De momento sin argumentos
        """
        mth = self.lines

        log_level = self.get_log_level()
        
        if log_level > 70:
            self.log(self.e_mth      , 
                     self.bline      ,
                     cls        ,
                     mth        
                     )        

            
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

##ej = Log("pepe")

##ej.Log("hola amigos")

## ejl.log(cad1, val1)
