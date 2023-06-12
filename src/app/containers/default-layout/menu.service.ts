import {Observable, of, throwError as observableThrowError} from 'rxjs';
import {AppConfig} from '../../config/app.config';
import { Injectable } from '@angular/core';
import 'rxjs/add/operator/toPromise';
import 'rxjs/add/operator/catch';
import {WebApiClientService} from '../../core/webApiClient.service';
import { String, StringBuilder } from 'typescript-string-operations';
import { AuthorizeResultModel, AuthorizeApiResult } from '../../model/authorize.result.model';
import { TokenData } from '../../model/authData.model';

@Injectable()
export class MenuService {
  public tokenData: TokenData;
    constructor(private webApiClientService: WebApiClientService) { }

    loadMenu(): Observable<AuthorizeApiResult> {   
      const strTokenData = localStorage.getItem('tokendata'); 
      if(strTokenData != null)
        this.tokenData = JSON.parse(strTokenData);
		let loginName = "";
		if (this.tokenData != undefined && this.tokenData != null){      
			loginName = this.tokenData.User.LoginName;
		}     
        const applicationCode = AppConfig.common.AppLICATION_CODE; 
        let param = String.Format('{   "ApiData": { LOGIN_NAME: \'{0}\', APPLICATION_CODE: \'{1}\' } }', loginName, applicationCode);
                
        return this.webApiClientService.get<AuthorizeApiResult>(AppConfig.domain.acs, AppConfig.endpoints.AcsTokenAuthorize, param);
    }
}