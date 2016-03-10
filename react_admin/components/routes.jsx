
import React from 'react';
import { Router, Route, hashHistory, browserHistory, IndexRoute  } from 'react-router';

import ReactAdmin from './react_admin';
import Pages from './pages';
import Dashboard from './dashboard';
import PageCategories from './page_categories';

export const MainLinks = [
    {to: '/admin/pages', name: 'Pages'},
    {to: '/admin/page_categories', name: 'Page Categories'},
];

export const Routes = (
    <Router history={browserHistory}>
        <Route path="/admin" component={ReactAdmin}>
            <IndexRoute component={Dashboard} />
            <Route path="pages" component={Pages} />
            <Route path="page_categories" component={PageCategories} />
        </Route>
    </Router>
);
