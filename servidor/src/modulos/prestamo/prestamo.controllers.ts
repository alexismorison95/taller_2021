import { Request, Response } from "express";
import { QueryResult } from "pg";
import { ClientDB } from "../bbdd/db.connection";
import { SendError } from "../utils/utils";
import { Prestamo } from "../../modelos/prestamo.model";


export async function ListarPrestamos(req: Request, res: Response) {

    try {
        const db = ClientDB(req.session['rol']);

        // Consulta
        const cQuery: string = 'SELECT * FROM prestamo;';

        let mDbResponse: QueryResult<Prestamo> = await db.query( cQuery );

        // Envio respuesta al cliente
        res.status(200).json(mDbResponse.rows);
    } 
    catch (e) {
        SendError(e, res);
    }
}

export async function ListarPrestamo(req: Request, res: Response) {

    try {
        const db = ClientDB(req.session['rol']);

        // Consulta
        const cQuery: string = 'SELECT * FROM prestamo WHERE id = $1;';
        const cParams = [req.params.id];

        let mDbResponse: QueryResult<Prestamo> = await db.query( cQuery, cParams );

        // Envio respuesta al cliente
        res.status(200).json(mDbResponse.rows[0]);
    } 
    catch (e) {
        SendError(e, res);
    }
}

export async function AltaPrestamo(req: Request, res: Response) {

    const db = ClientDB(req.session['rol']);

    try {
        // Consulta
        const cQuery = 'SELECT * FROM AltaPrestamo($1, $2, $3, $4, $5);';
        const cParams = [
            req.body.fechaPrestamo, 
            req.body.horaPrestamo,
            req.body.nroInicial,
            req.body.idExaminador,
            req.body.idEquipo
        ];

        // Transacción
        await db.query('BEGIN;');

        let mDbResponse: QueryResult<Prestamo> = await db.query( cQuery, cParams );

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

export async function BajaPrestamo(req: Request, res: Response) {

    const db = ClientDB(req.session['rol']);

    try {
        // Consulta
        const cQuery = 'SELECT * FROM BajaPrestamo($1, $2, $3, $4);';
        const cParams = [
            req.body.id, 
            req.body.fechaDevolucion,
            req.body.horaDevolucion,
            req.body.nroDevolucion
        ];

        // Transacción
        await db.query('BEGIN;');

        let mDbResponse: QueryResult<Prestamo> = await db.query( cQuery, cParams );

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