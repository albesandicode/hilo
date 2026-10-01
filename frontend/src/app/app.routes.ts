import { Routes } from '@angular/router';
import { Timeline } from './features/timeline/timeline';

export const routes: Routes = [
  { path: '', component: Timeline, title: 'Hilo' },
  { path: '**', redirectTo: '' },
];
