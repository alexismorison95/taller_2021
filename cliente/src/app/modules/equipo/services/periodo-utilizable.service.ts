import { formatDate } from '@angular/common';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { AltaPeriodoUtilizable, PeriodoUtilizable } from '../models/periodoUtilizable';

@Injectable({
  providedIn: 'root'
})
export class PeriodoUtilizableService {

  private readonly URL_API = 'http://localhost:3000/api/periodoutilizable';

  constructor(private http: HttpClient) { }

  getPeriodosUtilizables(): Observable<PeriodoUtilizable[]> {
    
    return this.http.get<PeriodoUtilizable[]>(this.URL_API, { withCredentials: true })
      .pipe(
        map((periodos: PeriodoUtilizable[]) => {

          periodos.map((periodo: PeriodoUtilizable) => {

            let fechaVencimiento = periodo.fechavencimiento;

            periodo.fechainicio = formatDate(periodo.fechainicio.toString(), "dd/MM/yyyy", "en-US");
            periodo.fechavencimiento = formatDate(periodo.fechavencimiento.toString(), "dd/MM/yyyy", "en-US");
            periodo.dias = this.DiffDays(new Date(fechaVencimiento), new Date());

            return periodo;
          });

          return periodos;
        })
      );
  }

  private DiffDays(pDate1: Date, pDate2: Date): number {

    let diff = Math.abs(pDate1.getTime() - pDate2.getTime());

    return Math.ceil(diff / (1000 * 3600 * 24));
  }

  altaPeriodoUtilizable(pPeriodo: AltaPeriodoUtilizable): Observable<PeriodoUtilizable> {
    return this.http.post<PeriodoUtilizable>(this.URL_API, pPeriodo, { withCredentials: true });
  }

  bajaPeriodoUtilizable(pId: number): Observable<PeriodoUtilizable> {
    return this.http.put<PeriodoUtilizable>(this.URL_API + '/' + pId, { withCredentials: true });
  }
}
