import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { EquipoRoutingModule } from './equipo-routing.module';

import { MaterialModule } from "../../shared/modules/material.module";

import { HomeComponent } from './pages/home/home.component';
import { PrestamoComponent } from './pages/prestamo/prestamo.component';
import { PeriodoUtilizableComponent } from './pages/periodo-utilizable/periodo-utilizable.component';
import { EquipoNavbarComponent } from './components/equipo-navbar/equipo-navbar.component';
import { EquipoComponent } from './equipo.component';
import { TableComponent } from './components/table/table.component';


@NgModule({
  declarations: [
    EquipoComponent,
    HomeComponent,
    PrestamoComponent,
    PeriodoUtilizableComponent,
    EquipoNavbarComponent,
    TableComponent
  ],
  imports: [
    CommonModule,
    EquipoRoutingModule,
    MaterialModule
  ],
  bootstrap: [EquipoComponent]
})
export class EquipoModule { }
