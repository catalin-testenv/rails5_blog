
import React from 'react';
import { Router, Route, hashHistory, browserHistory, IndexRoute  } from 'react-router';

import ReactAdmin from './react_admin';
import Pages from './domains/page/pages';
import Dashboard from './domains/dashboard/dashboard';
import PageCategories from './domains/page_category/page_categories';

export const AdminMainLinks = [
    {to: Routes.admin_pages_path(), name: 'Pages'},
    {to: '/admin/page_categories', name: 'Page Categories'},
];

export const AdminRoutes = (
    <Router history={browserHistory}>
        <Route path={Routes.admin_root_path()} component={ReactAdmin}>
            <IndexRoute component={Dashboard} />
            <Route path={Routes.admin_pages_path()} component={Pages} />
            <Route path="page_categories" component={PageCategories} />
        </Route>
    </Router>
);
