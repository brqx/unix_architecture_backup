#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.5
-----------------------------------------------------------
+ Clases definidas              : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Log   : Clase de gestion de logs
-----------------------------------------------------------
-+ Clases heredadas             : 
--=----=----=----=----=----=----=----=----=----=----=----=-
- LogLight           : Clase de acceso al sistema
-----------------------------------------------------------
-+ Metodos definidos            : 
-----------------------------------------------------------
- log                   - Metodo de log que interpreta decorados
-----------------------------------------------------------
- dec_simple_simple     - Decorado simple - simple
-----------------------------------------------------------
- dec_simple_double     - Decorado simple - double
-----------------------------------------------------------
- dec_simple_alt        - Decorado simple - alt
-----------------------------------------------------------
- dec_simple_asc        - Decorado simple - asc
-----------------------------------------------------------
- sysver                - Informacion de la version
-----------------------------------------------------------
+ Librerias Primeur requeridas  :
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Ninguna
-----------------------------------------------------------
+ Librerias Sistema requeridas  : (python x.x)
-----------------------------------------------------------
- os - sys
===========================================================
+ Process Status  : [130605]
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

import os, sys

#- Importacion de clases heradadas

from oo_log_light import LogLight


#- Importacion de clases utilizadas

class Log(LogLight):


    __log_file_alt  = ""
    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------

    def __init__(self                           , 
                 comando            = ""        ,
                 log_level          = 0         ,
                 log_class_level    = 0         ,
                 log_show           = "screen"  ,
                 log_file           = ""        ,
                 log_size           = 1000000   ):
        """ De momento sin argumentos
        """
        self.set_log_cls(comando)


        LogLight.__init__(self                  , 
                        log_level               ,
                        log_class_level         ,
                        log_show                ,
                        log_file                ,
                        log_size                )                


        #-Ajuste del indicador y del sistema

        ## Windows (win32, win64), Linux (linux2) y Mac (darwin).        
        
        sistemaop = os.name

        #-Colocamos esta variable para evitar tener que pasarla
        spazio_path = os.environ['SPAZIO']
        
        if spazio_path != "":
            self.spazio = spazio_path
        
        if sistemaop == "nt":
            #-Puede ser o windows o mac
            self.pmt_ind    = "/"
            self.sys_ind    = "windows"
            self.tmp_path   = "c:\\temp\\"
            self.slash      = "\\"


        elif sistemaop == "posix":
            self.pmt_ind    = "-"
            self.sys_ind    = "unix"
            self.tmp_path   = "/tmp"
            self.sys_plt    = sys.platform
            self.slash      = "/"


        #-Configuracion de la variable de Spazio
        self.spazio_ini  =   self.spazio + self.slash + "spazio.ini"


    #-Clase de log alternada
    def LogAlt(self                             ,
              texto         =   ""              ,
              valor         =   ""              ,
              dec           =   "normal"        ,
              cls           =   ""              ,
              mth           =   ""              ):
        """ Log de la clase necesario para invocar desde los main
            Parametros:
            - texto     : texto de la expresion
            - valor     : valor de la expresion
            - cls-mth   : Clase y metodo
            - dec       : Decorado ( tipo de presentacion)
        """        
        if mth == "":
            mth = self.get_log_mth()

        if cls == "":
            cls = self.get_log_cls()

        log_level       = self.get_log_level()
        log_class_level = self.get_log_class_level()
        log_show        = self.get_log_show()
        log_file        = self.__log_file_alt
        log_size        = self.get_log_size()

           
        self.log(texto              , 
                 valor              ,
                 cls                ,
                 mth                ,        
                 dec                ,
                 log_level          ,
                 log_class_level    ,
                 log_show           ,
                 log_file           ,
                 log_size           )        


    #-Clase de log de traza
    def Log(self                                ,
            texto           =   ""              ,
            valor           =   ""              ,
            dec             =   "normal"        ,
            cls             =   ""              ,
            mth             =   ""              ):
        """ Log de la clase para traza
        """        

        self.__log_file_alt  = self.get_log_file()

        self.LogAlt(texto                       ,
                      valor                     ,
                      dec                       ,
                      cls                       ,
                      mth                       )


    #-Clase de log principal de funcionalidad
    def log(self                            , 
            texto           =   ""          , 
            valor           =   ""          ,
            cls             =   ""          ,
            mth             =   ""          ,
            dec             =   "normal"    ,
            log_level       =   0           ,
            log_class_level =   0           ,
            log_show        =   "screen"    ,
            log_file        =   ""          ,
            log_size        =   1000000     ):
        """ Necesitamos que se imprima pero justificando los valores
            y tambien justificando la linea
            Parametros:
            - texto     : texto de la expresion
            - valor     : valor de la expresion
            - cls-mth   : Clase y metodo
            - sw_pantalla (screen)
            - dec       : Decorado ( tipo de presentacion)
        """


##        if log_file:
##            print ("oo_log - Antes del errorrrr2" + str(log_file))

        
        if log_level > log_class_level:

        #------------------------------------------------------
        #-- D E C O R A D O S   S I M P L E S
        #------------------------------------------------------
            if dec == "normal":
            #-- texto    [valor]
    
                self.loglight(  texto                   , 
                                valor                   ,
                                cls                     ,
                                mth                     ,
                                log_show                ,
                                log_file                ,
                                log_size                )

            elif dec == "simple_simple":
            #-- texto    [valor]
            #--------------------------------

                self.loglight(  texto                   , 
                                valor                   ,
                                cls                     ,
                                mth                     ,
                                log_show                ,
                                log_file                ,
                                log_size                )

                self.dec_simple_simple     (
                                log_show                ,
                                log_file                ,
                                log_size                )

            elif dec == "simple_double":
            #-- texto    [valor]
            #=================================

                self.loglight(  texto                   , 
                                valor                   ,
                                cls                     ,
                                mth                     ,
                                log_show                ,
                                log_file                ,
                                log_size                )

                self.dec_simple_double     (
                                log_show                ,
                                log_file                ,
                                log_size                )

            elif dec == "simple_alt":
            #-- texto    [valor]
            #=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
                self.loglight(  texto                   , 
                                valor                   ,
                                cls                     ,
                                mth                     ,
                                log_show                ,
                                log_file                ,
                                log_size                )

                self.dec_simple_alt     (
                                log_show                ,
                                log_file                ,
                                log_size                )

            elif dec == "simple_asc":
            #-- texto    [valor]
            #**********************************

                self.loglight(  texto                   , 
                                valor                   ,
                                cls                     ,
                                mth                     ,
                                log_show                ,
                                log_file                ,
                                log_size                )

                self.dec_simple_asc     (
                                log_show                ,
                                log_file                ,
                                log_size                )


        #------------------------------------------------------
        #-- R E C U A D R O S    S I M P L E S
        #------------------------------------------------------

            elif dec == "square_simple":
            #--------------------------------
            #-- texto    [valor]
            #--------------------------------

                self.dec_simple_simple     (
                                log_show                ,
                                log_file                ,
                                log_size                )

                self.loglight(  texto                   , 
                                valor                   ,
                                cls                     ,
                                mth                     ,
                                log_show                ,
                                log_file                ,
                                log_size                )

                self.dec_simple_simple     (
                                log_show                ,
                                log_file                ,
                                log_size                )


            elif dec == "square_double":
            #================================
            #-- texto    [valor]
            #================================

                self.dec_simple_double     (
                                log_show                ,
                                log_file                ,
                                log_size                )

                self.loglight(  texto                   , 
                                valor                   ,
                                cls                     ,
                                mth                     ,
                                log_show                ,
                                log_file                ,
                                log_size                )

                self.dec_simple_double     (
                                log_show                ,
                                log_file                ,
                                log_size                )


            elif dec == "square_alt":
            #--------------------------------
            #-- texto    [valor]
            #--------------------------------

                self.dec_simple_alt     (
                                log_show                ,
                                log_file                ,
                                log_size                )

                self.loglight(  texto                   , 
                                valor                   ,
                                cls                     ,
                                mth                     ,
                                log_show                ,
                                log_file                ,
                                log_size                )

                self.dec_simple_alt     (
                                log_show                ,
                                log_file                ,
                                log_size                )


        #------------------------------------------------------
        #-- D E C O R A D O S   D O B L E S 
        #------------------------------------------------------

            elif dec == "double_simple":
            #-- texto    []
            #--------------------------------
            #-- valor            
            

                self.loglight(  texto                   , 
                                self.bline              ,
                                cls                     ,
                                mth                     ,
                                log_show                ,
                                log_file                ,
                                log_size                )

                self.dec_simple_simple     (
                                log_show                ,
                                log_file                ,
                                log_size                )

                self.loglight(  valor                   , 
                                self.bline              ,
                                cls                     ,
                                mth                     ,
                                log_show                ,
                                log_file                ,
                                log_size                )


            elif dec == "double_alt":
            #--------------------------------
            #-- texto    []
            #=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
            #-- valor            
            #--------------------------------
            

                self.dec_simple_simple     (
                                log_show                ,
                                log_file                ,
                                log_size                )

                self.loglight(  texto                   , 
                                self.bline              ,
                                cls                     ,
                                mth                     ,
                                log_show                ,
                                log_file                ,
                                log_size                )

                self.dec_simple_alt     (
                                log_show                ,
                                log_file                ,
                                log_size                )

                self.loglight(  valor                   , 
                                self.bline              ,
                                cls                     ,
                                mth                     ,
                                log_show                ,
                                log_file                ,
                                log_size                )

                self.dec_simple_simple     (
                                log_show                ,
                                log_file                ,
                                log_size                )


            elif dec == "double_double":
            #--------------------------------
            #-- texto    []
            #================================
            #-- valor            
            #--------------------------------
            

                self.dec_simple_simple     (
                                log_show                ,
                                log_file                ,
                                log_size                )

                self.loglight(  texto                   , 
                                self.bline              ,
                                cls                     ,
                                mth                     ,
                                log_show                ,
                                log_file                ,
                                log_size                )

                self.dec_simple_double     (
                                log_show                ,
                                log_file                ,
                                log_size                )

                self.loglight(  valor                   , 
                                self.bline              ,
                                cls                     ,
                                mth                     ,
                                log_show                ,
                                log_file                ,
                                log_size                )

                self.dec_simple_simple     (
                                log_show                ,
                                log_file                ,
                                log_size                )


    def dec_simple_simple(self                      ,
                   log_show     =   "screen"        ,
                   log_file     =   ""              ,
                   log_size     =   1000000         ):
        """ Devuelve un decorado simple
            #-- texto    [valor]
            #----------------------------------
        """
        cls = "------"
        mth = "------"


        self.loglight(  self.lines              , 
                        self.lines              ,
                        cls                     ,
                        mth                     ,
                        log_show                ,
                        log_file                ,
                        log_size                )


    def dec_simple_double(self                     ,
                   log_show     =   "screen"        ,
                   log_file     =   ""              ,
                   log_size     =   1000000         ):
        """ Devuelve un decorado simple
            #-- texto    [valor]
            #==========================================
        """
        cls = "======"
        mth = "======"

        self.loglight(  self.dlines             , 
                        self.dlines             ,
                        cls                     ,
                        mth                     ,
                        log_show                ,
                        log_file                ,
                        log_size                )
              

    def dec_simple_alt(self                     ,
                   log_show     =   "screen"    ,
                   log_file     =   ""          ,
                   log_size     =   1000000     ):
        """ Devuelve un decorado simple
            #-- texto    [valor]
            #=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
        """
        cls = "=-=-=-"
        mth = "=-=-=-"

        self.loglight(  self.altlines           , 
                        self.altlines           ,
                        cls                     ,
                        mth                     ,
                        log_show                ,
                        log_file                ,
                        log_size                )

            

    def dec_simple_asc(self                     ,
                   log_show     =   "screen"    ,
                   log_file     =   ""          ,
                   log_size     =   1000000     ):
        """ Devuelve un decorado simple
            #-- texto    [valor]
            #******************************************
        """
        cls = "******"
        mth = "******"

        self.loglight(  self.ascline            , 
                        self.ascline            ,
                        cls                     ,
                        mth                     ,
                        log_show                ,
                        log_file                ,
                        log_size                )

    def sysver(self                             ,
               script_version   =   "0.0"       ,
               script_change    =   "130610"    ,
               arch_version     =   "0.0"       ,
               arch_change      =   "130610"    ):
        """ Imprime la informacion de version del script
        """
        self.Log("Post Process Information"             ,
               self.bline                               ,
               "double_alt"                             )                    

        self.Log("Script Version       :"               ,
               script_version                           , 
               "simple_simple"                          )

        self.Log("Script Date          :"               ,
               script_change                            , 
               "simple_simple"                          )

        self.Log("Architecture Version :"               ,
               arch_version                             , 
               "simple_simple"                          )

        self.Log("Architecture Date    :"               ,
               arch_change                              , 
               "simple_simple"                          )

            
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

## command             = "hola"
## log_level           = 90         
## log_class_level     = 0         
## log_show            = "screenandfile"        
## log_file            = "comandosos.dat"        
## log_size            = 2000

## ej = Log(command        ,
##          log_level      ,
##          log_class_level,
##          log_show       ,
##          log_file       ,       
##          log_size       )

## ej.Log("hola amigos",
##        "455"        ,
##        "double_alt" )

