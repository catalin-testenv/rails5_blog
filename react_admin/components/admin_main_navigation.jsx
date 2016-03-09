'use strict';

import React from 'react';

class AdminMainNavigation extends React.Component {
    render() {
        return (
            <div className="uk-panel uk-panel-box">
                <h4 className="uk-panel-title">Administration</h4>
                <ul className="uk-nav uk-nav-side">
                    <li className={window.location.hash.match(/^#\/pages/) ? 'uk-active' : ''}><a href="#/pages">Pages</a></li>
                    <li className={window.location.hash.match(/^#\/other/) ? 'uk-active' : ''}><a href="#/other">Other</a></li>
                </ul>
            </div>
        );
    }
};

export default AdminMainNavigation;