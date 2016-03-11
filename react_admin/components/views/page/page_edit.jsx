
import React from 'react';
import AdminBodyTitle from '../../subcomponents/admin_body_title';
import AdminBodyTopLinks from '../../subcomponents/admin_body_top_links';
import AdminBodyBottomLinks from '../../subcomponents/admin_body_bottom_links';
import PageForm from './page_form';

const MODEL = 'page';

class PageEdit extends React.Component {

    constructor(...props) {
        super(...props);
        this.state = {
            resource: undefined,
        };
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    componentDidMount() {
        this.loadPage();
    }

    loadPage() {
        $.ajax({
            url: Routes.edit_admin_page_path(this.props.params.id, {format: 'json'}),
            method: 'GET',
            dataType: 'json',
        }).done((data) => {
            console.log(data);
            this.setState({resource: data});
        });
    }

    handleSubmit(data) {
        $.ajax({
            headers: {
                'X-CSRF-Token': Cookies.get('X-CSRF-Token').replace(/xxx-/, '')
            },
            url: Routes.admin_page_path(this.props.params.id, {format: 'json'}),
            method: 'PATCH',
            dataType: 'json',
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            data: data,
        }).done((data) => {
            console.log(data);
            this.setState({resource: data});
        }).fail((jqXHR, textStatus, errorThrown) => {
            console.error(`${textStatus} ${errorThrown}`);
            console.error(jqXHR.responseJSON);
        });
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

                <PageForm onSubmit={this.handleSubmit} model={MODEL} resource={resource} />

                <AdminBodyBottomLinks links={links} {...this.props} />
            </div>
        );
    }
};

export default PageEdit;