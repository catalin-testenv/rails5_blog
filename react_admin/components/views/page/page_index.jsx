
import React from 'react';

import { Link } from 'react-router';

import GenericDeco from '../../../decorators/generic_deco';

import PageActions from '../../../flux/actions/page_actions';
import PageStore from '../../../flux/stores/page_store';

import AdminBodyTitle from '../../subcomponents/admin_body_title';
import AdminBodyTopLinks from '../../subcomponents/admin_body_top_links';
import AdminBodyBottomLinks from '../../subcomponents/admin_body_bottom_links';

class PageIndex extends React.Component {

    constructor(...props) {
        super(...props);

        this._onChange = this._onChange.bind(this);

        this.state = {
            pageList: [],
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
        this.setState({ pageList: PageStore.getPageList() });
    }

    componentDidMount() {
        PageActions.getPageList();
    }

    render() {

        let pageList = this.state.pageList;
        if(pageList.length === 0) { return <div />; }

        let links = [
            {to: Routes.new_admin_page_path(), name: 'New'}
        ];

        let rows = pageList.map((resource) => {
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
                <AdminBodyTopLinks links={links} {...this.props} />

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

                <AdminBodyBottomLinks links={links} {...this.props} />
            </div>
        );
    }
};

PageIndex = GenericDeco(PageIndex);
export default PageIndex;
