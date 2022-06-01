#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.3
-----------------------------------------------------------
+ Clases definidas              : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- RulesAcq      - Clase de reglas para el proceso de Acq
-----------------------------------------------------------
+- Clases heredadas             :
--=----=----=----=----=----=----=----=----=----=----=----=-
- RulesSffAcq   - Clase SFF enfocada a ACQ
-----------------------------------------------------------
+ Librerias Primeur requeridas  :
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
-----------------------------------------------------------
+ Librerias Sistema requeridas
-----------------------------------------------------------
- Ninguna
===========================================================
+ Process Status  : [130509]
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

#- Importacion de clases heredadas

from oo_rules_sff_acq import RulesSffAcq


class RulesAcq(RulesSffAcq):


    #-Variable estatica para indicar el nombre de la clase
    __cls                   = "RulesAcq"
    __mth                   = ""    
    __log_level             = 0
    __log_class_level       = 0


    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                               , 
                 correl_id_tuple    = ""            , 
                 rules_file         = ""            , 
                 comment            = "#"       ,
                 log_level          = 0             ,
                 log_class_level    = 0             ,
                 log_show           = "screen"      ):
        """ Proceso de reglas para Acq
        """
        ## Hay que iterar en la cadena y comprobar las variables

        self.__log_level = log_level

        self.LogInitConstructor()
        log_class_level = log_class_level + 1        

        self.__log_class_level = log_class_level
                
        #- Iniciar los parametros de las reglas
                
        RulesSffAcq.__init__(self           , 
                          correl_id_tuple   , 
                          rules_file        , 
                          comment           ,
                          log_level         ,
                          log_class_level)        


        
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
   

    def runRuleDestinationFileName(self):
        """ Regla destination FileName 
            - si se especifica algo en fichero de reglas se cambia
        """
        fichero_vacio = ""
        fichero_en_regla= self.getRulDestinationFileName()
        if fichero_en_regla != "":
            return fichero_en_regla        
        else:
            return fichero_vacio
        

    def runRuleDirectory(self               , 
                         argumento = ""     ):
        """ Regla directorio para Acq
        """
        fichero_en_regla    = self.getRulDirectory()
        if argumento == "":
            argumento       = self.tmp

        if fichero_en_regla != "":
            return fichero_en_regla
        else:
            return argumento


    def runRuleSobrescritura(self):
        """ Regla Sobrescritura para Acq
        """
        cadena_salida = ""
        fichero_en_regla= self.getRulSobrescritura()

        if fichero_en_regla != "":
            if fichero_en_regla == "Y":
                cadena_salida = self.pmt_ind + "o OV"
            if fichero_en_regla == "N":
                cadena_salida = self.pmt_ind + "o SU"

        return cadena_salida        


    def runRuleCaracteres(self              , 
                          argumento = ""    ):
        """ Convierte a Mayúsculas o Minúsculas el nombre fichero destino
            Puede tener : MAYUS / MINUS        
        """
        cadena_salida = ""
        fichero_en_regla= self.getRulCaracteres()

        if fichero_en_regla != "":
            if fichero_en_regla == "MAYUS":
                cadena_salida = argumento.upper()
            if fichero_en_regla == "MINUS":
                cadena_salida = argumento.lower()


        return cadena_salida        


    def runRuleExtraccion(self):
        """ Determina el modo de extracción del fichero del gestor de colas SPAZIO.
            Sólo admite dos valores:
            - INPUT - Si el fichero se borra del gestor (opción ‘-m IN’)
            - BROWSE - Si el fichero NO se cancela del gestor  
            	-  (es la opción de default del comando ‘filetacq’)
            Default  – Hará la extracción en modo ‘INPUT’
        """ 
        mth = "runRuleExtraccion"
       
        cadena_salida = self.pmt_ind + "mIN"
        
        fichero_en_regla= self.getRulExtraccion()

        self.__Log("Valor Regla extraccion",
                   fichero_en_regla , mth)
    

        if fichero_en_regla != "":
            if fichero_en_regla == "INPUT":
                cadena_salida = cadena_salida
            if fichero_en_regla == "BROWSE":
                cadena_salida = ""


        return cadena_salida        

    
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

##nivel_log = 0

##cen = CencosurCk(parametros y nivel de log)

### correl_id      = ""
### fichero_reglas = "/opt/spazio/spazio.ini"
### clave = "CfgPath"
### comentario = "#"
### rulsff = RulesSffEst(clave, fichero_reglas)    


##ej = RulesAcq(correl_id, fichero_reglas)

### print (ej.getDestinationFileName()		)
### print (ej.getDirectorio()				)


