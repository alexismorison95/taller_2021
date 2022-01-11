import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ChildGuardService } from 'src/app/shared/utils/guards/child-guard.service';

import { HomeComponent } from "./components/home/home.component";
import { PeriodoUtilizableComponent } from "./components/periodo-utilizable/periodo-utilizable.component";
import { PrestamoComponent } from "./components/prestamo/prestamo.component";
import { EquipoComponent } from './equipo.component';

const routes: Routes = [
  { path: '', component: EquipoComponent,
  canActivateChild: [ChildGuardService],
    children: [
      { path: '', redirectTo: '/equipos/inicio', pathMatch: 'full' },
      { path: 'equipos/inicio', component: HomeComponent },
      { path: 'equipos/periodo-utilizable', component: PeriodoUtilizableComponent },
      { path: 'equipos/prestamo', component: PrestamoComponent }
    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class EquipoRoutingModule { }
