
import React from 'react';
import { Link } from 'react-router';

class PageIndex extends React.Component {

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
                            <li><Link to={Routes.page_path(`${resource.id}-${resource.name.replace(/\s+/g, '_')}`)} target="_blank">Preview</Link></li>
                            <li><Link to={Routes.edit_admin_page_path(resource)}>Edit</Link></li>
                            <li><Link to={Routes.admin_page_path(resource)} data-method="delete" data-confirm="Are you sure?">Destroy</Link></li>
                        </ul>
                    </td>
                </tr>
            );
        });

        return (
            <div>
                <h4 className="uk-panel-title">List</h4>

                <div>
                    <ul className="uk-subnav uk-subnav-line uk-link-unmuted">
                        <li><Link to={Routes.new_admin_page_path()}>New</Link></li>
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
                        <li className="uk-margin-top-remove"><Link to={Routes.new_admin_page_path()}>New</Link></li>
                    </ul>
                </div>
            </div>
        );
    }
};

export default PageIndex;
