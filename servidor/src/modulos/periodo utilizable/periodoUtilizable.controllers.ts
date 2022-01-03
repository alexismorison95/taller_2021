import { Request, Response } from "express";
import { QueryResult } from "pg";
import { ClientDB } from "../bbdd/db.connection";
import { SendError } from "../utils/utils";
import { PeriodoUtilizable } from "../../modelos/periodoUtilizable.model";


export async function ListarPeriodoUtilizables(req: Request, res: Response) {

    try {
        const db = ClientDB(req.session['rol']);

        // Consulta
        const cQuery: string = 'SELECT * FROM periodoutilizable;';

        let mDbResponse: QueryResult<PeriodoUtilizable> = await db.query( cQuery );

        // Envio respuesta al cliente
        res.status(200).json(mDbResponse.rows);
    } 
    catch (e) {
        SendError(e, res);
    }
}

export async function ListarPeriodoUtilizable(req: Request, res: Response) {

    try {
        const db = ClientDB(req.session['rol']);

        // Consulta
        const cQuery: string = 'SELECT * FROM periodoutilizable WHERE id = $1;';
        const cParams = [req.params.id];

        let mDbResponse: QueryResult<PeriodoUtilizable> = await db.query( cQuery, cParams );

        // Envio respuesta al cliente
        res.status(200).json(mDbResponse.rows[0]);
    } 
    catch (e) {
        SendError(e, res);
    }
}

export async function AltaPeriodoUtilizable(req: Request, res: Response) {

    const db = ClientDB(req.session['rol']);

    try {
        // Consulta
        const cQuery = 'SELECT * FROM AltaPeriodoUtilizable($1, $2, $3, $4);';
        const cParams = [
            req.body.fechaInicio, 
            req.body.fechaVencimiento,
            req.body.nroIngreso,
            req.body.idEquipo
        ];

        // Transacción
        await db.query('BEGIN;');

        let mDbResponse: QueryResult<PeriodoUtilizable> = await db.query( cQuery, cParams );

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

export async function BajaPeriodoUtilizable(req: Request, res: Response) {

    const db = ClientDB(req.session['rol']);

    try {
        // Consulta
        const cQuery = 'SELECT * FROM BajaPeriodoUtilizable($1);';
        const cParams = [req.params.id];

        // Transacción
        await db.query('BEGIN;');

        let mDbResponse: QueryResult<PeriodoUtilizable> = await db.query( cQuery, cParams );

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