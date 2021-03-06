import { Request, Response } from "express";
import { QueryResult } from "pg";
import { AuthenticatedUser } from "../../modelos/usuario.model";
import { ClientDB } from "../bbdd/db.connection";
import { SendError } from "../utils/utils";


export async function Login(req: Request, res: Response) {

    try {
        const db = ClientDB('login_user');

        // Consulta
        const cQuery: string = 'SELECT id, nombrereal, nombreusuario, tipousuario FROM usuario WHERE nombreusuario = $1 AND contrasenia = $2;';
        const cParams: string[] = [ req.body.userName, req.body.password ];

        let mDbResponse: QueryResult<AuthenticatedUser> = await db.query( cQuery, cParams );

        // Si trajo un usuario carga su id y rol en la sesion y envia al cliente el usuario
        if (mDbResponse.rows[0]) {
            
            // Guardo en la sesion los datos del usuario
            req.session['id_usuario'] = mDbResponse.rows[0].id;
            req.session['rol'] = mDbResponse.rows[0].tipousuario;

            console.log("Logueado en el sistema como", mDbResponse.rows[0].tipousuario, "- id de usuario", mDbResponse.rows[0].id);

            // Envio al cliente los datos del usuario logueado
            res.status(200).json(mDbResponse.rows[0]);
        }
        else {
            // Envio al cliente que el usuario o contraseña no correpsonden
            res.status(403).json({ err: "Usuario o contraseña no válidos." });
        }
    }
    catch (e) {
        SendError(e, res);
    }
}

export function Logout(req: Request, res: Response) {

    // Destruyo la sesión actual
    req.session.destroy(error => {

        if (error) { 
            console.log(error); 
            res.status(500).json({ err: "Error interno del servidor." + error });
        }
    });

    res.status(200).json({ res: "Sesión cerrada" });
}