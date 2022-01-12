import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Column } from 'src/app/shared/models/column';
import { Equipo } from '../../models/equipo';
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
    {field: 'opciones', title: 'Opciones'}
  ];

  // Lista de equipos
  data: Equipo[];

  constructor(
    private router: Router,
    private equipoService: EquipoService
  ) { }

  ngOnInit(): void {

    this.getEquipos();
  }

  getEquipos() {

    this.equipoService.GetEquipos().subscribe((response: Equipo[]) => {

      this.data = response;
    });
  }

  nuevoEquipo() {
    console.log('Agregar nuevo equipo');
  }

  editarEquipo(pEvent: Equipo) {
    console.log(pEvent);
  }

  eliminarEquipo(pEvent: Equipo) {
    console.log(pEvent);
  }

}
