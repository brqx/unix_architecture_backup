#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.3
-----------------------------------------------------------
+ Clases definidas      : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- FileSpv       - Clase de spazio para reenvio - SpevCmd 
-----------------------------------------------------------
-+ Clases heredadas     : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- SpazioSpv     - Clase de Spazio para Spv
-----------------------------------------------------------
- RulesSpv      - Clase de reglas para Spv
-----------------------------------------------------------
- Sys           - Clase de comandos de ejecuccion
-----------------------------------------------------------
-+ Clases utilizadas    : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- Parse         - Clase de parseo
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
+ Process Status  : [130522]
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Quality        : [0] [1] [2] [_] [4] [5]
-----------------------------------------------------------
#- Comments       : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Info           : [0] [1] [2] [_] [4] [5]
-----------------------------------------------------------
#- Just           : [0] [1] [2] [_] [4] [5]
===========================================================
"""

#- Importacion de librerias del sistema

import os

#- Importacion de clases heredadas
from oo_sys         import Sys
#from oo_rules_spv   import RulesSpv
#from oo_spspv       import SpazioSpv


#- Importacion de clases utilizadas

from oo_parse       import Parse

from oo_file        import File


class FileSpv(Sys                           ):
    
    __cls               = "FileSpv"
    __mth               = ""    
    __log_level         = 0
    __log_class_level   = 0


    
    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                           , 
                 qmname                         , 
                 sess_id                        , 
                 spev_type              = "E"   , 
                 log_level          = 0         ,
                 log_class_level    = 0         ,
                 log_show           = "screen"  ):
        """ Constructor SpevCmd
            spevcmd ?QMANAGER? ?SESS_ID? E|A|R
        """
        mth = "init"
        
        self.__log_level = log_level

        self.LogInitConstructor()
        log_class_level = log_class_level + 1        

        self.__log_class_level = log_class_level

       
        SpazioSpv.__init__(self         ,
            qmname                      , 
            sess_id                     , 
            spev_type                   , 
            log_level                   ,
            log_class_level             ,
            log_show                    )

        command         =       ""

        Sys.__init__(self               ,
                     command            ,
                     log_level          ,
                     log_class_level    ,
                     log_show           )

  
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


    def processSpv(self):
        """ Procesa la recepcion del archivo
        """        
        mth = "processSpv"
    
        #-- Generar cadena del sistema
        self.createRunStr()
                
                #-- Ejecuccion de la cadena
        self.runSys()
       
        

    def createRunStr(self):
        """ Genera la cadena para llamar a spevcmd
            spevcmd ?QMANAGER? ?SESS_ID? E|A|R
        """        
        mth = "createRunStr"

        self.LogInitMethod(self.__cls)

        qmname          = self.getQmName()
        sess_id         = self.getSessId()
        spev_type       = self.getSpevType()


        usuario         = self.getUser()
        passwd          = self.getPasswd()

        if usuario  != "":
            c_usuario   = "-u " + usuario 

        if passwd   != "":
            c_passwd    = "-p " + passwd


        #-- Falta encontrar por que extraccion llega vacio

        self.__Log("Queue Manager"              , 
                   qmname                       , 
                   mth                          ,
                   "simple_simple"              )   


        self.__Log("Sess Id"                    , 
                   qmname                       , 
                   mth                          ,
                   "simple_simple"              )   


        self.__Log("SpevCmd Type"               , 
                   qmname                       , 
                   mth                          ,
                   "simple_simple"              )   


        #-Hay que gestionar el separador

        cadena_spevcmd = "spevcmd"      + self.sep + \
                         self.pmt_ind   + qmname 

        cadena_spevcmd = cadena_spevcmd + self.sep + \
                         self.pmt_ind   + sess_id 
##        cadena_spevcmd = cadena_spevcmd + self.sep + c_usuario
##        cadena_spevcmd = cadena_spevcmd + self.sep + c_passwd

        cadena_spevcmd = cadena_spevcmd + self.sep + \
                         self.pmt_ind + spev_type


        self.__Log("Creada la cadena SpevCmd"   , 
                   cadena_spevcmd               , 
                   mth                          ,
                   "square_simple"              )        
                   
        
        self.runstr = cadena_spevcmd

        self.LogEndMethod(self.__cls)
    
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

## qm = "QM"
## q = "QM"
## n = "QM"
## ci = "CORRELID"
## se = "SENDER"
## df = "dest.dat"
## rt = "/tmp"
## ls = "screen"
## ll = int(sys.argv[1])


## ae = FileAcq(qm, q, n , df , ci , se, rt, ls, re, ll)

## print ae.getRunStr()

## print ae.getSysOutStr()

### ej = Rules(tupla_correlid, fichero_reglas)

### print ej.getDestinationFileName()
### print ej.getDirectorio()

