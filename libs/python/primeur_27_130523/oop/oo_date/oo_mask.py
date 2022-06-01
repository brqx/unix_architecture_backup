#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.3
-----------------------------------------------------------
+ Clases definidas      : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Mask              - Clase de Mascaras
-----------------------------------------------------------
-+ Clases heredadas     : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- MaskEst           - Clase de estructura de mascaras
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

#- Importacion de clases heredadas

from oo_mask_est import MaskEst


class Mask(MaskEst):

    #-Variable estatica para indicar el nombre de la clase
    __cls                   = "Mask"
    __mth                   = ""    
    __log_level             = 0
    __log_class_level       = 0


    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                           , 
                 mascara_a_parsear  = ""        ,
                 tipo_mascara       = "date"    ,
                 log_level              = 0         ,
                 log_class_level        = 0         ,
                 log_show               = "screen"  ):
        """ Constructor de mascaras
        """

        self.__log_level = log_level

        self.LogInitConstructor()
        log_class_level = log_class_level + 1        

        self.__log_class_level = log_class_level


        MaskEst.__init__(self                       ,
                        mascara_a_parsear           ,
                        log_level                   ,
                        log_class_level             ,
                        log_show                    )


        self.setMask(mascara_a_parsear, tipo_mascara)


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



    def setMask(self, argumento, tipo_mascara):
        """ Establecimiento de la Mascara ya sea de hora, de fecha o de ambos
        """    

        mth = "setMask"

        if tipo_mascara == "date":
            self.evalDateMask(argumento)
            self.evalTimeMask()
            self.evalDateTimeMask()

        elif tipo_mascara == "time":
            self.evalTimeMask(argumento)
            self.evalDateMask()
            self.evalDateTimeMask()

        elif tipo_mascara == "datetime":
            self.evalDateTimeMask(argumento)
            self.evalTimeMask()
            self.evalDateMask()

        else:
            self.__Log("Error en la mascara",tipo_mascara, mth)
   

    def evalDateMask(self, argumento = ""):    
        """ Evaluacion de una mascara tipo fecha
            Si el argumento esta vacio o es invalido se devuelve la de 
            por defecto
        """    

        default_mask    = "%Y%m%d"
        month_mask      = "%Y%m"
        year_mask       = "%Y"

        #-- Funcion que evalue las mascaras                    

        if argumento == "[Y01][M01][D01]":
            self.setDateMask(default_mask)
            self.setDateHumanMask("[Y01][M01][D01]")

        elif argumento == "[Y01][M01]":
            self.setDateMask(month_mask)
            self.setDateHumanMask("[Y01][M01]")

        elif argumento == "[Y01]":
            self.setDateMask(year_mask)
            self.setDateHumanMask("[Y01]")

        else:
            self.setDateMask(default_mask)
            self.setDateHumanMask("[Y01][M01][D01]")


    def evalTimeMask(self, argumento= ""):    
        """ Evaluacion de una mascara tipo hora
            Si el argumento esta vacio o es invalido se devuelve la de 
            por defecto
        """    

        default_mask            = "%H%M%S"
        minute_mask             = "%H%M"
        hour_mask               = "%H"

        #-- Funcion que evalue las mascaras                    

        if argumento == "[H01][M01][S01]":
            self.setTimeMask(default_mask)
            self.setTimeHumanMask("[H01][M01][S01]")

        elif argumento == "[H01][M01]":
            self.setTimeMask(minute_mask)
            self.setTimeHumanMask("[H01][M01]")

        elif argumento == "[H01]":
            self.setTimeMask(hour_mask)
            self.setTimeHumanMask("[H01]")

        else:
            self.setTimeMask(default_mask)
            self.setTimeHumanMask("[H01][M01][S01]")



    def evalDateTimeMask(self, argumento = ""):    
        """ Evaluacion de una mascara tipo fecha y hora
            Si el argumento esta vacio o es invalido se devuelve la de 
            por defecto
        """    

        default_mask            = "%Y%m%d%H%M%S"
        minute_mask             = "%Y%m%d%H%M"
        hour_mask               = "%Y%m%d%H"
        day_mask                = "%Y%m%d"
        month_mask              = "%Y%m"
        year_mask               = "%Y"

        #-- Funcion que evalue las mascaras                    

        if   argumento == "[Y01][M01][D01][H01][M01][S01]":
            self.setDateTimeMask(default_mask)
            self.setDateTimeHumanMask("[Y01][M01][D01][H01][M01][S01]")

        elif argumento == "[Y01][M01][D01][H01][M01]":
            self.setDateTimeMask(minute_mask)
            self.setDateTimeHumanMask("[Y01][M01][D01][H01][M01]")

        elif argumento == "[Y01][M01][D01][H01]":
            self.setDateTimeMask(hour_mask)
            self.setDateTimeHumanMask("[Y01][M01][D01][H01]")

        elif argumento == "[Y01][M01][D01]":
            self.setDateTimeMask(day_mask)
            self.setDateTimeHumanMask("[Y01][M01][D01]")

        elif argumento == "[Y01][M01]":
            self.setDateTimeMask(month_mask)
            self.setDateTimeHumanMask("[Y01][M01][D01]")

        elif argumento == "[Y01]":
            self.setDateTimeMask(year_mask)
            self.setDateTimeHumanMask("[Y01][M01]")

        else:
            self.setDateTimeMask(default_mask)
            self.setDateTimeHumanMask("[Y01][M01][D01][H01][M01][S01]")
        

#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=


## tipo_mascara="date"
## mascara="[Y01][M01]"
## fe = Mask(mascara, tipo_mascara)

## print (fe.getTimeMask()		)
## print (fe.getDateMask()		)
## print (fe.getDateTimeMask()	)

## cad1="aaaac$FECHA+$MASCARA"

## cad_sys = sys.argv[1]

