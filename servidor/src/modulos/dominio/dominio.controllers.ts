import { Request, Response } from "express";
import { QueryResult } from "pg";
import { ClientDB } from "../bbdd/db.connection";
import { SendError } from "../utils/utils";
import { Dominio } from "../../modelos/dominio.model";


export async function ListarDominios(req: Request, res: Response) {

    try {
        const db = ClientDB(req.session['rol']);

        // Consulta
        const cQuery: string = 'SELECT * FROM dominio;';

        let mDbResponse: QueryResult<Dominio> = await db.query( cQuery );

        // Envio respuesta al cliente
        res.status(200).json(mDbResponse.rows);
    } 
    catch (e) {
        SendError(e, res);
    }
}

export async function ListarDominio(req: Request, res: Response) {

    try {
        const db = ClientDB(req.session['rol']);

        // Consulta
        const cQuery: string = 'SELECT * FROM dominio WHERE patente = $1;';
        const cParams = [req.params.patente];

        let mDbResponse: QueryResult<Dominio> = await db.query( cQuery, cParams );

        // Envio respuesta al cliente
        res.status(200).json(mDbResponse.rows[0]);
    } 
    catch (e) {
        SendError(e, res);
    }
}

export async function AltaDominio(req: Request, res: Response) {

    const db = ClientDB(req.session['rol']);

    try {
        // Consulta
        const cQuery = 'SELECT * FROM AltaDominio($1, $2);';
        const cParams = [
            req.body.patente, 
            req.body.descripcion
        ];

        // Transacción
        await db.query('BEGIN;');

        let mDbResponse: QueryResult<Dominio> = await db.query( cQuery, cParams );

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

export async function EditarDominio(req: Request, res: Response) {

    const db = ClientDB(req.session['rol']);

    try {
        // Consulta
        const cQuery = 'SELECT * FROM ModificarDominio($1, $2);';
        const cParams = [
            req.body.patente, 
            req.body.descripcion
        ];

        // Transacción
        await db.query('BEGIN;');

        let mDbResponse: QueryResult<Dominio> = await db.query( cQuery, cParams );

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