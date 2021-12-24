import { Router } from "express";
import { ListarEquipos, AltaEquipo } from "./equipo.controllers";

const cRouter = Router();

cRouter.get('/equipos', ListarEquipos);
cRouter.post('/equipos', AltaEquipo);

export default cRouter;