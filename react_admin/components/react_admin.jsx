'use strict';

import React from 'react';

import GenericDeco from '../decorators/generic_deco';
import FluxRegisteredDeco from '../decorators/flux_registered_deco';

import PageActions from '../flux/actions/page_actions';
import PassthroughStore from '../flux/stores/passthrough_store';

import AdminMainNavigation from './admin_main_navigation';
import { AdminMainLinks } from './admin_routes';

import Notification from './subcomponents/notification';

class ReactAdmin extends React.Component {

    constructor(...props) {
        super(...props);
        this.state = {message: undefined, type: undefined};
    }

    _onChange(actionType, data) {
        if (actionType.match(/_(UPDATED|CREATED|DESTROYED)$/)) {
            this.setState({message: data.message, type: 'success'})
        } else if (actionType.match(/_ERROR$/)) {
            this.setState({message: data.message, type: 'danger' })
        } else {
            this.setState({message: undefined, type: undefined})
        }
    }

    render() {

        let notification = this.state.message ? (
            <div id="admin-notice-alert">
                <Notification type={this.state.type}>{this.state.message}</Notification>
            </div>) : null;

        return (
            <div className="uk-grid">
                <div id="admin-main-navigation" className="uk-width-medium-1-5 uk-padding-remove">
                    <AdminMainNavigation links={AdminMainLinks} {...this.props} />
                </div>
                <div className="uk-width-medium-4-5 uk-padding-remove">
                    {notification}
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

ReactAdmin = GenericDeco(ReactAdmin);
ReactAdmin = FluxRegisteredDeco([PassthroughStore])(ReactAdmin);

export default ReactAdmin;