import { Request, Response } from "express";
import { QueryResult } from "pg";
import { ClientDB } from "../bbdd/db.connection";
import { SendError } from "../utils/utils";
import { Prueba } from "../../modelos/prueba.model";


/**
 * Lista las pruebas por fecha, permitiendo diferenciar por verificadas o no
 */
export async function ListarPruebas(req: Request, res: Response) {

    try {
        const db = ClientDB(req.session['rol']);

        // Consulta
        const cQuery: string = 'SELECT * FROM ReporteEntreFechas($1, $2, $3)';
        const cParams = [
            req.body.fechaDesde,
            req.body.fechaHasta,
            req.body.verificado
        ];

        let mDbResponse: QueryResult<Prueba> = await db.query( cQuery, cParams );

        // Envio respuesta al cliente
        res.status(200).json(mDbResponse.rows);
    } 
    catch (e) {
        SendError(e, res);
    }
}

/**
 * Lista las pruebas no verificadas
 */
export async function ListarPruebasNoVerificadas(req: Request, res: Response) {
    
    try {
        const db = ClientDB(req.session['rol']);

        // Consulta
        const cQuery: string = 'SELECT * FROM prueba WHERE verificado = false ORDER BY Fecha';

        let mDbResponse: QueryResult<Prueba> = await db.query( cQuery );

        // Envio respuesta al cliente
        res.status(200).json(mDbResponse.rows);
    } 
    catch (e) {
        SendError(e, res);
    }
}

/**
 * Alta de una nueva prueba, es necesario insertar conductor y dominio previamente
 */
export async function AltaPrueba(req: Request, res: Response) {
    
    const db = ClientDB(req.session['rol']);

    try {
        // Consulta
        const cQuery = 'SELECT * FROM AltaPrueba($1, $2, $3, $4, $5, $6, $7, $8, $9);';
        const cParams = [
            req.body.fecha, 
            req.body.hora,
            req.body.nroMuestra,
            req.body.resultado,
            req.body.nroActa,
            req.body.nroRetencion,
            req.body.dniConductor,
            req.body.idDominio,
            req.body.idPrestamo
        ];

        // Transacción
        await db.query('BEGIN;');

        let mDbResponse: QueryResult<Prueba> = await db.query( cQuery, cParams );

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

/**
 * Verifica una prueba, aceptandola o rechazandola
 */
export async function VerificarPrueba(req: Request, res: Response) {

    const db = ClientDB(req.session['rol']);

    try {
        // Consulta
        const cQuery = 'SELECT * FROM ModificarPrueba($1, $2, $3, $4);';
        const cParams = [
            req.body.id, 
            req.body.rechazado,
            req.body.descripcionRechazo,
            req.body.idVerificador
        ];

        // Transacción
        await db.query('BEGIN;');

        let mDbResponse: QueryResult<Prueba> = await db.query( cQuery, cParams );

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