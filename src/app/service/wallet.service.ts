import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';


@Injectable({
  providedIn: 'root'
})
export class WalletService {
  endpoind = 'http://localhost:3000/api/users/user-transactions/';
  constructor( private http: HttpClient ) { }

  GetWalletTransaction(){
    return this.http.get(`${this.endpoind}/fetch`);
  }
}
