import { Injectable } from '@angular/core';
import { CanActivateChild, Router } from '@angular/router';
import { AuthService } from 'src/app/modules/Auth/services/auth.service';

@Injectable({
  providedIn: 'root'
})
export class ChildGuardService implements CanActivateChild {

  constructor(
    private router: Router,
    private authService: AuthService
  ) { }

  canActivateChild(): boolean {
    
    if (!this.authService.getIsLogged()) {
      
      this.router.navigate(['/']);
      return false;
    }

    return true;
  }
}
