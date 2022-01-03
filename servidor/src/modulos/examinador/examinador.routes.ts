import { Router } from "express";
import { BajaExaminador, ListarExaminador, ListarExaminadores } from "./examinador.controllers";

const cRouter = Router();

cRouter.get('/examinador', ListarExaminadores);
cRouter.get('/examinador/:id', ListarExaminador);
cRouter.put('/examinador/:id', BajaExaminador);

export default cRouter;