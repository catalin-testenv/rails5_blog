
import React from 'react';
import NavLi from './nav_li'

class AdminBodyBottomLinks extends React.Component {
    render() {
        let links = this.props.links.map((link) => {
            return <NavLi key={link.to} {...link} {...this.props}>{link.name}</NavLi>
        });
        return (
            <div>
                <hr className="uk-grid-divider uk-margin-bottom-remove cancel-panel-box-horizontal-padding" />
                <ul className="uk-subnav uk-subnav-line uk-margin-bottom-remove uk-margin-top-remove uk-link-unmuted">
                    {links}
                </ul>
            </div>
        );
    }
};

export default AdminBodyBottomLinks;