import { Component, OnInit, ViewChild } from '@angular/core';
import { MatTableDataSource, MatPaginator } from '@angular/material';
import { UserService } from 'app/service/user.service';
import { Users } from 'app/model/user';


@Component({
  selector: 'app-users',
  templateUrl: './users.component.html',
  styleUrls: ['./users.component.scss']
})

export class UsersComponent implements OnInit {

  UserData: any = [];
  displayedColumns: string[] = ['s.no','username' ,'email', 'mobile', 'amount', 'ip', 'browser_detail', 'os', 'account_status'];
  dataSource: MatTableDataSource<Users>;

  @ViewChild(MatPaginator, {static: true}) paginator: MatPaginator;
  
  applyFilter(filterValue: string) {
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }

  constructor( private user: UserService ) { 

    this.user.GetUsers().subscribe(data => {
      this.UserData = data;
      this.dataSource = new MatTableDataSource<Users>(this.UserData);
      setTimeout(()=>{
        this.dataSource.paginator = this.paginator;
      })
    })

  }

  ngOnInit() {
  }
  

}
