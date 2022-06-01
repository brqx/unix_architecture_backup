#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.3
-----------------------------------------------------------
+ Clases definidas      : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- DateEst           - Clase de estructura de Fecha
-----------------------------------------------------------
-+ Clases heredadas     : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- Mask              - Clase de mascaras
-----------------------------------------------------------
- DateMsg           : Clase de mensajes de fechas
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
- datetime
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

#- Importacion de librerias del sistema

import datetime

#- Importacion de clases hereadadas

from oo_mask import Mask
from oo_date_msg import DateMsg



class DateEst(Mask, DateMsg):

    #-Variable estatica para indicar el nombre de la clase
    __cls                           = "DateEst"
    __mth                           = ""    
    __log_level                     = 0
    __log_class_level               = 0


    #-Atributos privados
    __time                          = ""    #- Hora actual
    __date                          = ""    #- Fecha actual
    __datetime                      = ""    #- Fecha y hora actuales
    
    __time_mask                     = ""    #- Mascara tipo hora
    __date_mask                     = ""    #- Mascara tipo fecha
    __datetime_mask                 = ""    #- Mascara tipo fecha y hora


    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self, 
                 mascara_a_parsear      = ""        ,
                 tipo_mascara           = "date"    ,
                 log_level              = 0         ,
                 log_class_level        = 0         ,
                 log_show               = "screen"  ):
        """ Genera una estructura de fecha
        """

        self.__log_level = log_level

        self.LogInitConstructor()
        log_class_level = log_class_level + 1        

        self.__log_class_level = log_class_level


        DateMsg.__init__(self                       ,
                        log_level                   ,
                        log_class_level             ,
                        log_show                    )


        Mask.__init__(  self                        ,
                        mascara_a_parsear           ,
                        tipo_mascara                ,
                        log_level                   ,
                        log_class_level             ,
                        log_show                    )

        self.setTime()
        self.setDate()
        self.setDateTime()        


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

           
        self.log(texto      , 
                 valor      ,
                 cls                ,
                 mth                ,        
                 dec                ,
                 log_level          ,
                 log_class_level    )        


    def getTime(self):
        """ Retorno de la hora
        """    

        valor_a_devolver = self.__time
        self.logGet(valor_a_devolver, self.msg_time)
        return valor_a_devolver


    def setTime(self):
        """ Establecimiento de la hora actual
        """    

        mascara = self.getTimeMask()
        time = datetime.datetime.now().strftime(mascara)

        variable_a_establecer = time

        self.logSet(
            variable_a_establecer , 
            variable_a_establecer , 
            self.msg_time)

        self.__time = variable_a_establecer


    def getDate(self):
        """ Retorno de la hora
        """    

        valor_a_devolver = self.__date
        self.logGet(valor_a_devolver, self.msg_date)
        return valor_a_devolver


    def setDate(self):
        """ Establecimiento de la fecha actual
        """    

        mascara = self.getDateMask()

        date = datetime.datetime.now().strftime(mascara)

        variable_a_establecer = date

        self.logSet(
            variable_a_establecer , 
            variable_a_establecer , 
            self.msg_time)

        self.__date = variable_a_establecer


    def getDateTime(self):
        """ Retorno de la hora
        """    

        valor_a_devolver = self.__datetime
        self.logGet(valor_a_devolver, self.msg_datetime)
        return valor_a_devolver


    def setDateTime(self):
        """ Establecimiento de la fecha actual
        """    

        mascara = self.getDateTimeMask()

        date = datetime.datetime.now().strftime(mascara)
        ## 22/Apr/2013:11_52_AM


        variable_a_establecer = date

        self.logSet(
            variable_a_establecer , 
            variable_a_establecer , 
            self.msg_time)

        self.__datetime = variable_a_establecer

        

    ## 22/Apr/2013:11_52_AM
    

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=


