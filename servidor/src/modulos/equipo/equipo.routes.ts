import { Router } from "express";
import { ListarEquipos } from "./equipo.controllers";

const cRouter = Router();

cRouter.get('/equipos/listar', ListarEquipos);

export default cRouter;