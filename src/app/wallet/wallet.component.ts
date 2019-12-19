import { Component, OnInit, ViewChild } from '@angular/core';
import { UserWallet } from 'app/model/user-wallet';
import { MatTableDataSource, MatPaginator } from '@angular/material';
import { WalletService } from 'app/service/wallet.service';

@Component({
  selector: 'app-wallet',
  templateUrl: './wallet.component.html',
  styleUrls: ['./wallet.component.css']
})
export class WalletComponent implements OnInit {

  UserWalletData: any = [];
  displayedColumns: string[] = ['s.no', 'user_id', 'betting_id', 'amount', 'total_amount', 'type', 'remark'];
  dataSource: MatTableDataSource<UserWallet>;

  @ViewChild(MatPaginator, {static: true}) paginator: MatPaginator; 

  applyFilter(filterValue: string) {
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }
  
  constructor( private WalletService: WalletService ) { 

    this.WalletService.GetWalletTransaction().subscribe(data => {
      this.UserWalletData = data;
      this.dataSource = new MatTableDataSource<UserWallet>(this.UserWalletData);
      setTimeout(() => {
        this.dataSource.paginator =  this.paginator;
      })
    });


  }

  ngOnInit() {
  }

}
