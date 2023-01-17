#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.3
-----------------------------------------------------------
+ Clases definidas              : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- MaskEst                   - Clase de estructura de mascaras
-----------------------------------------------------------
-+ Clases heredadas             : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- MaskMsg                   - Clase de mensajes de mascaras
-----------------------------------------------------------
-+ Metodos definidos            : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- get/setTimeMask           - Mascara tipo hora
-----------------------------------------------------------
- get/setDateMask           - Mascara tipo fecha
-----------------------------------------------------------
- get/setDateTimeMask       - Mascara tipo fecha y hora
-----------------------------------------------------------
- get/setTimeHumanMask      - Mascara de hora humana
-----------------------------------------------------------
- get/setDateHumanMask      - Mascara de fecha humana
-----------------------------------------------------------
- get/setDateTimeHumanMask  - Mascara de entrada humana
-----------------------------------------------------------
+ Librerias Primeur requeridas  :
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
-----------------------------------------------------------
+ Librerias Sistema requeridas  :
--=----=----=----=----=----=----=----=----=----=----=----=-
- Ninguna
===========================================================
+ Process Statuss : [130603]
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
    __cls                               = "MaskEst"
    __mth                               = ""    
    __log_level                         = 0
    __log_class_level                   = 0

    __log_show                          = "screen"
    __log_file                          = ""
    __log_file_alt                      = ""    # Log file alterno

    __log_file_err                      = ""    # Log file de error


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
    def __init__(self                                       , 
                 mascara_a_parsear      =   ""              ,
                 log_level              =   0               ,
                 log_class_level        =   0               ,
                 log_show               =   "screen"        ,
                 log_file               =   ""              ,
                 log_file_err           =   ""              ,
                 log_size               =   1000000         ):
        """ Constructor de estructuras de mascaras
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


        MaskMsg.__init__(self                   ,
                        log_level               ,
                        log_class_level         ,
                        log_show                ,
                        log_file                ,
                        log_size                )

  
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


