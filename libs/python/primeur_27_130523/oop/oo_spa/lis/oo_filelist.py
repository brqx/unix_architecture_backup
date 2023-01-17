#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.3
-----------------------------------------------------------
+ Clases definidas : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- FileList    : Clase de spazio para listado - Filelist
-----------------------------------------------------------
-+ Clases heredadas : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- SpazioFil     : Clase de Spazio para Listado
-----------------------------------------------------------
- Sys           : Clase de comandos de ejecuccion
-----------------------------------------------------------
-+ Clases utilizadas : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- Split         : Clase de parseo de subcadenas
-----------------------------------------------------------
- RulesSffEst   : Clase de parseo de ficheros
-----------------------------------------------------------
-+ Metodos definidos : 
-----------------------------------------------------------
- Pendiente  (init, gets y sets)
-----------------------------------------------------------
+ Librerias Primeur requeridas
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- pmsp_filelist
-----------------------------------------------------------
+ Librerias Sistema requeridas
-----------------------------------------------------------
- Ninguna
===========================================================
+ Process Status  : [130520]
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Quality        : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Comments       : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Info           : [0] [1] [2] [_] [4] [5]
-----------------------------------------------------------
#- Just           : [0] [1] [_] [3] [4] [5]
===========================================================
"""

##import sys

#- Importacion de clases heredadas
from oo_sys             import Sys
from oo_spfil           import SpazioFil
from oo_rules_sff_est   import RulesSffEst


#- Importacion de clases utilizadas

from oo_split import Split


#- Importacion de librerias de primeur

import pmsp_filelist

class FileList(SpazioFil        , 
               Sys              , 
               RulesSffEst      ):

    #-Variable estatica para indicar el nombre de la clase
    __cls           = "FileList"
    __mth           = ""    
    __log_level         = 0
    __log_class_level   = 0


    __bbbb = ""
    __mmmm = ""


    ## Temporal hasta que funciones
    cadena_resultados = ""    
    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                               , 
                 qmname                             , 
                 queue                              , 
                 numint                             , 
                 nod                = "oNOD"        , 
                 csv                = "o CSV"       ,
                 banner             = "oNOBanner"   ,
                 log_level          = 0             ,
                 log_class_level    = 0             ,
                 log_show           = "screen"      ):
        """ Inicia la clase de Spazio para gestionar FileList
        """

        self.__log_level = log_level

        self.LogInitConstructor()
        log_class_level = log_class_level + 1        

        self.__log_class_level = log_class_level

##        RulesSffEst.__init__  (self  , 
##                            log_level,
##                            log_class_level)        

        #-Ajuste multi sistema
        nod     = self.pmt_ind + "oNOD"
        csv     = self.pmt_ind + "o CSV"
        banner  = self.pmt_ind + "oNOBanner"


##        self.__bbbb = "-b3073 -b3057 -b3045 -b3044 -b1027 "
        self.__bbbb =                 self.pmt_ind + "b3073" 
        self.__bbbb = \
            self.__bbbb + self.sep  + self.pmt_ind + "b3057" 
        self.__bbbb = \
            self.__bbbb + self.sep  + self.pmt_ind + "b3045"
        self.__bbbb = \
            self.__bbbb + self.sep  + self.pmt_ind + "b3044"
        self.__bbbb = \
            self.__bbbb + self.sep  + self.pmt_ind + "b1027" 
        self.__bbbb = \
            self.__bbbb + self.sep            


        self.__mmmm = self.pmt_ind + "m4100'(2010)'"
        self.__mmmm = \
            self.__mmmm + self.sep  + self.pmt_ind + "m4200'(2010)'"
        self.__mmmm = \
            self.__mmmm + self.sep            

        SpazioFil.__init__(self,
            qmname , queue, numint , 
            nod, csv, banner, 
            log_level       ,
            log_class_level ,
            log_show        )


        command             =           ""    
        Sys.__init__(self               ,
                     command            ,
                     log_level          ,
                     log_class_level    ,
                     log_show           )


        self.processList()

 
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



    def processList(self):
        """ Procesa la recepcion del archivo
        """        
       
        self.createRunStr()
        
        self.runSys()
        
        #- Ahora tenemos que parsear el resultado

        self.evalOutputLines()
        #-- Establecer dest, message , correlid , sender


    def createRunStr(self):
        """ Genera la cadena para llamar al sistema
        """        
        qmname  = self.getQmName()
        queue   = self.getQueue()
        numint  = self.getNumInt()

        nod     = self.getNod()

        csv     = self.getCsv()                
        banner  = self.getBanner()
        
##        usuario = self.getUser()
##        passwd = self.getPasswd()

##        if usuario != "":
##            c_usuario = "-u " + usuario 

##        if passwd != "":
##            c_passwd = "-p " + passwd

##        seguridad = "-u sospadm -p sospadm"

        cadena_filelist = "filelist"      + self.sep + qmname
        cadena_filelist = cadena_filelist + self.sep + queue
##        cadena_filelist = cadena_filelist + self.sep + c_usuario
##        cadena_filelist = cadena_filelist + self.sep + c_passwd
        cadena_filelist = cadena_filelist + self.sep +  \
                         self.pmt_ind + "i" + numint 
        cadena_filelist = cadena_filelist + self.sep + nod
        cadena_filelist = cadena_filelist + self.sep + csv
        cadena_filelist = cadena_filelist + self.sep + banner
        cadena_filelist = cadena_filelist + self.sep + self.__bbbb
        cadena_filelist = cadena_filelist + self.sep + self.__mmmm


        self.runstr = cadena_filelist


    def evalOutputLines(self):
        """ Evalua la cadena de retorno
            Se llama pero no se bien que hace o debe hacer
        """        
        sep = "@"
        cadena = self.getSysOutStr()

        osplit = Split(cadena, sep)

#        print "comoienzo del parseo" + cadena
        ##print osplit.getSeparator()
        ##print osplit.getNumFields()
        self.cadena_resultados = osplit.getField(1)


##        print "Cad:" + self.cadena_resultados + ":End"
        self.evalFilelistOutStr()

        #-- Dependiende del sistema        
        
        self.setDirectory(self.tmp)
##        print osplit.getLastField()


    def evalFilelistOutStr(self):
        """ Evaluacion de la cadena de resultados
            Falta:
            - Cambiar funcion pm_parse_cadena por alguna
              dentro de una clase split
        """
        sep2        = ","
        resultados  = self.cadena_resultados

##        print resultados

        osplit = Split (resultados, sep2)
        
    
        self.setNumInt(osplit.getField())
        self.setCorrelId( 
            pmsp_filelist.pm_parse_cadena(osplit.getField(1)))
        self.setDescription(
            pmsp_filelist.pm_parse_cadena(osplit.getField(2)))
        self.setSender(
            pmsp_filelist.pm_parse_cadena(osplit.getField(3)))
        self.setModality(
            pmsp_filelist.pm_parse_cadena(
                osplit.getField(4),1," " ))

        self.setSourceFileName(
            pmsp_filelist.pm_parse_cadena(osplit.getField(5)))

        self.setDestinationFileName(
            pmsp_filelist.pm_parse_cadena(osplit.getField(6)))

     
##        print self.getNumInt()
    
    
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

## qmanager = "fuduntu" 
## queue= "EVENTQUEUE"
## numint = "00050000000027C4"
## correlid= "CORRELID"
## desc = "PRUEBAS EVENTO PYTHON"
## sender = "EMISOR"
## Modality = "32"
## conf = "/opt/spazio/spazio.ini", 
## df ="DestinationFileName.dat"

## qm = qmanager
## q = queue
## n = numint
## ls= "screen"

## ll = int(sys.argv[1])


#/ Falta probar bien la clase Spazio

## ae = FileList(qm, q, n, nod, csv, banner, ls, ll)

##print (ae.getRunStr()				)

##print (ae.getSysOutStr()			)



