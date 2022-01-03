import { Request, Response } from "express";
import { QueryResult } from "pg";
import { ClientDB } from "../bbdd/db.connection";
import { SendError } from "../utils/utils";
import { Examinador } from "../../modelos/examinador.mdel";


export async function ListarExaminadores(req: Request, res: Response) {

    try {
        const db = ClientDB(req.session['rol']);

        // Consulta
        const cQuery: string = 'SELECT * FROM examinador;';

        let mDbResponse: QueryResult<Examinador> = await db.query( cQuery );

        // Envio respuesta al cliente
        res.status(200).json(mDbResponse.rows);
    } 
    catch (e) {
        SendError(e, res);
    }
}

export async function ListarExaminador(req: Request, res: Response) {

    try {
        const db = ClientDB(req.session['rol']);

        // Consulta
        const cQuery: string = 'SELECT * FROM examinador WHERE id = $1;';
        const cParams = [req.params.id];

        let mDbResponse: QueryResult<Examinador> = await db.query( cQuery, cParams );

        // Envio respuesta al cliente
        res.status(200).json(mDbResponse.rows[0]);
    } 
    catch (e) {
        SendError(e, res);
    }
}

export async function BajaExaminador(req: Request, res: Response) {

    const db = ClientDB(req.session['rol']);

    try {
        // Consulta
        const cQuery = 'SELECT * FROM BajaExaminador($1);';
        const cParams = [req.params.id];

        // Transacción
        await db.query('BEGIN;');

        let mDbResponse: QueryResult<Examinador> = await db.query( cQuery, cParams );

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