import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { Column } from 'src/app/shared/models/column';
import { EditarEquipoComponent } from '../../components/editar-equipo/editar-equipo.component';
import { NuevoEquipoComponent } from '../../components/nuevo-equipo/nuevo-equipo.component';
import { EditarEquipo, Equipo, EquipoPeriodoUtilizable, NuevoEquipo } from '../../models/equipo';
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
    private equipoService: EquipoService,
    public dialog: MatDialog
  ) { }

  ngOnInit(): void {

    this.getEquipos();
  }

  getEquipos() {

    this.equipoService.getEquipos().subscribe((response: EquipoPeriodoUtilizable[]) => {

      this.data = response;
    });
  }

  nuevoEquipo() {
    this.dialog.open(NuevoEquipoComponent)
      .afterClosed().subscribe((nuevoEquipo: NuevoEquipo) => {

        if (nuevoEquipo && nuevoEquipo.nombre !== '') {

          this.equipoService.agregarEquipo(nuevoEquipo).subscribe((response: Equipo) => {

            console.log(response);
            
            this.getEquipos();
          });
        }
      });
  }

  editarEquipo(pEvent: EquipoPeriodoUtilizable) {
    
    this.dialog.open(EditarEquipoComponent, { data: pEvent })
      .afterClosed().subscribe((equipo: EditarEquipo) => {

        if (equipo && equipo.nombre !== '') {

          this.equipoService.editarEquipo(equipo).subscribe((response: Equipo) => {

            console.log(response);
            
            this.getEquipos();
          });
        }
      });
  }

  bajaEquipo(pEvent: EquipoPeriodoUtilizable) {
    
    this.equipoService.bajaEquipo(pEvent.id).subscribe((response: Equipo) => {

      console.log(response);
    });
  }

}
