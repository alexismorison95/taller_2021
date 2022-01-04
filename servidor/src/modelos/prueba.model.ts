export interface Prueba {
    id: number;
    fecha: string;
    hora: string;
    nroMuestra: number;
    resultado: number;
    nroActa: number;
    nroRetencion: number;
    verificado: boolean;
    rechazado: boolean;
    descripcionrechazo: string;
    idverificador: number;
    dniconductor: string;
    iddominio: string;
    idprestamo: number;
}