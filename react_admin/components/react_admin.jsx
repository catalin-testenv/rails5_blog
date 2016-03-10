'use strict';

import React from 'react';
import AdminMainNavigation from './admin_main_navigation';
import { AdminMainLinks } from './admin_routes';

class ReactAdmin extends React.Component {
    render() {
        return (
            <div className="uk-grid">
                <div id="admin-main-navigation" className="uk-width-medium-1-5 uk-padding-remove">
                    <AdminMainNavigation links={AdminMainLinks} {...this.props} />
                </div>
                <div className="uk-width-medium-4-5 uk-padding-remove">
                    <div id="admin-body">
                        <div className="uk-panel uk-panel-box">
                            <div className="uk-panel uk-panel-box panel-box-material" {...this.props} />
                        </div>
                    </div>
                </div>
            </div>
        );
    }
};

export default ReactAdmin;