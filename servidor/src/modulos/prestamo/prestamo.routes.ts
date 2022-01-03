import { Router } from "express";
import { AltaPrestamo, BajaPrestamo, ListarPrestamo, ListarPrestamos } from "./prestamo.controllers";

const cRouter = Router();

cRouter.get('/prestamo', ListarPrestamos);
cRouter.get('/prestamo/:id', ListarPrestamo);
cRouter.put('/prestamo', BajaPrestamo);
cRouter.post('/prestamo', AltaPrestamo);

export default cRouter;