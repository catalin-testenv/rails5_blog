import React from 'react';
import { Link } from 'react-router';

class NavLi extends React.Component {
    render() {
        return (
            <li className={_.startsWith(this.props.location.pathname, this.props.to) ? 'uk-active' : ''}>
                <Link {...this.props} />
            </li>
        );
    }
};

export default NavLi;