export interface PeriodoUtilizable {
    id: number;
    activo: boolean;
    fechainicio: string;
    fechavencimiento: string;
    dias: number;
    ntoingreso: number;
    idequipo: number;
    nombre: string;
}

export interface AltaPeriodoUtilizable {
    fechainicio: string;
    fechavencimiento: string;
    ntoingreso: number;
    idequipo: number;
}