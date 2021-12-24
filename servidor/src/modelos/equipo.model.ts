export interface Equipo {
    id: number;
    nombre: string;
    activo: boolean;
    nroactual: number;
}

export interface EquipoPeriodoUtilizable {
    id: number;
    nombre: string;
    activo: boolean;
    nroactual: number;
    fechavencimiento: Date;
}