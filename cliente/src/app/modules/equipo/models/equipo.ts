export interface Equipo {
    id: number;
    nombre: string;
    activo: boolean;
    estado: string;
    nroactual: number;
}

export interface EquipoPeriodoUtilizable {
    id: number;
    nombre: string;
    activo: boolean;
    estado: string;
    nroactual: number;
    fechavencimiento?: Date;
    fecha: string;
}

export interface NuevoEquipo {
    nombre: string;
}

export interface EditarEquipo {
    id: number;
    nombre: string;
}