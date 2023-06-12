import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

// Import Containers
import { DefaultLayoutComponent } from './containers';
import { EmptyLayoutComponent } from './containers/empty-layout';
import { P404Component } from './modules/error/404.component';
import { P500Component } from './modules/error/500.component';
import { AuthGuard } from './authen/authen.guard';
import { AppConfig } from './config/app.config';

export const routes: Routes = [
  {
    path: '',
    redirectTo: AppConfig.routes.default,
    pathMatch: 'full',
    canActivate: [AuthGuard]
  },
  {
    path: '',
    component: EmptyLayoutComponent,
    data: {
      title: 'Other Page'
    },
    children: [
      {
        path: 'login',
        loadChildren: () => import('./modules/home/home.module').then(m => m.TrangChuModule)
      },
      {
        path: 'Trang chủ',
        loadChildren: () => import('./modules/home/home.module').then(m => m.TrangChuModule)
      },
    ]
  },
  {
    path: '404',
    component: P404Component,
    data: {
      title: 'Page 404'
    }
  },
  {
    path: '500',
    component: P500Component,
    data: {
      title: 'Page 500'
    }
  },
  {
    path: '',
    component: DefaultLayoutComponent,
    data: {
      title: 'Trang chủ'
    },
    children: [
      {
        path: 'home',
        loadChildren: () => import('./modules/home/home.module').then(m => m.TrangChuModule)
      },
     
    ],
    // canActivate: [AuthGuard]
  }

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
