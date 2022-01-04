export interface AuthenticatedUser {
    id: number;
    nombrereal: string;
    nombreusuario: string;
    tipousuario: string;
}

export interface Usuario {
    id: number;
    nombrereal: string;
    nombreusuario: string;
    contrasenia: string;
    tipousuario: string;
}