import { Component, OnInit, OnDestroy } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { FormGroup, FormControl, FormBuilder, Validators } from '@angular/forms';
import { HomeService } from './home.service';
import { MenuModel } from '../../model/menu.model';
import { BaseComponent } from '../../shared/base.component';
import { MenuService } from '../../containers/default-layout/menu.service';
import { reportDatas } from "../../model/report";
import { ReportIntegrate } from "../../model/ReportIntegrate";
import { SearchReport, SearchRangeDate } from '../../model/Search.model';
import { AppConfig } from '../../config/app.config';
import { BsModalService, ModalDirective } from 'ngx-bootstrap/modal';
import { BsModalRef } from 'ngx-bootstrap/modal/bs-modal-ref.service';
import { BsDatepickerModule } from 'ngx-bootstrap/datepicker';
import { BsLocaleService } from 'ngx-bootstrap/datepicker';
import { listLocales } from 'ngx-bootstrap/chronos';
import { defineLocale } from 'ngx-bootstrap/chronos';
import { viLocale } from 'ngx-bootstrap/locale';
// import { NgxSpinnerService } from 'ngx-spinner';

@Component({
	selector: 'homecomponent',
	templateUrl: 'home.component.html',
	styleUrls: ['home.component.css']
})
export class TrangChuComponent extends BaseComponent implements OnInit, OnDestroy {
	public navItems: Array<MenuModel>;
	public dnum: number;
	today: Date;
	timefrom: string;
	timeto: string;
	dayto: string;
	monthto: string;
	yearto: string;
	dayfrom: string;
	monthfrom: string;
	yearfrom: string;

	DefaultFromDateBedRatioShow: string;
	DefaultToDateBedRatioShow: string;
	timefromBedRatio: any;
	timetoBedRatio: any;
	currentPrecious: any;
	currentYear: any;
	Listyear: Array<number>;

	searchPanel: FormGroup;
	SearchFor: number;// 1:ngày 2:tuần 3:tháng 4:năm   
	searchReport: SearchReport;
	searchRangeDate: SearchRangeDate;
	loading1: number;
	loading2: number;
	loading3: number;
	loading4: number;
	loading5: number;
	loading6: number;
	interval;
	timeLeft: number = 10;
	IsAllowCustomDateRange: number = 0;
	modalRef: BsModalRef;
	HaveData: number;
	BedRatioData: any;
	thoigianthongke: string;
	loading0: boolean;
	listAllowReportTemplateCode: string = AppConfig.common.ListAllowReportTemplateCode;

	constructor(
		private route: ActivatedRoute,
		public homeService: HomeService,
		private menuService: MenuService,
		private modalService: BsModalService,
		private localeService: BsLocaleService,
		public fb: FormBuilder,
		public router: Router) {
		super(router);
	}

	ngOnInit() {
		this.searchPanel = this.fb.group({
			//'keyword': ['', ""],
		});
		this.dnum = 0;
		this.SearchFor = 1;
		this.HaveData = -1;
		this.loading0 = false;
		this.initDateRange();
		// let now = new Date();
		// this.timeto = ConvertdateToString(now, "235959");
		// this.timefrom = ConvertdateToString(now, "000000");      
		// this.setDateNumberToStringShow(now, now); 
		this.setDatepickerLanguage();
		this.loadMenuProfile();
		this.IsAllowCustomDateRange = AppConfig.common.IsAllowCustomDateRangeHomePage;
		if (AppConfig.common.TimerInterval > 0) {
			this.timeLeft = AppConfig.common.TimerInterval;
			this.startTimer();
		}
	}

	showSpinner(name: string) {
		//this.spinner.show(name);
	}

	hideSpinner(name: string) {
		//this.spinner.hide(name);
	}

	initDateRange(): void {
		this.searchReport = new SearchReport();
		const objectstore__searchReport = localStorage.getItem('objectstore__searchReport');
		let isInit = false;
		if (objectstore__searchReport != undefined && objectstore__searchReport != null && objectstore__searchReport != '') {
			this.searchReport = JSON.parse(objectstore__searchReport);
			if (this.searchReport != undefined && this.searchReport != null) {
				this.timeto = this.searchReport.TIME_TO;
				this.timefrom = this.searchReport.TIME_FROM;
				isInit = true;
			}
		}
		if (isInit == false) {
			let now = new Date();
		}
		this.searchRangeDate = this.convertDateStringToDateRangeNoStorage(this.timefrom, this.timeto);

		let now1 = new Date();
		this.currentPrecious = '1';
		this.currentYear = now1.getFullYear();
		this.Listyear = new Array<number>();
		let i = now1.getFullYear();
		while (i != 1900) {
			this.Listyear.push(i);
			i--;
		}
		this.changePrecious(this.currentPrecious);
	}

	ChonNgayTuDen() {
		//this.router.navigate(['../common/chonhoso'], { relativeTo: this.route });
		//this.router.navigateByUrl('../chonhoso');
		//this.router.navigateByUrl('chonhoso');
		//this.router.navigate(['/chonhoso']);
	}


	ngOnDestroy(): void {
		clearInterval(this.interval);
	}

	startTimer() {
		this.interval = setInterval(() => {
			if (this.timeLeft > 0) {
				this.timeLeft--;
			} else {
				this.timeLeft = AppConfig.common.TimerInterval;
				console.log('--------------------------------------------Load du lieu dashboard: ----------------------------------  sau ' + this.timeLeft + " giây sẽ tiếp tục tải lại.....");
				this.setReportDataMenu();
			}
		}, 1000)
	}


	setReportDataMenu() {
		let allowReportTemplateCodes = this.listAllowReportTemplateCode.split(',');
		let cfg = new SearchReport();
		cfg.ReportTypeCode = "";
		cfg.ReportTemplateCode = "";
		cfg.Keyword = this.listAllowReportTemplateCode;
		this.homeService.loadDataReport(cfg).subscribe();
		this.navItems.forEach(md => {
			md.loading = 1;
		});

		this.navItems.forEach(md => {
			if (md.url === '/taichinh')
				md.url = '/chitietdoanhthu';
			if (md.url === "/chitietdoanhthu" || md.url === "/taichinh" || md.url === "/dangnamvien"|| md.url === "/trungbinhkham")
				md.isparenturl = 0;
			else
				md.isparenturl = 1;

			if (md.url == '/khambenh') {
				if (allowReportTemplateCodes.includes('MRS0000201')) {
					console.log('loading khambenh ' + new Date());
					this.showSpinner('spinner/khambenh');
					let srpt1 = new SearchReport();
					srpt1.TIME_TO = this.timeto;
					srpt1.TIME_FROM = this.timefrom;
					srpt1.ReportTypeCode = "MRS00002";
					srpt1.ReportTemplateCode = "MRS0000201";
					this.homeService.loadDataReport(srpt1).subscribe(tk => {
						let SUM_COUNT_EXAM = 0;
						if (tk != undefined && tk != null && tk.Success && tk.Data != undefined && tk.Data.DATA_DETAIL != undefined && tk.Data.DATA_DETAIL.Department != undefined && tk.Data.DATA_DETAIL.Department.length > 0) {
							SUM_COUNT_EXAM = tk.Data.DATA_DETAIL.Department.reduce(function (accumulator, pilot) {
								return accumulator + pilot.COUNT_EXAM;
							}, 0);
						}
						md.reportdata = SUM_COUNT_EXAM;
						if (allowReportTemplateCodes.includes('MRS0029601')) {
							let srpt2 = new SearchReport();
							srpt2.TIME_TO = this.timeto;
							srpt2.TIME_FROM = this.timefrom;
							srpt2.ReportTypeCode = "MRS00296";
							srpt2.ReportTemplateCode = "MRS0029601";
							this.homeService.loadDataReport(srpt2).subscribe(tk1 => {
								let SUM_COUNT_EXAM_1 = 0;
								if (tk1 != undefined && tk1 != null && tk1.Success && tk1.Data != undefined && tk1.Data.DATA_DETAIL != undefined && tk1.Data.DATA_DETAIL.ReportSum != undefined && tk1.Data.DATA_DETAIL.ReportSum.length > 0) {
									SUM_COUNT_EXAM_1 = tk1.Data.DATA_DETAIL.ReportSum.reduce(function (accumulator, pilot) {
										return accumulator + Number(pilot.AMOUNT_DEPOSIT_BILL) - Number(pilot.AMOUNT_REPAY);
									}, 0);
								}
								md.reportdataext6 = "Đã kết thúc khám: " + SUM_COUNT_EXAM;
								md.url6 = "/#/khambenh";
								md.reportdataext7 = "Đã thu tiền: " + SUM_COUNT_EXAM_1;
								md.url7 = "/#/thutienkham";
								if (tk1 != undefined && tk1 != null && tk1.Success && tk1.Data != undefined && tk1.Data.SINGER_DATA != undefined && tk1.Data.SINGER_DATA.ReportDate != undefined && tk1.Data.SINGER_DATA.ReportDate != null) {
									md.reportdate = "Cập nhật: " + tk1.Data.SINGER_DATA.ReportDate;
								}

								console.log('loaded khambenh ' + new Date());
								md.loading = 0;
								this.hideSpinner('spinner/khambenh');
							});
						}
						else {
							if (tk != undefined && tk != null && tk.Success && tk.Data != undefined && tk.Data.SINGER_DATA != undefined && tk.Data.SINGER_DATA.ReportDate != undefined && tk.Data.SINGER_DATA.ReportDate != null) {
								md.reportdate = "Cập nhật: " + tk.Data.SINGER_DATA.ReportDate;
							}

							console.log('loaded khambenh ' + new Date());
							md.loading = 0;
							this.hideSpinner('spinner/khambenh');
						}
						if (allowReportTemplateCodes.includes('MRS0000203')) {
							let srpt3 = new SearchReport();
							srpt3.TIME_TO = this.timeto;
							srpt3.TIME_FROM = this.timefrom;
							srpt3.ReportTypeCode = "MRS00002";
							srpt3.ReportTemplateCode = "MRS0000203";
							this.homeService.loadDataReport(srpt3).subscribe(tk2 => {
								let SUM_COUNT_EXAM_2 = 0;
								if (tk2 != undefined && tk2 != null && tk2.Success && tk2.Data != undefined && tk2.Data.DATA_DETAIL != undefined && tk2.Data.DATA_DETAIL.Department != undefined && tk2.Data.DATA_DETAIL.Department.length > 0) {
									SUM_COUNT_EXAM_2 = tk2.Data.DATA_DETAIL.Department.reduce(function (accumulator, pilot) {
										return accumulator + pilot.COUNT_EXAM;
									}, 0);
								}
								md.reportdataext6 = "Đã kết thúc khám: " + SUM_COUNT_EXAM;
								md.url6 = "/#/khambenh";
								md.reportdataext8 = "Đã tiếp đón: " + SUM_COUNT_EXAM_2;
								md.url8 = "/#/khambenhtiepdon";
								if (tk2 != undefined && tk2 != null && tk2.Success && tk2.Data != undefined && tk2.Data.SINGER_DATA != undefined && tk2.Data.SINGER_DATA.ReportDate != undefined && tk2.Data.SINGER_DATA.ReportDate != null) {
									md.reportdate = "Cập nhật: " + tk2.Data.SINGER_DATA.ReportDate;
								}

								console.log('loaded khambenh ' + new Date());
								md.loading = 0;
								this.hideSpinner('spinner/khambenh');
							});
						}
						else {
							if (tk != undefined && tk != null && tk.Success && tk.Data != undefined && tk.Data.SINGER_DATA != undefined && tk.Data.SINGER_DATA.ReportDate != undefined && tk.Data.SINGER_DATA.ReportDate != null) {
								md.reportdate = "Cập nhật: " + tk.Data.SINGER_DATA.ReportDate;
							}

							console.log('loaded khambenh ' + new Date());
							md.loading = 0;
							this.hideSpinner('spinner/khambenh');
						}
					});
				}

			}


			else if (md.url == '/khamcapcuu') {
				this.homeService.delay(100);
				console.log('loading khamcapcuu ' + new Date());
				let srpt2 = new SearchReport();
				srpt2.CREATE_TIME_TO = this.timeto;
				srpt2.CREATE_TIME_FROM = this.timefrom;
				srpt2.ReportTypeCode = "TKB00021";
				srpt2.ReportTemplateCode = "TKB0002101";
				this.homeService.loadDataReport(srpt2).subscribe(tktkb21 => {
					let SUM_TONG = 0;
					if (tktkb21 != undefined && tktkb21 != null && tktkb21.Success && tktkb21.Data != undefined && tktkb21.Data.DATA_DETAIL != undefined && ((tktkb21.Data.DATA_DETAIL.Report0 != undefined && tktkb21.Data.DATA_DETAIL.Report0.length > 0) || (tktkb21.Data.DATA_DETAIL.Report2 != undefined && tktkb21.Data.DATA_DETAIL.Report2.length > 0))) {
						let reportdatas0 = tktkb21.Data.DATA_DETAIL.Report0;
						//let reportdatas2 = tktkb21.Data.DATA_DETAIL.Report2;

						if (reportdatas0 != undefined && reportdatas0.length > 0) {

							SUM_TONG = reportdatas0.reduce(function (accumulator, pilot) {
								return accumulator + pilot.TONG;
							}, 0);
						}
						// else if (reportdatas2!= undefined && reportdatas2.length >0) {	
						// SUM_TONG = reportdatas2.reduce(function (accumulator, pilot) {
						// return accumulator + pilot.TONG;
						// }, 0);
						// }				
					}

					md.reportdata = SUM_TONG;
					if (tktkb21 != undefined && tktkb21 != null && tktkb21.Success && tktkb21.Data != undefined && tktkb21.Data.SINGER_DATA != undefined && tktkb21.Data.SINGER_DATA.ReportDate != undefined && tktkb21.Data.SINGER_DATA.ReportDate != null) {
						md.reportdate = "Cập nhật: " + tktkb21.Data.SINGER_DATA.ReportDate;
					}
					md.loading = 0;
					console.log('loaded khamcapcuu ' + new Date());
				});
				if (allowReportTemplateCodes.includes('MRS0029601')) {
					md.reportdataext6 = ' ';
					md.reportdataext7 = ' ';
				}
				if (allowReportTemplateCodes.includes('MRS0000203')) {
					md.reportdataext8 = ' ';
				}
			}

			else if (md.url == '/vaovien') {
				this.homeService.delay(100);
				console.log('loading vaovien ' + new Date());
				let srpt464 = new SearchReport();
				srpt464.TIME_TO = this.timeto;
				srpt464.TIME_FROM = this.timefrom;
				srpt464.ReportTypeCode = "MRS00002";
				srpt464.ReportTemplateCode = "MRS0000206";
				this.homeService.loadDataReport(srpt464).subscribe(tk => {
					let SUM_COUNT_TREATMENT_IN = 0;
					let SUM_COUNT_TREATMENT_IN_BHYT = 0;
					let SUM_VP = 0;
					let SUM_TUNGUYEN = 0;
					if (tk != undefined && tk != null && tk.Data != undefined && tk.Data.DATA_DETAIL != undefined && tk.Data.DATA_DETAIL.Report0 != undefined && tk.Data.DATA_DETAIL.Report0.length > 0) {
						let reportdatas0 = tk.Data.DATA_DETAIL.Report0;
						SUM_COUNT_TREATMENT_IN = reportdatas0.reduce(function (accumulator, pilot) {
							return accumulator + pilot.COUNT_TREATMENT_IN;
						}, 0);
						SUM_COUNT_TREATMENT_IN_BHYT = reportdatas0.reduce(function (accumulator, pilot) {
							return accumulator + pilot.COUNT_TREATMENT_IN_BHYT;
						}, 0);
						SUM_VP = (SUM_COUNT_TREATMENT_IN - SUM_COUNT_TREATMENT_IN_BHYT);
					}
					md.reportdata = SUM_COUNT_TREATMENT_IN;
					md.reportdataext3 = "- " + SUM_COUNT_TREATMENT_IN_BHYT + " (BHYT)";
					md.reportdataext4 = "- " + SUM_VP + " (Viện Phí)";
					md.reportdataext5 = "- " + SUM_TUNGUYEN + " (Tự nguyện)";
					md.reportdataext6 = " ";
					md.reportdataext7 = " ";

					if (tk != undefined && tk != null && tk.Success && tk.Data != undefined && tk.Data.SINGER_DATA != undefined && tk.Data.SINGER_DATA.ReportDate != undefined && tk.Data.SINGER_DATA.ReportDate != null) {
						md.reportdate = "Cập nhật: " + tk.Data.SINGER_DATA.ReportDate;
					}

					md.loading = 0;
					console.log('loaded vaovien ' + new Date());
				});
			}
			else if (md.url == '/dangnamvien') {
				this.homeService.delay(100);
				console.log('loading dangnamvien ' + new Date());
				let srpt3 = new SearchReport();
				srpt3.TIME_FROM = this.timefrom;
				srpt3.TIME_TO = this.timeto;
				srpt3.ReportTypeCode = "MRS00555";
				srpt3.ReportTemplateCode = "MRS0055501";
				this.homeService.loadDataReport(srpt3).subscribe(tk => {
					let SUM_COUNT_END = 0;
					let SUM_BHYT_DT = 0;
					let SUM_BHYT_TT = 0;
					let SUM_VP = 0;
					if (tk != undefined && tk != null && tk.Success && tk.Data != undefined && tk.Data.DATA_DETAIL != undefined && tk.Data.DATA_DETAIL.Report != undefined && tk.Data.DATA_DETAIL.Report.length > 0) {
						let report0 = tk.Data.DATA_DETAIL.Report;
						SUM_COUNT_END = report0.reduce(function (accumulator, pilot) {
							return accumulator + pilot.COUNT_END;
						}, 0);
						SUM_BHYT_DT = report0.reduce(function (accumulator, pilot) {
							return accumulator + pilot.COUNT_END_BHDT;
						}, 0);
						SUM_BHYT_TT = report0.reduce(function (accumulator, pilot) {
							return accumulator + pilot.COUNT_END_BHTT;
						}, 0);
						SUM_VP = report0.reduce(function (accumulator, pilot) {
							return accumulator + pilot.COUNT_END_VP;
						}, 0);
					}

					md.reportdata = SUM_COUNT_END;
					//md.url0="/#/dangnamvien";
					md.reportdataext4 = "Bệnh Nhân BHYT: " + (SUM_COUNT_END-SUM_VP);
					md.url4 = "/#/hiendiennt";
					md.reportdataext5 = "BN viện phí: " + (SUM_VP);
					md.url5 = "/#/hiendiennt";
					md.reportdataext6 = " ";
					md.reportdataext7 = " ";

					if (tk != undefined && tk != null && tk.Success && tk.Data != undefined && tk.Data.SINGER_DATA != undefined && tk.Data.SINGER_DATA.ReportDate != undefined && tk.Data.SINGER_DATA.ReportDate != null) {
						md.reportdate = "Cập nhật: " + tk.Data.SINGER_DATA.ReportDate;
					}

					md.loading = 0;
					console.log('loaded dangnamvien ' + new Date());
				});
			}
			else if (md.url == '/ravien') {
				this.homeService.delay(100);
				console.log('loading ravien ' + new Date());
				let srpt4 = new SearchReport();
				srpt4.TIME_TO = this.timeto;
				srpt4.TIME_FROM = this.timefrom;
				srpt4.ReportTypeCode = "MRS00555";
				srpt4.ReportTemplateCode = "MRS0055509";
				this.homeService.loadDataReport(srpt4).subscribe(tk => {

					let SUM_COUNT_EXP = 0;
					let SUM_KHAC = 0;//<#Evaluate(<#ReportNew1.COUNT_EXP;>-<#ReportNew1.COUNT_DIE;>-<#ReportNew1.COUNT_OUT_CV;>-<#ReportNew1.COUNT_OUT_TRON;>)>
					let SUM_CVIEN = 0;//<#Evaluate( <#ReportNew1.COUNT_OUT_CV;>-<#ReportNew1.COUNT_OUT_CV_LEN;>)>
					let SUM_CVIEN1 = 0;
					let SUM_RAVIEN = 0;
					let SUM_TUVONG = 0;
					let SUM_HENKHAM = 0;
					let SUM_TRON = 0;
					let SUM_NANGVE = 0;
					let SUM_COUNT_OUT_CV_LEN = 0;
					if (tk != undefined && tk != null && tk.Success && tk.Data != undefined && tk.Data.DATA_DETAIL != undefined && tk.Data.DATA_DETAIL.Report != undefined && tk.Data.DATA_DETAIL.Report.length > 0) {
						SUM_COUNT_EXP = tk.Data.DATA_DETAIL.Report.reduce(function (accumulator, pilot) {
							return accumulator + (pilot.COUNT_EXP);
						}, 0);
						SUM_RAVIEN = tk.Data.DATA_DETAIL.Report.reduce(function (accumulator, pilot) {
							return accumulator + (pilot.COUNT_OUT_RAVIEN);
						}, 0);
						SUM_CVIEN = tk.Data.DATA_DETAIL.Report.reduce(function (accumulator, pilot) {
							return accumulator + (pilot.COUNT_OUT_CV - pilot.COUNT_OUT_CV_LEN);
						}, 0);
						SUM_CVIEN1 = tk.Data.DATA_DETAIL.Report.reduce(function (accumulator, pilot) {
							return accumulator + (pilot.COUNT_OUT_CV);
						}, 0);
						SUM_COUNT_OUT_CV_LEN = tk.Data.DATA_DETAIL.Report.reduce(function (accumulator, pilot) {
							return accumulator + (pilot.COUNT_OUT_CV_LEN);
						}, 0);
						SUM_HENKHAM = tk.Data.DATA_DETAIL.Report.reduce(function (accumulator, pilot) {
							return accumulator + (pilot.COUNT_OUT_HEN);
						}, 0);
						SUM_TUVONG = tk.Data.DATA_DETAIL.Report.reduce(function (accumulator, pilot) {
							return accumulator + (pilot.COUNT_DEATH_INFO);
						}, 0);
						SUM_TRON = tk.Data.DATA_DETAIL.Report.reduce(function (accumulator, pilot) {
							return accumulator + (pilot.COUNT_OUT_TRON);
						}, 0);
						SUM_NANGVE = tk.Data.DATA_DETAIL.Report.reduce(function (accumulator, pilot) {
							return accumulator + (pilot.COUNT_OUT_NANG);
						}, 0);
						SUM_KHAC = tk.Data.DATA_DETAIL.Report.reduce(function (accumulator, pilot) {
							return accumulator + (pilot.COUNT_EXP - pilot.COUNT_DIE - pilot.COUNT_OUT_CV - pilot.COUNT_OUT_TRON - pilot.COUNT_OUT_NANG);
						}, 0);
					}

					//Tổng XXX 
					// - A (RV khác)
					// - B (C.viện)
					// - C (CV TT)
					// - D (Tử vong)
					// - E (Nặng X.về)		
					md.reportdata = SUM_COUNT_EXP;
					md.reportdataext3 = "- " + SUM_KHAC + " (Ra viện)";
					md.reportdataext4 = "- " + SUM_CVIEN + " (Chuyển viện chuyên khoa)";
					md.reportdataext5 = "- " + SUM_COUNT_OUT_CV_LEN + " (Chuyển tuyến trên)";
					md.reportdataext6 = "- " + SUM_TUVONG + " (Tử vong)";
					md.reportdataext7 = "- " + SUM_NANGVE + " (Nặng X.về)";
					if (tk != undefined && tk != null && tk.Success && tk.Data != undefined && tk.Data.SINGER_DATA != undefined && tk.Data.SINGER_DATA.ReportDate != undefined && tk.Data.SINGER_DATA.ReportDate != null) {
						md.reportdate = "Cập nhật: " + tk.Data.SINGER_DATA.ReportDate;
					}
					md.loading = 0;
					console.log('loaded ravien ' + new Date());
				});
			}
			else if (md.url == "/taichinh" || md.url == '/chitietdoanhthu') {
				if (allowReportTemplateCodes.includes('TKB0003601')) {
					this.homeService.delay(100);
					console.log('loading taichinh ' + new Date());

					let SUM_TT_RA_VIEN = 0;
					let SUM_THU_TRUC_TIEP = 0;
					let SUM_TAM_UNG = 0;
					this.showSpinner('spinner/taichinh');
					let srpt5 = new SearchReport();
					srpt5.TIME_TO = this.timeto;
					srpt5.TIME_FROM = this.timefrom;
					srpt5.ReportTypeCode = "TKB00036";
					srpt5.ReportTemplateCode = "TKB0003601";
					this.homeService.loadDataReport(srpt5).subscribe(tk => {
						if (tk != undefined && tk != null && tk.Success && tk.Data != undefined && tk.Data.DATA_DETAIL != undefined && ((tk.Data.DATA_DETAIL.Report0 != undefined && tk.Data.DATA_DETAIL.Report0.length > 0))) {
							let report1 = tk.Data.DATA_DETAIL.Report0;
							if (report1 != undefined && report1 != null && report1.length > 0) {
								SUM_TT_RA_VIEN = report1.reduce(function (accumulator, pilot) {
									return accumulator + Number(pilot.TOTAL_HEIN_PRICE) + Number(pilot.TOTAL_PATIENT_PRICE);
								}, 0);

								//console.log('loaded report data: TKB0003601 SUM_TT_RA_VIEN'+SUM_TT_RA_VIEN);	
							}
						}

						let srpt6 = new SearchReport();
						srpt6.TIME_TO = this.timeto;
						srpt6.TIME_FROM = this.timefrom;
						srpt6.ReportTypeCode = "TKB00016";
						srpt6.ReportTemplateCode = "TKB0001602";
						this.homeService.loadDataReport(srpt6).subscribe(tk1 => {
							if (tk1 != undefined && tk1 != null && tk1.Success && tk1.Data != undefined && tk1.Data.DATA_DETAIL != undefined && ((tk1.Data.DATA_DETAIL.Report1 != undefined && tk1.Data.DATA_DETAIL.Report1.length > 0))) {
								let report2 = tk1.Data.DATA_DETAIL.Report1;
								if (report2 != undefined && report2 != null && report2.length > 0) {
									SUM_THU_TRUC_TIEP = report2.reduce(function (accumulator, pilot) {
										return accumulator + pilot.TOTAL_PRICE;
									}, 0);
								}
							}

							let srpt7 = new SearchReport();
							srpt7.TIME_TO = this.timeto;
							srpt7.TIME_FROM = this.timefrom;
							srpt7.ReportTypeCode = "MRS00482";
							srpt7.ReportTemplateCode = "MRS0048204";
							this.homeService.loadDataReport(srpt7).subscribe(tk2 => {
								if (tk2 != undefined && tk2 != null && tk2.Success && tk2.Data != undefined && tk2.Data.DATA_DETAIL != undefined && ((tk2.Data.DATA_DETAIL.Report != undefined && tk2.Data.DATA_DETAIL.Report.length > 0))) {
									let report3 = tk2.Data.DATA_DETAIL.Report;
									if (report3 != undefined && report3 != null && report3.length > 0) {
										SUM_TAM_UNG = report3.reduce(function (accumulator, pilot) {
											return accumulator + pilot.DEPOSIT_CASH;
										}, 0);
										console.log('loaded taichinh ' + new Date());
									}
								}
								this.hideSpinner('spinner/taichinh');
								md.reportdata = this.ConvertToStringShow((SUM_TT_RA_VIEN + SUM_THU_TRUC_TIEP));
								md.reportdataext4 = "Doanh thu ra viện: " + this.ConvertToStringShow((SUM_TT_RA_VIEN));
								md.url4 = "/#/chitietdoanhthu";
								md.reportdataext5 = "Doanh thu trực tiếp: " + this.ConvertToStringShow((SUM_THU_TRUC_TIEP));
								md.url5 = "/#/chitietdoanhthu";
								md.reportdataext6 = "TẠM ỨNG: " + this.ConvertToStringShow(SUM_TAM_UNG);
								md.url6 = "/#/chitiettamung";
								md.reportdataext7 = "Đơn vị: Đồng";
								if (tk1 != undefined && tk1 != null && tk1.Success && tk1.Data != undefined && tk1.Data.SINGER_DATA != undefined && tk1.Data.SINGER_DATA.ReportDate != undefined && tk1.Data.SINGER_DATA.ReportDate != null) {
									md.reportdate = "Cập nhật: " + tk1.Data.SINGER_DATA.ReportDate;
								}
								md.loading = 0;

							});
						});
					});
				}
				else if (allowReportTemplateCodes.includes('MRS0024901')) {
					md.url = "/taichinh";
					this.homeService.delay(100);
					console.log('loading taichinh ' + new Date());

					let SUM_TT = 0;
					let SUM_TAM_UNG_DV = 0;
					let SUM_TAM_UNG = 0;
					let SUM_HOAN_UNG = 0;
					this.showSpinner('spinner/taichinh');
					let srpt5 = new SearchReport();
					srpt5.TIME_TO = this.timeto;
					srpt5.TIME_FROM = this.timefrom;
					srpt5.ReportTypeCode = "MRS00249";
					srpt5.ReportTemplateCode = "MRS0024901";
					this.homeService.loadDataReport(srpt5).subscribe(tk => {
						if (tk != undefined && tk != null && tk.Success && tk.Data != undefined && tk.Data.DATA_DETAIL != undefined && ((tk.Data.DATA_DETAIL.ReportSum != undefined && tk.Data.DATA_DETAIL.ReportSum.length > 0))) {
							let report1 = tk.Data.DATA_DETAIL.ReportSum;
							if (report1 != undefined && report1 != null && report1.length > 0) {
								SUM_TT = report1.reduce(function (accumulator, pilot) {
									if (pilot.TRANSACTION_TYPE_CODE === 'TT') {
										return accumulator + Number(pilot.AMOUNT);
									}
									else {
										return accumulator;
									}

								}, 0);
								SUM_TAM_UNG_DV = report1.reduce(function (accumulator, pilot) {
									if (pilot.TRANSACTION_TYPE_CODE == 'TU' && pilot.IS_DEPOSIT_DETAIL == true) {
										return accumulator + Number(pilot.AMOUNT);
									}
									else {
										return accumulator;
									}
								}, 0);
								SUM_TAM_UNG = report1.reduce(function (accumulator, pilot) {
									if (pilot.TRANSACTION_TYPE_CODE == 'TU' && pilot.IS_DEPOSIT_DETAIL == false) {
										return accumulator + Number(pilot.AMOUNT);
									}
									else {
										return accumulator;
									}
								}, 0);
								SUM_HOAN_UNG = report1.reduce(function (accumulator, pilot) {
									if (pilot.TRANSACTION_TYPE_CODE == 'HU') {
										return accumulator + Number(pilot.AMOUNT);
									}
									else {
										return accumulator;
									}
								}, 0);

								console.log('loaded taichinh ' + new Date());
							}
						}
						this.hideSpinner('spinner/taichinh');
						md.reportdata = this.ConvertToStringShow(Number(SUM_TT) + Number(SUM_TAM_UNG) + Number(SUM_TAM_UNG_DV) - Number(SUM_HOAN_UNG));
						md.reportdataext4 = "Thanh toán: " + this.ConvertToStringShow((SUM_TT));
						md.url4 = "/#/taichinh";
						md.reportdataext5 = "Tạm thu dịch vụ: " + this.ConvertToStringShow((SUM_TAM_UNG_DV));
						md.url5 = "/#/taichinh";
						md.reportdataext6 = "Tạm ứng: " + this.ConvertToStringShow(SUM_TAM_UNG);
						md.url6 = "/#/taichinh";
						md.reportdataext7 = "Đơn vị: Đồng";
						if (tk != undefined && tk != null && tk.Success && tk.Data != undefined && tk.Data.SINGER_DATA != undefined && tk.Data.SINGER_DATA.ReportDate != undefined && tk.Data.SINGER_DATA.ReportDate != null) {
							md.reportdate = "Cập nhật: " + tk.Data.SINGER_DATA.ReportDate;
						}
						md.loading = 0;
					});
				}


			}
			else if (md.url == "/trungbinhkham" ) {

			}


		});

		//this.loadBedRatio();
	}

	onHidden(): void {
		console.log('Dropdown is hidden');
	}
	onShown(): void {
		console.log('Dropdown is shown');
	}
	isOpenChange(): void {
		console.log('Dropdown state is changed');
	}

	ClickSearch(value: number) {
		this.SearchFor = value;

		//TODO
		if (this.SearchFor == 0) {
			this.timefrom = '';
			this.timeto = '';
		}
		if (this.SearchFor == 1) {//Hôm nay
			let now = new Date();
		}
		if (this.SearchFor == 2) {//Tuần này
			let now = new Date();
			let now1 = new Date();
			now1.setDate(now1.getDate() - now1.getDay() + 1);
			if (now1.getDate() <= now.getDate()) {
			}
			else {
			}
		}
		if (this.SearchFor == 3) {//Tháng này
			let now = new Date();
			let now1 = new Date();
			now.setFullYear(now.getFullYear(), now.getMonth(), 1);
			now1.setFullYear(now1.getFullYear(), now1.getMonth(), 1);
			now1.setMonth(now1.getMonth() + 1);
			now1.setDate(now1.getDate() - 1);
		}
		if (this.SearchFor == 4) {//Năm nay
			let now = new Date();
			let now1 = new Date();
			now.setFullYear(now.getFullYear(), 0, 1);
			now1.setFullYear(now1.getFullYear() + 1, 0, 1);
			now1.setDate(now1.getDate() - 1);
		}
		if (this.SearchFor == 5) {//Hôm qua
			let now = new Date();
			now.setDate(now.getDate() - 1);
		}
		if (this.SearchFor == 6) {//Tháng trước
			let now = new Date();
			let now1 = new Date();

			if (now.getMonth() == 0) {
				now.setFullYear(now.getFullYear() - 1, 11, 1);
				now1.setFullYear(now1.getFullYear() - 1, 11, 1);
			}
			else {
				now.setFullYear(now.getFullYear(), now.getMonth() - 1, 1);
				now1.setFullYear(now1.getFullYear(), now1.getMonth() - 1, 1);
			}
			//now.setFullYear(now.getFullYear(), now.getMonth(), 1);
			//now1.setFullYear(now1.getFullYear(), now1.getMonth(), 1);
			now1.setMonth(now1.getMonth() + 1);
			now1.setDate(now1.getDate() - 1);
		}
		if (this.SearchFor == 7) {//Năm trước
			let now = new Date();
			let now1 = new Date();

			now.setFullYear(now.getFullYear() - 1, 0, 1);

			now1.setFullYear(now1.getFullYear(), 0, 1);
			now1.setDate(now1.getDate() - 1);
		}
		this.searchRangeDate = this.convertDateStringToDateRange(this.timefrom, this.timeto);
		this.setReportDataMenu();
	}

	loadMenuProfile() {
		const authorizeResultData = localStorage.getItem('AuthorizeResultData');
		if (authorizeResultData != undefined && authorizeResultData != null && authorizeResultData != '') {
			this.navItems = JSON.parse(authorizeResultData);
			console.log(this.navItems);
			this.setReportDataMenu();
		}
		else {
			this.navItems = new Array<MenuModel>();
			this.menuService.loadMenu().subscribe(tk => {
				//console.log(tk);
				if (tk != null && tk.Data != null && tk.Data.ModuleInRoles != null && tk.Data.ModuleInRoles.length > 0) {
					tk.Data.ModuleInRoles.forEach(md => {
						if (md.IS_VISIBLE === 1 && md.NUM_ORDER>0) {
							let d = new MenuModel();
							d.number_order = md.NUM_ORDER;
							d.name = md.MODULE_NAME;
							//d.IS_VISIBLE = md.IS_VISIBLE;
							d.url = md.MODULE_LINK;
							d.icon = md.ICON_LINK;
							if (d.url == "/taichinh" || d.url == "/dangnamvien")
								d.isparenturl = 0;
							else
								d.isparenturl = 1;
							d.cssname = md.MODULE_URL;
							d.reportdata = null;//TODO
							d.loading = 1;//TODO
							let x = this.navItems.filter(o => o.url == md.MODULE_LINK);
							if (x.length <= 0) {
								this.navItems.push(d);
							}
						}
					});
	
					this.navItems = this.navItems.sort((obj1, obj2) => {
	
						if (obj1.name > obj2.name) {
							return 1;
						}
	
						if (obj1.name < obj2.name) {
							return -1;
						}
	
						return 0;
					});
					this.navItems = this.navItems.sort((obj1, obj2) => {
						if (obj1.number_order < obj2.number_order) {
							return 1;
						}
	
						if (obj1.number_order > obj2.number_order) {
							return -1;
						}
	
						return 0;
					});
	
					this.setReportDataMenu();
				}
			});
		}
		var navItemChooses = this.navItems.filter(o => o.number_order>0);
		this.navItems = navItemChooses;
	}
	// set language of datepicker
	setDatepickerLanguage() {
		defineLocale('vi', viLocale);
		this.localeService.use('vi');
	}
	dtFromTimeChange(value: string) {
		console.log(value);
		this.timefromBedRatio = this.convertDateStringToDateNumber1(value, true);
		console.log(this.timefromBedRatio);
	}

	dtToTimeChange(value: string) {
		console.log(value);
		this.timetoBedRatio = this.convertDateStringToDateNumber1(value, false);
		console.log(this.timetoBedRatio);
	}

	changePrecious(value) {
		// Quý 1 của năm là từ tháng 1 tới hết tháng 3
		// Quý 2 của năm là từ tháng 4 tới hết tháng 6
		// Quý 3 của năm là từ tháng 7 tới hết tháng 9
		// Quý 4 của năm là từ tháng 10 tới hết tháng 12
		this.currentPrecious = value;
		let now = new Date();
		let now1 = new Date();
		if (this.currentYear == undefined || this.currentYear == null || this.currentYear == '') {
			this.currentYear = now.getFullYear().toString();
		}

		if (this.currentPrecious == '1') {
			now.setFullYear(parseInt(this.currentYear), 0, 1);
			now1.setFullYear(parseInt(this.currentYear), 3, 1);
			now1.setDate(now1.getDate() - 1);
		}
		else if (this.currentPrecious == '2') {
			now.setFullYear(parseInt(this.currentYear), 3, 1);
			now1.setFullYear(parseInt(this.currentYear), 6, 1);
			now1.setDate(now1.getDate() - 1);
		}
		else if (this.currentPrecious == '3') {
			now.setFullYear(parseInt(this.currentYear), 6, 1);
			now1.setFullYear(parseInt(this.currentYear), 9, 1);
			now1.setDate(now1.getDate() - 1);
		}
		else if (this.currentPrecious == '4') {
			now.setFullYear(parseInt(this.currentYear), 9, 1);
			now1.setFullYear(now1.getFullYear() + 1, 0, 1);
			now1.setDate(now1.getDate() - 1);
		}

		this.DefaultFromDateBedRatioShow = this.formatDatetoStringInputDate(now);
		this.DefaultToDateBedRatioShow = this.formatDatetoStringInputDate(now1);

		console.log('value=' + value + '|currentPrecious=' + this.currentPrecious + '|DefaultFromDateBedRatioShow=' + this.DefaultFromDateBedRatioShow + '|DefaultToDateBedRatioShow=' + this.DefaultToDateBedRatioShow);
	}

	changeYear(value) {
		console.log(value);

		this.currentYear = value;
		if (this.currentPrecious != undefined && this.currentPrecious != null && this.currentPrecious != '') {
			this.changePrecious(this.currentPrecious);
		}
	}

	getBedRatioReality1(BedRatioData): string {
		let result = '';
		if (BedRatioData != undefined && BedRatioData != null) {
			result = this.roundNumber((BedRatioData?.BED_NUM_BHYT / BedRatioData?.NUM_DAY / BedRatioData?.REALITY_PATIENT_COUNT_BH * 100), 2) + '';
		}
		return result + '%';
	}
	getBedRatioReality2(BedRatioData): string {
		let result = '';
		if (BedRatioData != undefined && BedRatioData != null) {
			result = this.roundNumber((BedRatioData?.BED_NUM / BedRatioData?.NUM_DAY / BedRatioData?.REALITY_PATIENT_COUNT * 100), 2) + '';
		}
		return result + '%';
	}

	getBedRatioReality3(BedRatioData): string {
		let result = '';
		if (BedRatioData != undefined && BedRatioData != null) {
			result = this.roundNumber((BedRatioData?.BED_NUM_BHYT / BedRatioData?.NUM_DAY / BedRatioData?.THEORY_PATIENT_BED_BH * 100), 2) + '';
		}
		return result + '%';
	}
	getBedRatioReality4(BedRatioData): string {
		let result = '';
		if (BedRatioData != undefined && BedRatioData != null) {
			result = this.roundNumber((BedRatioData?.BED_NUM / BedRatioData?.NUM_DAY / BedRatioData?.THEORY_PATIENT_BED * 100), 2) + '';
		}
		return result + '%';
	}

	// roundNumber(num, scale) {    
	// if(scale!=undefined && scale!=null){	
	// //return (Math.round(num + "e+" + scale.toString())  + "e-" + scale.toString());
	// return +(Math.round(num + "e+2")  + "e-2");
	// }
	// else{
	// return (Math.round(num));
	// }
	// }

	/**
	 * Converts num to a decimal string (if it isn't one already) and then rounds it
	 * to at most dp decimal places.
	 *
	 * For explanation of why you'd want to perform rounding operations on a String
	 * rather than a Number, see http://stackoverflow.com/a/38676273/1709587
	 *
	 * @param {(number|string)} num
	 * @param {number} dp
	 * @return {string}
	 */
	roundNumber(num, dp) {
		//if (arguments.length != 2) throw new Error("2 arguments required");

		num = String(num);
		if (num.indexOf('e+') != -1) {
			// Can't round numbers this large because their string representation
			// contains an exponent, like 9.99e+37
			throw new Error("num too large");
		}
		if (num.indexOf('.') == -1) {
			// Nothing to do
			return num;
		}

		var parts = num.split('.'),
			beforePoint = parts[0],
			afterPoint = parts[1],
			shouldRoundUp = afterPoint[dp] >= 5,
			finalNumber;

		afterPoint = afterPoint.slice(0, dp);
		if (!shouldRoundUp) {
			finalNumber = beforePoint + '.' + afterPoint;
		} else if (/^9+$/.test(afterPoint)) {
			// If we need to round up a number like 1.9999, increment the integer
			// before the decimal point and discard the fractional part.
			finalNumber = Number(beforePoint) + 1;
		} else {
			// Starting from the last digit, increment digits until we find one
			// that is not 9, then stop
			var i = dp - 1;
			while (true) {
				if (afterPoint[i] == '9') {
					afterPoint = afterPoint.substr(0, i) +
						'0' +
						afterPoint.substr(i + 1);
					i--;
				} else {
					afterPoint = afterPoint.substr(0, i) +
						(Number(afterPoint[i]) + 1) +
						afterPoint.substr(i + 1);
					break;
				}
			}

			finalNumber = beforePoint + '.' + afterPoint;
		}

		// Remove trailing zeroes from fractional part before returning
		return finalNumber.replace(/0+$/, '')
	}

	// roundNumber1(num, scale) {
	// if(!("" + num).includes("e")) {
	// return +(Math.round(num + "e+" + scale)  + "e-" + scale);
	// } else {
	// var arr = ("" + num).split("e");
	// var sig = ""
	// if(+arr[1] + scale > 0) {
	// sig = "+";
	// }
	// return +(Math.round(+arr[0] + "e" + sig + (+arr[1] + scale)) + "e-" + scale);
	// }
	// }

	loadBedRatio() {
		console.log('loadBedRatio');
		let srpt4 = new SearchReport();
		srpt4.TIME_TO = this.timetoBedRatio;
		srpt4.TIME_FROM = this.timefromBedRatio;
		srpt4.ReportTypeCode = "TKB00061";
		srpt4.ReportTemplateCode = "TKB0006101";
		this.thoigianthongke = '';
		this.loading0 = true;
		console.log(srpt4);
		this.homeService.loadDataReportMrs(srpt4).subscribe(tk => {
			let BedRatioDatas = null;
			if (tk != undefined && tk != null && tk.Success && tk.Data != undefined && tk.Data.DATA_DETAIL != undefined && tk.Data.DATA_DETAIL.Report0 != undefined && tk.Data.DATA_DETAIL.Report0.length > 0) {
				BedRatioDatas = tk.Data.DATA_DETAIL.Report0;
				this.BedRatioData = tk.Data.DATA_DETAIL.Report0[0];
				this.HaveData = 1;
			}
			else {
				this.HaveData = 0;
				this.BedRatioData = null;
			}
			this.loading0 = false;
			console.log(this.BedRatioData);
			console.log(BedRatioDatas);
		});
	}


}