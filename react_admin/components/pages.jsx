
import React from 'react';

class Pages extends React.Component {

    constructor(...props) {
        super(...props);
        this.state = {
            resource_list: [],
        };
    }

    componentDidMount() {
        this.loadPagesList();
    }

    loadPagesList() {
        $.ajax({
            url: Routes.admin_pages_path({format: 'json'}),
            method: 'GET',
            dataType: 'json',
        }).done((data) => {
            this.setState({resource_list: data});
        });
    }

    render() {

        let rows = this.state.resource_list.map((resource) => {
            return(
                <tr key={resource.id}>
                    <td>{resource.name}</td>
                    <td>
                        <ul className="uk-list uk-margin-bottom-remove">
                            <li><a href={Routes.page_path(`${resource.id}-${resource.name.replace(/\s+/g, '_')}`)} target="_blank">Preview</a></li>
                            <li><a href={Routes.edit_admin_page_path(resource)} >Edit</a></li>
                            <li><a href={Routes.admin_page_path(resource)} data-method="delete" data-confirm="Are you sure?" >Destroy</a></li>
                        </ul>
                    </td>
                </tr>
            );
        });

        return (
            <div>
                <h4 className="uk-panel-title">Pages</h4>

                <div>
                    <ul className="uk-subnav uk-subnav-line uk-link-unmuted">
                        <li><a href={Routes.new_admin_page_path()}>New Page</a></li>
                    </ul>
                </div>

                <hr className="uk-grid-divider uk-margin-top-remove cancel-panel-box-horizontal-padding" />

                <div className="uk-overflow-container">
                    <table className="uk-table uk-table-striped uk-table-hover uk-text-nowrap">
                        <thead>
                            <tr>
                                <th>Title</th>
                                <th colSpan="1"></th>
                            </tr>
                        </thead>

                        <tbody>
                            {rows}
                        </tbody>
                    </table>
                </div>

                <hr className="uk-grid-divider cancel-panel-box-horizontal-padding" />

                <div>
                    <ul className="uk-subnav uk-subnav-line uk-margin-bottom-remove uk-link-unmuted">
                        <li className="uk-margin-top-remove"><a href={Routes.new_admin_page_path()}>New Page</a></li>
                    </ul>
                </div>
            </div>
        );
    }
};

export default Pages;
