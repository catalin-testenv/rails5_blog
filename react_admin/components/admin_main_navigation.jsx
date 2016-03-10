'use strict';

import React from 'react';
import NavLi from './subcomponents/nav_li'

class AdminMainNavigation extends React.Component {
    render() {
        let links = this.props.links.map((link) => {
            return <NavLi key={link.to} to={link.to} {...this.props}>{link.name}</NavLi>
        });
        return (
            <div className="uk-panel uk-panel-box">
                <h4 className="uk-panel-title">Administration</h4>
                <ul className="uk-nav uk-nav-side">
                    {links}
                </ul>
            </div>
        );
    }
};

export default AdminMainNavigation;