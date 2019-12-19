import { Injectable } from '@angular/core';
import { throwError, Observable } from 'rxjs';
import { catchError, map } from 'rxjs/operators';
import { HttpHeaders, HttpClient, HttpErrorResponse } from '@angular/common/http';


@Injectable({
  providedIn: 'root'
})
export class UserService {

  endpoint = 'http://localhost:3000/api';
  header = new HttpHeaders().set('Content-Type','application/json');

  constructor( private http: HttpClient ) { }

  GetUsers(){
    return this.http.get(`${this.endpoint}/users/fetch`);
  }
}
