import {InjectionToken} from '@angular/core';
import {IAppConfig} from './iapp.config';
export let APP_CONFIG = new InjectionToken('app.config');

export const AppConfig: IAppConfig = {
  routes: {
    default: 'home',
    error404: '404'
  },
  endpoints: {
    SarReport: '/api/SarReport/GetView',    
    MrsReportCreateApi:'/api/MrsReport/CreateData',
	DbdReportCreateApi:'/api/BdbReport/Create',
	DbdReportCreateSdoApi:'/api/BdbReport/CreateSdo',
	MrsReportGetApi:'/api/MrsReport/IntegrateReport',
    AcsTokenLogin: '/api/Token/Login',
    AcsTokenLogout: '/api/Token/Logout',
    AcsTokenGetAuthenticated: '/api/Token/GetAuthenticated',
    AcsTokenChangePassword: '/api/AcsUser/ChangePassword',
    AcsTokenForgotPassword: '/api/Token/ForgotPassword',
    AcsTokenAuthorize:  '/api/AcsToken/Authorize',
  },
  pageSize: 10000,
  domain: {
	integrate: '',	
	//mrs: 'http://mrs.12c.vn',
    //acs: 'http://acs.12c.vn',
	//dbd: 'http://localhost:23233',
dbd: 'http://192.168.1.201:1433',
	mrs: 'http://14.232.245.104:8613',
    acs: 'http://14.232.245.104:81',
	//mrs: 'http://113.160.170.181:1413',    
   // acs: 'http://113.160.170.181:1401',
	//dbd: 'http://113.160.170.181:1433',
  },
  common:{
    AppLICATION_CODE: 'DHS',
	TimerInterval: 200,//đơn vị giây, thời gian tự động tải dữ liệu
	IsAllowCustomDateRange: 1,
	IsAllowCustomDateRangeHomePage: 1,
  ListAllowReportTemplateCode: 'MRS0000201,MRS0000206,MRS0024901,MRS0055501,MRS0055509,TKB0002101,MRS0029601,MRS0000203,TKB0006101',//'MRS0000201,MRS0000206,MRS0048204,MRS0055501,MRS0055509,TKB0001602,TKB0002101,TKB0003601,TKB0006101',//
  }
};
