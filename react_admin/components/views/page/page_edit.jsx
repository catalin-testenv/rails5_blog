
import React from 'react';
import AdminBodyTitle from '../../subcomponents/admin_body_title';
import AdminBodyTopLinks from '../../subcomponents/admin_body_top_links';
import AdminBodyBottomLinks from '../../subcomponents/admin_body_bottom_links';

class PageEdit extends React.Component {

    constructor(...props) {
        super(...props);
        this.state = {
            resource: undefined,
        };
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

    render() {
        let links = [
            {to: Routes.admin_pages_path(), name: 'List'}
        ];
        this.state.resource && links.push({to: Routes.page_path(`${this.state.resource.id}-${this.state.resource.name.replace(/\s+/g, '_')}`), name: 'Preview', target: "_blank"});

        return (
            <div>
                <AdminBodyTitle>Edit</AdminBodyTitle>
                <AdminBodyTopLinks links={links} {...this.props} />

                <div style={{height: 500}}>

                </div>

                <AdminBodyBottomLinks links={links} {...this.props} />
            </div>
        );
    }
};

export default PageEdit;