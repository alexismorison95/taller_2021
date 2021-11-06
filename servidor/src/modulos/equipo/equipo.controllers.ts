import { Request, Response } from "express";
import { ClientDB } from "../bbdd/db.connection";
import { SendError } from "../utils/utils";


export async function ListarEquipos(req: Request, res: Response) {

    try {
        const db = ClientDB(req.session['rol']);

        // Consulta
        const respuesta = await db.query('select * from equipo;');

        // Envio respuesta al cliente
        res.status(200).json(respuesta.rows);
    } 
    catch (e) {
        SendError(e, res);
    }

}