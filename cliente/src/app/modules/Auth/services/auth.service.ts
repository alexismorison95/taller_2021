import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { AuthenticatedUser } from '../models/AuthenticatedUser';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  private isLogged: boolean = false;
  private userLogged: AuthenticatedUser = null;
  private readonly URL_API = 'http://localhost:3000/api/';

  constructor(private http: HttpClient) { }

  getIsLogged(): boolean {
    return this.isLogged;
  }

  getUserLogged(): AuthenticatedUser {
    return this.userLogged;
  }

  login(pUser: any): Observable<AuthenticatedUser> {

    return this.http.post<any>(this.URL_API + 'login', pUser, { withCredentials: true })
      .pipe(
        map((response: AuthenticatedUser) => {
          
          if (response.hasOwnProperty('tipousuario')) {
            this.isLogged = true;
            this.userLogged = response;
          }

          return response;
        })
      );
  }

  logout(): Observable<any> {

    return this.http.get<any>(this.URL_API + 'logout', { withCredentials: true })
      .pipe(
        map((response: any) => {
          
          if (response.hasOwnProperty('res')) {
            this.isLogged = false;
            this.userLogged = null;
          }

          return response;
        })
      );
  }
}
