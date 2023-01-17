#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.3
-----------------------------------------------------------
+ Clases definidas : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- MaskEst      : Clase de estructura de mascaras
-----------------------------------------------------------
-+ Clases heredadas : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- MaskMsg           : Clase de mensajes de mascaras
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


#- Importacion de clases

from oo_mask_msg import MaskMsg



class MaskEst(MaskMsg):

    #-Variable estatica para indicar el nombre de la clase
    __cls           = "MaskEst"
    __mth           = ""    
    __log_level             = 0
    __log_class_level       = 0



    #-Atributos privados - Mascaras
    
    __time_mask                         = ""    #- hora para python
    __date_mask                         = ""    #- fecha para python
    __datetime_mask                     = ""    #- fecha y hora para python

    __time_human_mask                   = ""    #- hora para humanos
    __date_human_mask                   = ""    #- fecha para humanos
    __datetime_human_mask               = ""    #- fecha y hora para humanos


    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                               , 
                 mascara_a_parsear      = ""        ,
                 log_level              = 0         ,
                 log_class_level        = 0         ,
                 log_show               = "screen"  ):
        """ Constructor de estructuras de mascaras
        """

        self.__log_level = log_level

        self.LogInitConstructor()
        log_class_level = log_class_level + 1        

        self.__log_class_level = log_class_level


        MaskMsg.__init__(self                   ,
                        log_level               ,
                        log_class_level         ,
                        log_show                )

  
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


    def getTimeMask(self):
        """ Retorno de la mascara
        """    

        valor_a_devolver = self.__time_mask
        self.logGet(valor_a_devolver, self.msg_time_mask)
        return valor_a_devolver

    
    
    def setTimeMask(self, argumento):
        """ Establecimiento de la Mascara
            Si esta vacio o si no se ha contemplado se devuelve la de 
            por defecto
        """    
    
        variable_a_establecer = argumento

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_time_mask)

        self.__time_mask = argumento


    def getDateMask(self):
        """ Retorno de la mascara
        """    

        valor_a_devolver = self.__date_mask
        self.logGet(valor_a_devolver, self.msg_date_mask)
        return valor_a_devolver

    
    def setDateMask(self, argumento):
        """ Establecimiento de la Mascara
        """    

        variable_a_establecer = argumento

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_date_mask)

        self.__date_mask = argumento


    def getDateTimeMask(self):
        """ Retorno de la mascara
        """    

        valor_a_devolver = self.__datetime_mask
        self.logGet(valor_a_devolver, self.msg_datetime_mask)
        return valor_a_devolver

    
    def setDateTimeMask(self, argumento):
        """ Establecimiento de la Mascara
        """    

        variable_a_establecer = argumento

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_datetime_mask)

        self.__datetime_mask = argumento

    def getTimeHumanMask(self):
        """ Retorno de la mascara
        """    

        valor_a_devolver = self.__time_human_mask
        self.logGet(valor_a_devolver, self.msg_time_human_mask)
        return valor_a_devolver

    
    
    def setTimeHumanMask(self, argumento):
        """ Establecimiento de la Mascara
            Si esta vacio o si no se ha contemplado se devuelve la de 
            por defecto
        """    
    
        variable_a_establecer = argumento

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_time_human_mask)

        self.__time_human_mask = argumento


    def getDateHumanMask(self):
        """ Retorno de la mascara
        """    

        valor_a_devolver = self.__date_human_mask
        self.logGet(valor_a_devolver, self.msg_date_human_mask)
        return valor_a_devolver

    
    def setDateHumanMask(self, argumento):
        """ Establecimiento de la Mascara
        """    

        variable_a_establecer = argumento

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_date_human_mask)

        self.__date_human_mask = argumento


    def getDateTimeHumanMask(self):
        """ Retorno de la mascara
        """    

        valor_a_devolver = self.__datetime_human_mask
        self.logGet(valor_a_devolver, self.msg_datetime_human_mask)
        return valor_a_devolver

    
    def setDateTimeHumanMask(self, argumento):
        """ Establecimiento de la Mascara
        """    

        variable_a_establecer = argumento

        self.logSet(
            variable_a_establecer , 
            argumento , 
            self.msg_datetime_human_mask)

        self.__datetime_human_mask = argumento


#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=


