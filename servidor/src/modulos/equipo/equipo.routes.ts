import { Router } from "express";
import { ListarEquipos, AltaEquipo, EditarEquipo, BajaEquipo, ListarEquiposPeriodoUtilizable } from "./equipo.controllers";

const cRouter = Router();

cRouter.get('/equipo', ListarEquipos);
cRouter.get('/equipo-periodoutilizable', ListarEquiposPeriodoUtilizable);
cRouter.post('/equipo', AltaEquipo);
cRouter.put('/equipo', EditarEquipo);
cRouter.delete('/equipo/:id', BajaEquipo);

export default cRouter;