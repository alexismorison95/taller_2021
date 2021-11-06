import { Request, Response } from "express";
import { QueryResult } from "pg";
import { AuthenticatedUser } from "../../modelos/auth.model";
import { ClientDB } from "../bbdd/db.connection";
import { SendError } from "../utils/utils";


export async function Login(req: Request, res: Response) {

    try {
        const db = ClientDB('login_user');

        // Consulta
        const cQuery: string = 'select * from usuario where nombreusuario = $1 AND contrasenia = $2;';
        const cParams = [ req.body.name, req.body.password ];

        let mDbResponse: QueryResult<AuthenticatedUser> = await db.query( cQuery,cParams );

        // Si trajo un usuario carga su id y rol en la sesion y envia al cliente el usuario
        if (mDbResponse.rows[0]) {

            // Transformo la respuesta para no enviar la contraseña
            const cAuthenticatedUser: AuthenticatedUser =  {
                id: mDbResponse.rows[0].id,
                nombrereal: mDbResponse.rows[0].nombrereal,
                nombreusuario: mDbResponse.rows[0].nombreusuario,
                tipousuario: mDbResponse.rows[0].tipousuario 
            };
            
            // Guardo en la sesion los datos del usuario
            req.session['id_usuario'] = cAuthenticatedUser.id;
            req.session['rol'] = cAuthenticatedUser.tipousuario;

            console.log("Logueado en el sistema como", cAuthenticatedUser.tipousuario, "- id de usuario", cAuthenticatedUser.id);

            // Envio al cliente los datos del usuario logueado
            res.status(200).json(cAuthenticatedUser);
        }
        else {
            // Envio al cliente que el usuario o contraseña no correpsonden
            res.status(404).json({res: "Usuario o contraseña no válidos."});
        }
    }
    catch (e) {
        SendError(e, res);
    }
}

export function Logout(req: Request, res: Response) {

    // Destruyo la sesión actual
    req.session.destroy(err => {

        if (err) { 
            console.log(err); 
            res.status(500).json({res: "Error interno del servidor." + err});
        }
    });

    res.status(200).json({res: "Sesión cerrada"});
}