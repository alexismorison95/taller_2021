import { Request, Response, NextFunction } from "express";
import { Pool, QueryResult } from "pg";


/**
 * Función para mostrar un error por consola y enviarla al cliente.
 * Esta funcion se llama en la parte Catch de los Try Catch.
 * @param e 
 * @param res 
 */
export function SendError(e: any, res: Response): void {

    let mError = (e as Error).message;
    console.log(mError);
    
    // Envio el error al cliente
    res.status(500).json({res: "Error interno del servidor." + mError});
}

/**
 * Función para autenticar que un usuario tenga una sesión activa si quiere navegar 
 * entre las rutas del servidor.
 * @param req 
 * @param res 
 * @param next 
 */
export function Auth(req: Request, res: Response, next: NextFunction) {
    
    if (req.session['id_usuario']) {
        return next();
    }
    else {
        return res.status(401).json({res: "Debe iniciar sesión"});
    }
}