'use strict';

import ReactDOM from 'react-dom';

import { AdminRoutes } from './components/admin_routes';

$(() => ReactDOM.render(
    AdminRoutes,
    document.querySelector('#react-admin')
));