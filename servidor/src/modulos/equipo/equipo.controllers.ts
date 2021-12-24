import { Request, Response } from "express";
import { QueryResult } from "pg";
import { Equipo } from "../../modelos/equipo.model";
import { ClientDB } from "../bbdd/db.connection";
import { SendError } from "../utils/utils";


export async function ListarEquipos(req: Request, res: Response) {

    try {
        const db = ClientDB(req.session['rol']);

        // Consulta
        const cQuery: string = 'SELECT * FROM equipo ORDER BY id;';

        let mDbResponse: QueryResult<Equipo> = await db.query( cQuery );

        // Envio respuesta al cliente
        res.status(200).json(mDbResponse.rows);
    } 
    catch (e) {
        SendError(e, res);
    }
}

export async function AltaEquipo(req: Request, res: Response) {

    const db = ClientDB(req.session['rol']);

    try {
        // Transacción
        await db.query('BEGIN;');
        const cQuery = 'SELECT * FROM altaequipo($1);';
        const cParams = [
            req.body.nombre
        ];
        let mDbResponse: QueryResult<Equipo> = await db.query( cQuery, cParams );
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