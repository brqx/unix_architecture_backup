#!/usr/bin/python
# -*- coding: utf-8 -*-
"""
===========================================================
@author: Ricardo Cabello
@version: 0.0.3
-----------------------------------------------------------
+ Clases definidas : 
--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
- Log   : Clase de gestion de logs
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
+ Process Status  : [130517]
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



    #------------------------------------------------------
    #---------------------- CONSTRUCTOR -------------------
    #------------------------------------------------------

    def __init__(self                           , 
                 comando            = ""        ,
                 log_level          = 0         ,
                 log_class_level    = 0         ,
                 log_show           = "screen"  ,
                 log_file           = ""        ):
        """ De momento sin argumentos
        """
        self.set_log_cls(comando)

        LogLight.__init__(self                  , 
                        log_level               ,
                        log_class_level         ,
                        log_show                ,
                        log_file                )                


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
            self.tmp        = "c:\\temp\\"
            self.slash      = "\\"


        elif sistemaop == "posix":
            self.pmt_ind    = "-"
            self.sys_ind    = "unix"
            self.tmp        = "/tmp"
            self.sys_plt    = sys.platform
            self.slash      = "/"


        #-Configuracion de la variable de Spazio
        self.spazio_ini  =   self.spazio + self.slash + "spazio.ini"


        # -Ajuste a nivel de variable spazio.ini
        #  No se puede hacer aqui al usar una clase
        #  de nivel superior en la herencia

    def Log(self                            ,
              texto         =   ""          ,
              valor         =   ""          ,
              dec           =   "normal"    ,
              cls           =   ""          ,
              mth           =   ""          ):


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
        log_file        = self.get_log_file()
            
        self.log(texto              , 
                 valor              ,
                 cls                ,
                 mth                ,        
                 dec                ,
                 log_level          ,
                 log_class_level    ,
                 log_show           ,
                 log_file           )        


    def log(self                        , 
            texto           = ""        , 
            valor           = ""        ,
            cls             = ""        ,
            mth             = ""        ,
            dec             = "normal"  ,
            log_level       = 0         ,
            log_class_level = 0         ,
            sw_pantalla     = "screen"  ,
            fichero_log     = ""
            ):
        """ Necesitamos que se imprima pero justificando los valores
            y tambien justificando la linea
            Parametros:
            - texto     : texto de la expresion
            - valor     : valor de la expresion
            - cls-mth   : Clase y metodo
            - sw_pantalla (screen)
            - dec       : Decorado ( tipo de presentacion)
        """

        ##- Esto no es correcto porque siempre va a coger
        #   los de la clase log
#        log_level       = self.get_log_level()
#        log_class_level = self.get_log_class_level()

        
        if log_level > log_class_level:

        #------------------------------------------------------
        #-- D E C O R A D O S   S I M P L E S
        #------------------------------------------------------
            if dec == "normal":
            #-- texto    [valor]
    
                self.loglight(
                        texto           , 
                        valor      ,
                        cls        ,
                        mth         ,
                        sw_pantalla ,
                        fichero_log )

            elif dec == "simple_simple":
            #-- texto    [valor]
            #--------------------------------

                self.loglight(
                        texto           , 
                        valor      ,
                        cls        ,
                        mth         ,
                        sw_pantalla ,
                        fichero_log )

                self.dec_simple_simple     (
                        sw_pantalla ,
                        fichero_log )

            elif dec == "simple_double":
            #-- texto    [valor]
            #=================================

                self.loglight(
                        texto           , 
                        valor      ,
                        cls        ,
                        mth         ,
                        sw_pantalla ,
                        fichero_log )

                self.dec_simple_double     (
                        sw_pantalla ,
                        fichero_log )

            elif dec == "simple_alt":
            #-- texto    [valor]
            #=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
                self.loglight(
                        texto           , 
                        valor      ,
                        cls        ,
                        mth         ,
                        sw_pantalla ,
                        fichero_log )

                self.dec_simple_alt     (
                        sw_pantalla ,
                        fichero_log )

            elif dec == "simple_asc":
            #-- texto    [valor]
            #**********************************

                self.loglight(
                        texto           , 
                        valor      ,
                        cls        ,
                        mth         ,
                        sw_pantalla ,
                        fichero_log )

                self.dec_simple_asc     (
                        sw_pantalla ,
                        fichero_log )


        #------------------------------------------------------
        #-- R E C U A D R O S    S I M P L E S
        #------------------------------------------------------

            elif dec == "square_simple":
            #--------------------------------
            #-- texto    [valor]
            #--------------------------------

                self.dec_simple_simple     (
                        sw_pantalla ,
                        fichero_log )

                self.loglight(
                        texto           , 
                        valor      ,
                        cls        ,
                        mth         ,
                        sw_pantalla ,
                        fichero_log )

                self.dec_simple_simple     (
                        sw_pantalla ,
                        fichero_log )


            elif dec == "square_double":
            #================================
            #-- texto    [valor]
            #================================

                self.dec_simple_double     (
                        sw_pantalla ,
                        fichero_log )

                self.loglight(
                        texto           , 
                        valor      ,
                        cls        ,
                        mth         ,
                        sw_pantalla ,
                        fichero_log )

                self.dec_simple_double     (
                        sw_pantalla ,
                        fichero_log )


            elif dec == "square_alt":
            #--------------------------------
            #-- texto    [valor]
            #--------------------------------

                self.dec_simple_alt     (
                        sw_pantalla ,
                        fichero_log )

                self.loglight(
                        texto           , 
                        valor      ,
                        cls        ,
                        mth         ,
                        sw_pantalla ,
                        fichero_log )

                self.dec_simple_alt     (
                        sw_pantalla ,
                        fichero_log )


        #------------------------------------------------------
        #-- D E C O R A D O S   D O B L E S 
        #------------------------------------------------------

            elif dec == "double_simple":
            #-- texto    []
            #--------------------------------
            #-- valor            
            

                self.loglight(
                        texto           , 
                        self.bline      ,
                        cls        ,
                        mth         ,
                        sw_pantalla ,
                        fichero_log )

                self.dec_simple_simple     (
                        sw_pantalla ,
                        fichero_log )

                self.loglight(
                        valor           , 
                        self.bline      ,
                        cls        ,
                        mth         ,
                        sw_pantalla ,
                        fichero_log )


            elif dec == "double_alt":
            #--------------------------------
            #-- texto    []
            #=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
            #-- valor            
            #--------------------------------
            

                self.dec_simple_simple     (
                        sw_pantalla ,
                        fichero_log )

                self.loglight(
                        texto           , 
                        self.bline      ,
                        cls        ,
                        mth         ,
                        sw_pantalla ,
                        fichero_log )

                self.dec_simple_alt     (
                        sw_pantalla ,
                        fichero_log )

                self.loglight(
                        valor           , 
                        self.bline      ,
                        cls        ,
                        mth         ,
                        sw_pantalla ,
                        fichero_log )

                self.dec_simple_simple     (
                        sw_pantalla ,
                        fichero_log )


            elif dec == "double_double":
            #--------------------------------
            #-- texto    []
            #================================
            #-- valor            
            #--------------------------------
            

                self.dec_simple_simple     (
                        sw_pantalla ,
                        fichero_log )

                self.loglight(
                        texto           , 
                        self.bline      ,
                        cls        ,
                        mth         ,
                        sw_pantalla ,
                        fichero_log )

                self.dec_simple_double     (
                        sw_pantalla ,
                        fichero_log )

                self.loglight(
                        valor           , 
                        self.bline      ,
                        cls        ,
                        mth         ,
                        sw_pantalla ,
                        fichero_log )

                self.dec_simple_simple     (
                        sw_pantalla ,
                        fichero_log )


    def dec_simple_simple(self                     ,
                   sw_pantalla = "screen"   ,
                   fichero_log = ""         ):
        """ Devuelve un decorado simple
            #-- texto    [valor]
            #----------------------------------
        """
        cls = "------"
        mth = "------"

        self.loglight(
             self.lines     , 
             self.lines     ,
             cls            ,
             mth            ,
             sw_pantalla    ,
             fichero_log    )


    def dec_simple_double(self                     ,
                   sw_pantalla = "screen"   ,
                   fichero_log = ""         ):
        """ Devuelve un decorado simple
            #-- texto    [valor]
            #==========================================
        """
        cls = "======"
        mth = "======"

        self.loglight(
             self.dlines    , 
             self.dlines    ,
             cls            ,
             mth            ,
             sw_pantalla    ,
             fichero_log    )
                

    def dec_simple_alt(self                     ,
                   sw_pantalla = "screen"   ,
                   fichero_log = ""         ):
        """ Devuelve un decorado simple
            #-- texto    [valor]
            #=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
        """
        cls = "=-=-=-"
        mth = "=-=-=-"

        self.loglight(
             self.altlines  , 
             self.altlines  ,
             cls            ,
             mth            ,
             sw_pantalla    ,
             fichero_log    )
            

    def dec_simple_asc(self                     ,
                   sw_pantalla = "screen"   ,
                   fichero_log = ""         ):
        """ Devuelve un decorado simple
            #-- texto    [valor]
            #******************************************
        """
        cls = "******"
        mth = "******"

        self.loglight(
             self.ascline     , 
             self.ascline     ,
             cls            ,
             mth            ,
             sw_pantalla    ,
             fichero_log    )
            
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=

## command            = "hola"
## log_level          = 90         
## log_class_level    = 0         
## log_show           = "screenandfile"        
## log_file           = "comandosos.dat"        

## ej = Log(command        ,
##          log_level      ,
##          log_class_level,
##          log_show       ,
##          log_file       )

## ej.Log("hola amigos","455")

## ejl.log(cad1, val1)
