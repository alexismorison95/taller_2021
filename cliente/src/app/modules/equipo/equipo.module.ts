import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { EquipoRoutingModule } from './equipo-routing.module';

import { MaterialModule } from "../../shared/modules/material.module";

import { HomeComponent } from './components/home/home.component';
import { PrestamoComponent } from './components/prestamo/prestamo.component';
import { PeriodoUtilizableComponent } from './components/periodo-utilizable/periodo-utilizable.component';
import { EquipoNavbarComponent } from './components/equipo-navbar/equipo-navbar.component';
import { EquipoComponent } from './equipo.component';


@NgModule({
  declarations: [
    EquipoComponent,
    HomeComponent,
    PrestamoComponent,
    PeriodoUtilizableComponent,
    EquipoNavbarComponent
  ],
  imports: [
    CommonModule,
    EquipoRoutingModule,
    MaterialModule
  ],
  bootstrap: [EquipoComponent]
})
export class EquipoModule { }
