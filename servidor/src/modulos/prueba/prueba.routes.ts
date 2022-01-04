import { Router } from "express";
import { AltaPrueba, ListarPruebas, ListarPruebasNoVerificadas, VerificarPrueba } from "./prueba.controllers";

const cRouter = Router();

cRouter.post('/prueba', ListarPruebas);
cRouter.get('/prueba/no-verificadas', ListarPruebasNoVerificadas);
cRouter.put('/prueba', VerificarPrueba);
cRouter.post('/prueba/alta', AltaPrueba);

export default cRouter;