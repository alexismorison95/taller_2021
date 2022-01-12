import { formatDate } from '@angular/common';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { Equipo, EquipoPeriodoUtilizable } from '../models/equipo';

@Injectable({
  providedIn: 'root'
})
export class EquipoService {

  private readonly URL_API = 'http://localhost:3000/api/equipo';

  constructor(private http: HttpClient) { }

  GetEquipos(): Observable<EquipoPeriodoUtilizable[]> {

    return this.http.get<EquipoPeriodoUtilizable[]>(
      this.URL_API + '-periodoutilizable', 
      { withCredentials: true })
      .pipe(
        // Mapeo para agregar los nuevos campos al objeto
        map((equipos: EquipoPeriodoUtilizable[]) => {

          equipos.map((equipo: EquipoPeriodoUtilizable) => {

            equipo.estado = equipo.activo ? 'Activo' : 'Inactivo';
            equipo.fecha = formatDate(equipo.fechavencimiento.toString(), "dd/MM/yyyy", "en-US");
            
            return equipo;
          });
      
        return equipos;
      }));
  }
}
