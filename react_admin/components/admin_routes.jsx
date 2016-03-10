
import React from 'react';
import { Router, Route, hashHistory, browserHistory, IndexRoute  } from 'react-router';

import ReactAdmin from './react_admin';
import Dashboard from './views/dashboard/dashboard';
import PageIndex from './views/page/page_index';
import PageNew from './views/page/page_new';
import PageEdit from './views/page/page_edit';
import PageCategoryIndex from './views/page_category/page_category_index';

export const AdminMainLinks = [
    {to: Routes.admin_pages_path(), name: 'Pages'},
    {to: '/admin/page_categories', name: 'Page Categories'},
];

export const AdminRoutes = (
    <Router history={browserHistory}>
        <Route path={Routes.admin_root_path.toString()} component={ReactAdmin}>
            <IndexRoute component={Dashboard} />
            <Route path={Routes.admin_pages_path.toString()} component={PageIndex} />
            <Route path={Routes.new_admin_page_path.toString()} component={PageNew} />
            <Route path={Routes.edit_admin_page_path.toString()} component={PageEdit} />
            <Route path="page_categories" component={PageCategoryIndex} />
        </Route>
    </Router>
);
