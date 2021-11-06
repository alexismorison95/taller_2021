import { Pool } from "pg";
import { dataConnection } from "./db.data";


/**
 * Función que crea una conexion con postgreSQL por medio de un rol especificado.
 * Retorna un pool para poder realizar consultas a la base de datos.
 * @param pRol 
 */
export function ClientDB(pRol: string): Pool {

    // Creo una conexion y la retorno
    const cPool = new Pool({
        user: pRol,
        host: dataConnection.host,
        database: dataConnection.database,
        password: dataConnection.password,
        port: dataConnection.port
    });

    // Si se conecto correctamente
    cPool.on('connect', () => {
        console.log("Conectado a PostgreSQL como", pRol);
    });

    // Si hubo un error
    cPool.on('error', err => {
        console.log(err);
        process.exit(0);
    });

    return cPool;
}