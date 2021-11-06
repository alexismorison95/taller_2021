import { Router } from "express";
import { ListarEquipos } from "./equipo.controllers";

const cRouter = Router();

cRouter.get('/equipos', ListarEquipos);

export default cRouter;