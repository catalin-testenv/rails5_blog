'use strict';

import React from 'react';
import AdminMainNavigation from './admin_main_navigation';
import AdminBody from './admin_body';

class ReactAdmin extends React.Component {
    render() {
        return (
            <div className="uk-grid">
                <div id="admin-main-navigation" className="uk-width-medium-1-5 uk-padding-remove">
                    <AdminMainNavigation />
                </div>
                <div className="uk-width-medium-4-5 uk-padding-remove">
                    <div id="admin-body">
                        <AdminBody />
                    </div>
                </div>
            </div>
        );
    }
};

export default ReactAdmin;