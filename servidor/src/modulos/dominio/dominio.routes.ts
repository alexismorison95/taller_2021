import { Router } from "express";
import { AltaDominio, EditarDominio, ListarDominio, ListarDominios } from "./dominio.controllers";

const cRouter = Router();

cRouter.get('/dominio', ListarDominios);
cRouter.get('/dominio/:patente', ListarDominio);
cRouter.post('/dominio', AltaDominio);
cRouter.put('/dominio', EditarDominio);

export default cRouter;