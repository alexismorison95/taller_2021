import { Router } from "express";
import { AltaConductor, EditarConductor, ListarConductor, ListarConductores } from "./conductor.controllers";

const cRouter = Router();

cRouter.get('/conductor', ListarConductores);
cRouter.get('/conductor/:dni', ListarConductor);
cRouter.post('/conductor', AltaConductor);
cRouter.put('/conductor', EditarConductor);

export default cRouter;