#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.2
-----------------------------------------------------------
+ Clases definidas : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- LogEst   : Clase de estructura para los logs
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
+ Process Status  : [130516]
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


class LogEst(object):

    #-Variable estatica para indicar el nombre de la clase
    __cls           = "Log"
    __mth           = "log"    
    __file          = ""
    __size          = 1000000

    #- Variables privadas de la clase

    __len_log_line      = 100   #- Longitud linea de log --- PENDIENTE --

    __len_log_text      = 40    #- Posicionador de valores
    __len_log_value     = 30    #- Posicionador de valores


    __text_justify      = ""
    __value_justify     = ""

    __text_msg          =   ""
    __value_msg         =   ""


    #- Variables publicas de la clase
    
    sep_text_value    = " "     #- Separador de textos - union texto valor -

    sep_ini_value     = "["     #- Separador inicial de los valores
    sep_end_value     = "]"     #- Separador final de los valores

    sep_ini_text      = ""      #- Separador inicial de los valores
    sep_end_text      = ""      #- Separador final de los valores


    sep                 = " "   #- Separador generico
    sep_text            = ""    #- Separador textos

    space               = " "   #- Caracter de espacio para los logs

    log_level           = 0     #- Nivel de log aplicado
    log_class_level     = 9     #- Nivel maximo de herencia
    log_show            = "screen"

    #- Atrtibutos dependiendes del sistema

    pmt_ind             = "-"   #- Indicador de parametros
                                #- En windows sera slash

    sys_ind             = "unix" 
    sys_plt             = "linux"

    #- Rutas principales para spazio - version Unix 
    spazio              = "/opt/spazio"
    tmp                 = "/tmp"
    cfg                 = "/opt/spazio/cfg"
    log                 = "/opt/spazio/logs"


    tmp_path            = ""
    cfg_path            = ""
    log_path            = ""


    slash               = "/"

    #- Variables control de flujo
    
    cls                 = ""    #- Clase en el que se lanza el log
    mth                 = ""    #- Metodo en el que se lanza el log


    #- Lineas ajustadas para configuracion por defecto
    lines               = "-----------------------------"
    dlines              = "============================="
    endlines            = "=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
    altlines            = "=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
    ascline             = "*****************************"
    bline               = ""

    #- Organizacion del codigo ( Inicio y fin de cls - mth )
    
    #- Start - End de constructor    
    s_cls               = "SConst-----------------------" 
    e_cls               = "EConst-----------------------" 

    s_mth               = "SMth-------------------------" 
    e_mth               = "EMth-------------------------" 


    #-Niveles y decoraciones

    __log_level         =   0
    __log_class_level   =   0
    __log_show          = "screen"        

    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------

    def __init__(self                           , 
                 log_level          = 0         ,
                 log_class_level    = 0         ,
                 log_show           = "screen"  ,
                 log_file           = ""        ):
        """ Parametros
            - log_level       : nivel de log
            - log_class_level : nivel de herencia actual del programa
        """
        #- Establecemos el nivel de log publicos
##        self.log_level       = log_level
##        self.log_class_level = log_class_level

        #- A nivel de la estructura de los logs no imprimimos

        self.set_log_level(log_level)
        self.set_log_class_level(log_class_level)
        self.set_log_file(log_file)    
        self.set_log_show(log_show)    

    

    def getlog_text_msg(self):
        """ Obtencion del mensaje de texto establecido
        """
        return self.__text_msg

        
    def setlog_text_msg(self, argumento):
        """ Establecimiento del mensaje de texto
        """
        self.__text_msg = argumento


    def getlog_value_msg(self):
        """ Obtencion del mensaje de texto establecido
        """
        return self.__value_msg
        
    def setlog_value_msg(self, argumento):
        """ Establecimiento del mensaje de texto
        """
        self.__value_msg = argumento

    def getlog_text_justify(self):
        """ Obtencion del mensaje de texto establecido
        """
        return self.__text_justify
        
    def setlog_text_justify(self, argumento):
        """ Establecimiento del mensaje de texto
        """
        self.__text_justify = argumento

    def getlog_value_justify(self):
        """ Obtencion del mensaje de texto establecido
        """
        return self.__value_justify
        
    def setlog_value_justify(self, argumento):
        """ Establecimiento del mensaje de texto
        """
        self.__value_justify = argumento

    #-- Acceso a las longitudes de los textos
    
    def getlog_value_len(self):
        """ Obtencion del mensaje de texto establecido
        """
        return self.__len_log_value
        
    def setlog_value_len(self, argumento):
        """ Establecimiento del mensaje de texto
        """
        self.__len_log_value = argumento


    def getlog_text_len(self):
        """ Obtencion del mensaje de texto establecido
        """
        return self.__len_log_text
        
    def setlog_text_len(self, argumento):
        """ Establecimiento del mensaje de texto
        """
        self.__len_log_text = argumento

    #-- Acceso a los niveles de log

    def getlog_level(self):
        """ Obtencion del mensaje de texto establecido
        """
        return self.log_level

    def setlog_level(self, argumento):
        """ Establecimiento del mensaje de texto
        """
        self.log_level = argumento        
    
    def setlog_class_level(self, argumento):
        """ Establecimiento del mensaje de texto
        """
        self.log_class_level = argumento        


    def get_log_level(self):
        """ Obtencion del mensaje de texto establecido
        """
        return self.__log_level


    def set_log_level(self, argumento):
        """ Establecimiento del mensaje de texto
        """
        self.__log_level = argumento        


    def get_log_class_level(self):
        """ Obtencion del mensaje de texto establecido
        """
        return self.__log_class_level

    
    def set_log_class_level(self, argumento):
        """ Establecimiento del mensaje de texto
        """
        self.__log_class_level = argumento        


    def get_log_show(self):
        """ Obtencion del mensaje de texto establecido
        """
        return self.__log_show

    
    def set_log_show(self, argumento):
        """ Establecimiento del mensaje de texto
        """
        self.__log_show= argumento        


    def get_log_cls(self):
        """ Obtencion del mensaje de texto establecido
        """
        return self.__cls



    def set_log_cls(self, argumento):
        """ Establecimiento del mensaje de texto
        """
        self.__cls = argumento        


    def get_log_mth(self):
        """ Obtencion del mensaje de texto establecido
        """
        return self.__mth


    def set_log_mth(self, argumento):
        """ Establecimiento del mensaje de texto
        """
        self.__mth = argumento        


    def get_log_file(self):
        """ Obtencion del mensaje de texto establecido
        """
        return self.__file


    def set_log_file(self, argumento):
        """ Establecimiento del mensaje de texto
        """
        self.__file = argumento        


    def get_log_size(self):
        """ Obtencion del mensaje de texto establecido
        """
        return self.__size


    def set_log_size(self, argumento):
        """ Establecimiento del mensaje de texto
        """
        self.__size = argumento        

            
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

