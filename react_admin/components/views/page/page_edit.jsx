
import React from 'react';

import GenericDeco from '../../../decorators/generic_deco';

import PageActions from '../../../flux/actions/page_actions';
import PageStore from '../../../flux/stores/page_store';

import AdminBodyTitle from '../../subcomponents/admin_body_title';
import AdminBodyTopLinks from '../../subcomponents/admin_body_top_links';
import AdminBodyBottomLinks from '../../subcomponents/admin_body_bottom_links';
import PageForm from './page_form';


class PageEdit extends React.Component {

    constructor(...props) {
        super(...props);

        this._onChange = this._onChange.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);

        this.state = {
            resource: undefined,
        };
    }

    // FLUX boilerplate
    componentWillMount() {
        PageStore.addChangeListener(this._onChange);
    }

    // FLUX boilerplate
    componentWillUnmount() {
        PageStore.removeChangeListener(this._onChange);
    }

    _onChange() {
        this.setState({ resource: PageStore.getPage() });
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
};

PageEdit = GenericDeco(PageEdit);
export default PageEdit;