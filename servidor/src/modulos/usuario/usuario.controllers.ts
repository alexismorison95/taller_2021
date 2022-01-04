import { Request, Response } from "express";
import { QueryResult } from "pg";
import { ClientDB } from "../bbdd/db.connection";
import { SendError } from "../utils/utils";
import { Usuario } from "../../modelos/usuario.model";

// TODO: Mejorar porque trae contrasenia.
//       Todo lo relacionado a usuario tiene que ir aca (cambiar contraseña, resetear contraseña, etc.)

export async function ListarUsuarios(req: Request, res: Response) {

    try {
        const db = ClientDB(req.session['rol']);

        // Consulta
        const cQuery: string = 'SELECT * FROM usuario ORDER BY nombrereal';

        let mDbResponse: QueryResult<Usuario> = await db.query( cQuery );

        // Envio respuesta al cliente
        res.status(200).json(mDbResponse.rows);
    } 
    catch (e) {
        SendError(e, res);
    }
}

export async function AltaUsuario(req: Request, res: Response) {
    
    const db = ClientDB(req.session['rol']);

    try {
        // Consulta
        const cQuery = 'SELECT * FROM AltaUsuario($1, $2, $3, $4);';
        const cParams = [
            req.body.nombreReal, 
            req.body.nombreUsuario,
            req.body.contrasenia,
            req.body.tipoUsuario
        ];

        // Transacción
        await db.query('BEGIN;');

        let mDbResponse: QueryResult<Usuario> = await db.query( cQuery, cParams );

        await db.query('COMMIT;');

        // Envio el resultado al cliente
        res.status(200).json(mDbResponse.rows[0]);
    } 
    catch (e) {
        // Error de la transaccion
        await db.query('ROLLBACK;');
        
        SendError(e, res);
    }
}

export async function BajaUsuario(req: Request, res: Response) {

    const db = ClientDB(req.session['rol']);

    try {
        // Consulta
        const cQuery = 'SELECT * FROM BajaUsuario($1);';
        const cParams = [
            req.params.id
        ];

        // Transacción
        await db.query('BEGIN;');

        let mDbResponse: QueryResult<Usuario> = await db.query( cQuery, cParams );

        await db.query('COMMIT;');

        // Envio el resultado al cliente
        res.status(200).json(mDbResponse.rows[0]);
    } 
    catch (e) {
        // Error de la transaccion
        await db.query('ROLLBACK;');

        SendError(e, res);
    }
}

export async function ModificarUsuario(req: Request, res: Response) {
    
    const db = ClientDB(req.session['rol']);

    try {
        // Consulta
        const cQuery = 'SELECT * FROM ModificarUsuario($1, $2, $3, $4, $5);';
        const cParams = [
            req.body.id, 
            req.body.nombreReal, 
            req.body.nombreUsuario,
            req.body.contrasenia,
            req.body.tipoUsuario
        ];

        // Transacción
        await db.query('BEGIN;');

        let mDbResponse: QueryResult<Usuario> = await db.query( cQuery, cParams );

        await db.query('COMMIT;');

        // Envio el resultado al cliente
        res.status(200).json(mDbResponse.rows[0]);
    } 
    catch (e) {
        // Error de la transaccion
        await db.query('ROLLBACK;');
        
        SendError(e, res);
    }
}