
import React from 'react';

import GenericDeco from '../../../decorators/generic_deco';
import FluxRegisteredDeco from '../../../decorators/flux_registered_deco';

import PageActions from '../../../flux/actions/page_actions';
import PassthroughStore from '../../../flux/stores/passthrough_store';

import ActionTypes from '../../../constants/action_types';

import AdminBodyTitle from '../../subcomponents/admin_body_title';
import AdminBodyTopLinks from '../../subcomponents/admin_body_top_links';
import AdminBodyBottomLinks from '../../subcomponents/admin_body_bottom_links';
import PageForm from './page_form';


class PageEdit extends React.Component {

    constructor(...props) {
        super(...props);

        this.handleSubmit = this.handleSubmit.bind(this);

        this.state = {
            resource: undefined,
        };
    }

    _onChange(actionType, data) {
        if (actionType !== ActionTypes.PAGE_READY) { return; }
        this.setState({ resource: data.page });
    }

    componentDidMount() {
        PageActions.getPage(this.props.params.id);
    }

    handleSubmit(pageData) {
        PageActions.updatePage(this.props.params.id, pageData);
    }

    render() {
        let resource = this.state.resource;
        if(!resource) { return <div />; }

        let links = [
            {to: Routes.admin_pages_path(), name: 'List'},
            {to: Routes.page_path(`${resource.id}-${resource.name.replace(/\s+/g, '_')}`), name: 'Preview', target: "_blank"},
            {to: Routes.admin_page_path(resource), name: 'Destroy', 'data-method': 'delete',  'data-confirm': 'Are you sure?'},
        ];

        return (
            <div>
                <AdminBodyTitle>Edit</AdminBodyTitle>
                <AdminBodyTopLinks links={links} {...this.props} />

                <PageForm onSubmit={this.handleSubmit} resource={resource} />

                <AdminBodyBottomLinks links={links} {...this.props} />
            </div>
        );
    }
}

PageEdit = GenericDeco(PageEdit);
PageEdit = FluxRegisteredDeco([PassthroughStore])(PageEdit);
export default PageEdit;