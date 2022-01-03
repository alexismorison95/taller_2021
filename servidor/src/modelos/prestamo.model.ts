export interface Prestamo {
    id: number;
    activo: boolean;
    fechaPrestamo: string;
    horaPrestamo: string;
    nroInicial: number;
    fechaDevolucion: string;
    horaDevolucion: string;
    nroDevolucion: number;
    idExaminador: number;
    idEquipo: number;
}