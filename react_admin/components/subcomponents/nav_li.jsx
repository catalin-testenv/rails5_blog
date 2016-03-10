import React from 'react';
import { Link } from 'react-router';

class NavLi extends React.Component {
    render() {
        return (
            <li className={this.props.location.pathname.startsWith(this.props.to) ? 'uk-active' : ''}>
                <Link {...this.props} />
            </li>
        );
    }
};

export default NavLi;