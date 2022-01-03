import { Request, Response } from "express";
import { QueryResult } from "pg";
import { ClientDB } from "../bbdd/db.connection";
import { SendError } from "../utils/utils";
import { Conductor } from "../../modelos/conductor.model";


export async function ListarConductores(req: Request, res: Response) {

    try {
        const db = ClientDB(req.session['rol']);

        // Consulta
        const cQuery: string = 'SELECT * FROM conductor;';

        let mDbResponse: QueryResult<Conductor> = await db.query( cQuery );

        // Envio respuesta al cliente
        res.status(200).json(mDbResponse.rows);
    } 
    catch (e) {
        SendError(e, res);
    }
}

export async function ListarConductor(req: Request, res: Response) {

    try {
        const db = ClientDB(req.session['rol']);

        // Consulta
        const cQuery: string = 'SELECT * FROM conductor WHERE dni = $1;';
        const cParams = [req.params.dni];

        let mDbResponse: QueryResult<Conductor> = await db.query( cQuery, cParams );

        // Envio respuesta al cliente
        res.status(200).json(mDbResponse.rows[0]);
    } 
    catch (e) {
        SendError(e, res);
    }
}

export async function AltaConductor(req: Request, res: Response) {

    const db = ClientDB(req.session['rol']);

    try {
        // Consulta
        const cQuery = 'SELECT * FROM AltaConductor($1, $2, $3);';
        const cParams = [
            req.body.dni, 
            req.body.nombre, 
            req.body.apellido
        ];

        // Transacción
        await db.query('BEGIN;');

        let mDbResponse: QueryResult<Conductor> = await db.query( cQuery, cParams );

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

export async function EditarConductor(req: Request, res: Response) {

    const db = ClientDB(req.session['rol']);

    try {
        // Consulta
        const cQuery = 'SELECT * FROM ModificarConductor($1, $2, $3);';
        const cParams = [
            req.body.dni, 
            req.body.nombre, 
            req.body.apellido
        ];

        // Transacción
        await db.query('BEGIN;');

        let mDbResponse: QueryResult<Conductor> = await db.query( cQuery, cParams );

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