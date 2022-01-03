// Importo modulos
import express from "express";
import morgan from "morgan";
import cors from "cors";
import session from "express-session";
import connectPgSimple from "connect-pg-simple";

// Importo conexion BBDD
import { ClientDB } from "./modulos/bbdd/db.connection";

// Importo funciones
import { Auth } from "./modulos/utils/utils";

// Importo rutas
import mAuthRoutes from "./modulos/auth/auth.routes";
import mEquipoRoutes from "./modulos/equipo/equipo.routes";
import mConductorRoutes from "./modulos/conductor/conductor.routes";
import mDominioRoutes from "./modulos/dominio/dominio.routes";
import mExaminadorRoutes from "./modulos/examinador/examinador.routes";


// Inicializaciones
const app = express();


// Configuraciones
app.set('port', process.env.PORT || 3000);


// Sesión
const pgSession = connectPgSimple(session);
const pgPool = ClientDB('sesion_user');
const cSession = session({
    store: new pgSession({
        pool: pgPool,
        tableName: 'sesion'
    }),
    secret: 'mi cadena secreta',
    resave: false,
    saveUninitialized: false,
    cookie: { maxAge: 300 * 60 * 1000 } // 30 minutos
});


// Middlewares 
app.use(morgan('dev'));
app.use(express.json());
app.use(cors({ origin: 'http://localhost:4200', credentials: true })); // Desarrollo
app.use(cSession);

// Rutas
app.use('/api/', mAuthRoutes);
app.use('/api/', Auth, mEquipoRoutes);
app.use('/api/', Auth, mConductorRoutes);
app.use('/api/', Auth, mDominioRoutes);
app.use('/api/', Auth, mExaminadorRoutes);


export default app;