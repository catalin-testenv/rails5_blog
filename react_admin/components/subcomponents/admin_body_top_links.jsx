
import React from 'react';
import NavLi from './nav_li'

class AdminBodyTopLinks extends React.Component {
    render() {
        let links = this.props.links.map((link) => {
            return <NavLi key={link.to} to={link.to} {...this.props}>{link.name}</NavLi>
        });
        return (
            <div>
                <ul className="uk-subnav uk-subnav-line uk-link-unmuted">
                    {links}
                </ul>
                <hr className="uk-grid-divider uk-margin-top-remove cancel-panel-box-horizontal-padding" />
            </div>
        );
    }
};

export default AdminBodyTopLinks;