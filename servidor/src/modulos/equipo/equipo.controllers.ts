import { Request, Response } from "express";
import { QueryResult } from "pg";
import { Equipo, EquipoPeriodoUtilizable } from "../../modelos/equipo.model";
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
        // Consulta
        const cQuery = 'SELECT * FROM AltaEquipo($1);';
        const cParams = [
            req.body.nombre
        ];

        // Transacción
        await db.query('BEGIN;');

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

export async function EditarEquipo(req: Request, res: Response) {

    const db = ClientDB(req.session['rol']);

    try {
        // Consulta
        const cQuery = 'SELECT * FROM ModificarEquipo($1, $2);';
        const cParams = [
            req.body.id,
            req.body.nombre
        ];

        // Transacción
        await db.query('BEGIN;');

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

export async function BajaEquipo(req: Request, res: Response) {

    const db = ClientDB(req.session['rol']);

    try {
        // Consulta
        const cQuery = 'SELECT * FROM BajaEquipo($1);';
        const cParams = [
            req.params.id
        ];

        // Transacción
        await db.query('BEGIN;');

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

// Equipo + periodo utilizable
export async function ListarEquiposPeriodoUtilizable(req: Request, res: Response) {

    try {
        const db = ClientDB(req.session['rol']);

        // Consulta
        const cQuery: string =  'SELECT E.*, PU.fechavencimiento ' + 
                                'FROM equipo E ' +
                                'LEFT JOIN periodoutilizable PU ' +
                                'ON E.id = PU.idequipo ' +
                                'WHERE PU.activo = true ' +
                                'ORDER BY E.id;';

        let mDbResponse: QueryResult<EquipoPeriodoUtilizable> = await db.query( cQuery );

        // Envio respuesta al cliente
        res.status(200).json(mDbResponse.rows);
    } 
    catch (e) {
        SendError(e, res);
    }
}