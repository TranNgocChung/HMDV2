import { NgModule } from '@angular/core';
import { BsDropdownModule } from 'ngx-bootstrap/dropdown';
import { ButtonsModule } from 'ngx-bootstrap/buttons';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { TrangChuComponent } from './home.component';
import { TrangChuRoutingModule } from './home-routing.module';
import { HomeService } from './home.service';
import { CoreModule } from '../../core/core.module';
import { TranslateModule } from 'ng2-translate';
import {NgxPaginationModule} from 'ngx-pagination'; // <-- import the module
import { BsDatepickerModule } from 'ngx-bootstrap/datepicker';

@NgModule({
  imports: [
    ReactiveFormsModule,
	BsDatepickerModule.forRoot(),
    FormsModule,
    CommonModule,
    BsDropdownModule,
    TrangChuRoutingModule,
    TranslateModule,
    CoreModule,
    NgxPaginationModule,
	ButtonsModule.forRoot()
  ],
  declarations: [ TrangChuComponent ],
  providers: [HomeService]
})
export class TrangChuModule { }
