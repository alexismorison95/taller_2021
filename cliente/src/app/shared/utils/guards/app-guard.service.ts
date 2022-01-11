import { Injectable } from '@angular/core';
import { CanActivate, Router } from '@angular/router';
import { AuthService } from 'src/app/modules/Auth/services/auth.service';

@Injectable({
  providedIn: 'root'
})
export class AppGuardService implements CanActivate {

  constructor(
    private router: Router,
    private authService: AuthService
  ) { }

  canActivate(): boolean {
    
    if (!this.authService.getIsLogged()) {
      
      this.router.navigate(['/']);
      return false;
    }

    return true;
  }
}
