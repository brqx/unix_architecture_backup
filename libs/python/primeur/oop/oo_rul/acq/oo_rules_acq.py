#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.4
-----------------------------------------------------------
+ Clases definidas              : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- RulesAcq      - Clase de reglas para el proceso de Acq
-----------------------------------------------------------
+- Clases heredadas             :
--=----=----=----=----=----=----=----=----=----=----=----=-
- RulesSffAcq   - Clase SFF enfocada a ACQ
-----------------------------------------------------------
-+ Metodos definidos            : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- runRuleDestinationFileName    - Lanza Regla Destination FileName
-----------------------------------------------------------
- runRuleDirectory              - Lanza Regla Directorio
-----------------------------------------------------------
- runRuleSobrescritura          - Lanza Regla Sobrescritura
-----------------------------------------------------------
- runRuleCaracteres             - Lanza Regla Caracteres
-----------------------------------------------------------
- runRuleExtraccion             - Lanza Regla Extraccion
-----------------------------------------------------------
- runRuleCopyDup                - Lanza Regla CopyDup
-----------------------------------------------------------
+ Librerias Primeur requeridas  :
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
-----------------------------------------------------------
+ Librerias Sistema requeridas
-----------------------------------------------------------
- Ninguna
===========================================================
+ Process Status  : [130531]
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#- Quality        : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Comments       : [0] [1] [2] [3] [_] [5]
-----------------------------------------------------------
#- Info           : [0] [1] [2] [3] [4] [_]
-----------------------------------------------------------
#- Just           : [0] [1] [2] [3] [_] [5]
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

    __log_show              = "screen"
    __log_file              = ""    # Log file por defecto
    __log_file_alt          = ""    # Log file alterno
    __log_file_err          = ""    # Log file alterno


    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------
    def __init__(self                                       , 
                 correl_id_tuple            =   ""          , 
                 rules_file                 =   ""          , 
                 comment                    =   "#"         ,
                 log_level                  =   0           ,
                 log_class_level            =   0           ,
                 log_show                   =   "screen"    ,
                 log_file                   =   ""          ,
                 log_file_err               =   ""          ,
                 log_size                   =   1000000     ):
        """ Proceso de reglas para Acq
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

                
        #- Iniciar los parametros de las reglas
                
        RulesSffAcq.__init__( self                  , 
                              correl_id_tuple       , 
                              rules_file            , 
                              comment               ,
                              log_level             ,
                              log_class_level       ,
                              log_show              ,
                              log_file              ,
                              log_file_err          ,
                              log_size              )


        
        if log_level > log_class_level:
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
            argumento       = self.tmp_path

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


    def runRuleCopyDup(self):
        """ Regla CopyDup
            Si existe el fichero hay que ponerle un timestamp
            En este punto no podemos hacer nada pues no nos
            llega el fichero ya procesado
            La regla no hace nada
        """
##        fichero_en_regla= self.getRulDestinationFileName()
        copydup         = self.getRulCopyDup()

        #-130606 - Aqui no lo ha procesado pero tenemos copydup
        return copydup
    
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


