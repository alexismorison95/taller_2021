import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  public isLogged: boolean = false;
  public userLogged: any = {};
  private readonly URL_API = 'http://localhost:3000/api/';

  // Mock Data
  private mockUser: any = {
    name: "admin",
    password: "demo"
  };

  constructor(private http: HttpClient) { }

  // Cambiar esto a observable
  login(pUser: any): Observable<any> {

    return this.http.post<any>(this.URL_API + 'login', pUser, { withCredentials: true })
      .pipe(
        map((res: any) => {
          
          if (res.hasOwnProperty('tipousuario')) {
            this.isLogged = true;
            this.userLogged = res;
          }

          return res;
        })
      );
  }

  logout() {

    this.isLogged = false;
    this.userLogged = null;
  }
}
