import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Column } from 'src/app/shared/models/column';
import { Equipo, EquipoPeriodoUtilizable } from '../../models/equipo';
import { EquipoService } from '../../services/equipo.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  // Columnas de la tabla
  columns: Column[] = [
    {field: 'nombre', title: 'Nombre'}, 
    {field: 'estado', title: 'Estado'}, 
    {field: 'nroactual', title: 'Número Actual'},
    {field: 'fecha', title: 'Vencimiento'},
    {field: 'opciones', title: 'Opciones'}
  ];

  // Lista de equipos
  data: EquipoPeriodoUtilizable[];

  constructor(
    private router: Router,
    private equipoService: EquipoService
  ) { }

  ngOnInit(): void {

    this.getEquipos();
  }

  getEquipos() {

    this.equipoService.GetEquipos().subscribe((response: EquipoPeriodoUtilizable[]) => {

      this.data = response;
    });
  }

  nuevoEquipo() {
    console.log('Agregar nuevo equipo');
  }

  editarEquipo(pEvent: EquipoPeriodoUtilizable) {
    console.log(pEvent);
  }

  eliminarEquipo(pEvent: EquipoPeriodoUtilizable) {
    console.log(pEvent);
  }

}
