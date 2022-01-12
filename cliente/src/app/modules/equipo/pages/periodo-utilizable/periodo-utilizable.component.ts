import { Component, OnInit } from '@angular/core';
import { Column } from 'src/app/shared/models/column';
import { PeriodoUtilizable } from '../../models/periodoUtilizable';
import { PeriodoUtilizableService } from '../../services/periodo-utilizable.service';

@Component({
  selector: 'app-periodo-utilizable',
  templateUrl: './periodo-utilizable.component.html',
  styleUrls: ['./periodo-utilizable.component.css']
})
export class PeriodoUtilizableComponent implements OnInit {

  // Columnas de la tabla
  columns: Column[] = [
    {field: 'fechainicio', title: 'Inicio'}, 
    {field: 'fechavencimiento', title: 'Vencimiento'}, 
    {field: 'dias', title: 'Días Restantes'}, 
    {field: 'nroingreso', title: 'Nro. Ingreso'},
    {field: 'nombre', title: 'Equipo'},
    {field: 'opciones', title: 'Opciones'}
  ];

  // Lista de periodos
  data: PeriodoUtilizable[];
  
  constructor(
    private periodoUtilizableService: PeriodoUtilizableService
  ) { }

  ngOnInit(): void {

    this.periodoUtilizableService.getPeriodosUtilizables().subscribe((response: PeriodoUtilizable[]) => {

      this.data = response;
    });
  }

  nuevoPeriodo() {

    console.log('nuevo periodo');
  }

  editarPeriodo(pPeriodo: PeriodoUtilizable) {

    console.log(pPeriodo);
  }

  bajaPeriodo(pPeriodo: PeriodoUtilizable) {

    console.log(pPeriodo);
  }
}
