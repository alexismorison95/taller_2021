import { Router } from "express";
import { Login, Logout } from "./auth.controllers";


const cRoutes = Router();

cRoutes.post('/login', Login);
cRoutes.get('/logout', Logout);

export default cRoutes;