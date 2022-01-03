import { Router } from "express";
import { AltaPeriodoUtilizable, BajaPeriodoUtilizable, ListarPeriodoUtilizable, ListarPeriodoUtilizables } from "./periodoUtilizable.controllers";

const cRouter = Router();

cRouter.get('/periodoutilizable', ListarPeriodoUtilizables);
cRouter.get('/periodoutilizable/:id', ListarPeriodoUtilizable);
cRouter.put('/periodoutilizable/:id', BajaPeriodoUtilizable);
cRouter.post('/periodoutilizable', AltaPeriodoUtilizable);

export default cRouter;