import { Request, Response } from "express";
import { QueryResult } from "pg";
import { Equipo } from "../../modelos/equipo.model";
import { ClientDB } from "../bbdd/db.connection";
import { SendError } from "../utils/utils";


export async function ListarEquipos(req: Request, res: Response) {

    try {
        const db = ClientDB(req.session['rol']);

        // Consulta
        const cQuery: string = 'select * from equipo order by id;';

        let mDbResponse: QueryResult<Equipo> = await db.query( cQuery );

        // Envio respuesta al cliente
        res.status(200).json(mDbResponse.rows);
    } 
    catch (e) {
        SendError(e, res);
    }
}