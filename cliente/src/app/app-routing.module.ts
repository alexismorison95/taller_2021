import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { InicioComponent } from './components/inicio/inicio.component';
import { AppGuardService } from './shared/utils/guards/app-guard.service';
import { ChildGuardService } from './shared/utils/guards/child-guard.service';

const routes: Routes = [
  { path: '', redirectTo: 'login', pathMatch: 'full' },
  { path: 'inicio', component: InicioComponent, canActivate: [AppGuardService] },
  {
    path: 'login',
    loadChildren: () => import('./modules/Auth/auth.module').then(m => m.AuthModule)
  },
  {
    path: 'equipos',
    loadChildren: () => import('./modules/equipo/equipo.module').then(m => m.EquipoModule)
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
