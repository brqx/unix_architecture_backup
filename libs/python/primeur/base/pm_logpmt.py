#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
Created on Wed Apr 17 15:27:05 2013

@author: Ricardo Cabello
"""
#- Librerias Python
import os

#- Librerias Primeur
import pm_logger

def log_fullpath(cadena, 
                 LOG_SHOW  = "",
                 archivo_entrada = "archivo_defecto_full.dat", 
                 modo_fichero = "a"):
    """ Log generico que prepara el path absoluto en relacion a la 
        instalacion de python
    """    

    sp_path=os.environ["SPAZIO"]    #- Devuelve la variable

    if not sp_path == "":
        sep = "/"                       #- Separador para unix
        
        ajuste_python = sep + "log" + sep + "python" + sep
        ## /log/python/
    
        ruta_completa = sp_path + ajuste_python + archivo_entrada
    
    
        pm_logger.flog(cadena, LOG_SHOW , ruta_completa, modo_fichero)     
    else:
        cadena_error="Variable SPAZIO no definida"
        pm_logger.flog(cadena_error, LOG_SHOW , ruta_completa, modo_fichero)     


def log_mod(cadena,
            modulo= "x", linea = "y", 
            LOG_SHOW  = "",
            archivo_entrada = "archivo_defecto_mod.dat", 
            modo_fichero = "a"):
    """ Funcion encargada de formatear la cadena con el modulo y la linea
        donde ocurre el error o la traza
        Argumentos:
        - cadena : Literal que se escribe en la traza
        - LOG_SHOW: Switch que usamos para impresion en pantalla
        - modulo  : nombre del programa de python donde se ha lanzado la traza
        - archivo entrada : Fichero donde se va a escribir la traza
        - modo_fichero    : Modo en el que se abre el archivo de trazas
    """    

    sep = ":"
    cadena_formateada = cadena
    cadena_formateada = cadena_formateada + sep + modulo
    cadena_formateada = cadena_formateada + sep + linea 
    
    log_fullpath(cadena_formateada,LOG_SHOW, 
                 archivo_entrada, modo_fichero)    


def log_cmd(cadena,  
            modulo = "x", linea = "y", 
            LOG_SHOW  = "",
            archivo_entrada = "comandos.lcm", modo_fichero = "a"):
    """ Log de comandos. Escribira todos los comandos lanzados.
    """    

    log_mod(cadena, modulo, linea, LOG_SHOW, archivo_entrada, modo_fichero)    


def log_err(cadena, 
            modulo= "x", linea = "y", 
            LOG_SHOW  = "",
            archivo_entrada = "error.err", 
            modo_fichero = "a"):
    """ Log de errores.
    """    
    log_mod(cadena, modulo, linea, LOG_SHOW, archivo_entrada, modo_fichero)    


def log_his(cadena = "Inicio Comando", 
            modulo= "x", linea = "y", 
            LOG_SHOW  = "",
            archivo_entrada = "historico.hst", 
            modo_fichero = "a"):
    """ Log historico de lanzamientos.
    """    

    log_mod(cadena, modulo, linea, LOG_SHOW, archivo_entrada, modo_fichero)    


def log_trc(cadena, 
            modulo= "x", linea = "y", 
            LOG_SHOW  = "",
            archivo_entrada = "log.trc", 
            modo_fichero = "a"):
    """ Log Trace. Escribira cada una de las operaciones
    """    

    log_mod(cadena, modulo, linea, LOG_SHOW, archivo_entrada, modo_fichero)    

    
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=
#              I N I C I O   P R O G R A M A
#--==--==--==--==--==--==--==--==--==--==--==--==--==--==--=




