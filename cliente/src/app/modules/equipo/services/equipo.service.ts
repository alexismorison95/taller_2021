import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { Equipo } from '../models/equipo';

@Injectable({
  providedIn: 'root'
})
export class EquipoService {

  private readonly URL_API = 'http://localhost:3000/api/equipo';

  constructor(private http: HttpClient) { }

  GetEquipos(): Observable<Equipo[]> {

    return this.http.get<Equipo[]>(this.URL_API, { withCredentials: true })
      .pipe(
        // Mapeo para agregar el campo estado al objeto
        map((equipos: Equipo[]) => {

          equipos.map((equipo: Equipo) => {

            equipo.estado = equipo.activo ? 'Activo' : 'Inactivo';
            return equipo;
          });
      
        return equipos;
      }));
  }
}
