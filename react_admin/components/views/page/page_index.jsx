
import React from 'react';
import { Link } from 'react-router';
import Api from '../../../services/api';
import AdminBodyTitle from '../../subcomponents/admin_body_title';
import AdminBodyTopLinks from '../../subcomponents/admin_body_top_links';
import AdminBodyBottomLinks from '../../subcomponents/admin_body_bottom_links';

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
        let promise = Api.getAllPages();
        promise.then((data) => {
            this.setState({resource_list: data});
        }).catch((jqXHR, textStatus, errorThrown) => {
            console.error(jqXHR.status, jqXHR.statusText);
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
                <AdminBodyTitle>List</AdminBodyTitle>
                <AdminBodyTopLinks links={[{to: Routes.new_admin_page_path(), name: 'New'}]} {...this.props} />

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

                <AdminBodyBottomLinks links={[{to: Routes.new_admin_page_path(), name: 'New'}]} {...this.props} />
            </div>
        );
    }
};

export default PageIndex;
