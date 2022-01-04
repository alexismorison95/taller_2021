import { Router } from "express";
import { AltaUsuario, BajaUsuario, ListarUsuarios, ModificarUsuario } from "./usuario.controllers";

const cRouter = Router();

cRouter.get('/usuario', ListarUsuarios);
cRouter.put('/usuario', ModificarUsuario);
cRouter.post('/usuario', AltaUsuario);
cRouter.delete('/usuario/:id', BajaUsuario);

export default cRouter;