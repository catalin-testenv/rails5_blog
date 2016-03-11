
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
        this.state.resource && links.push({to: Routes.admin_page_path(this.state.resource), name: 'Destroy', 'data-method': 'delete',  'data-confirm': 'Are you sure?'});

        return (
            <div>
                <AdminBodyTitle>Edit</AdminBodyTitle>
                <AdminBodyTopLinks links={links} {...this.props} />


                <form className="edit_page uk-form uk-form-stacked custom-cc custom-cc-fa">
                   <div className="uk-grid uk-grid-small" data-uk-grid-margin>
                       <div className="uk-width">
                           <div className="uk-grid uk-grid-small" data-uk-grid-margin>
                               <div className="uk-width-medium-1-2">
                                   <div className="uk-form-row">
                                       <label className="uk-form-label" htmlFor="page_name">Title</label>
                                       <div className="uk-form-controls">
                                           <input className="uk-width" type="text" value="page first" name="page[name]" id="page_name" />
                                       </div>
                                   </div>
                               </div>
                               <div className="uk-width-medium-1-2">
                                   <div className="uk-form-row">
                                       <label className="uk-form-label" htmlFor="page_parent_id">Categorie ID</label>
                                       <div className="uk-form-controls">
                                           <select className="uk-width" name="page[parent_id]" id="page_parent_id">
                                               <option selected="selected" value="0">radacina</option>
                                               <option value="24">movies</option>
                                               <option value="29">gallery</option>
                                               <option value="25">comedy</option>
                                               <option value="26">fantasy</option>
                                               <option value="27">black</option>
                                               <option value="28">white</option>
                                               <option value="32">web design</option>
                                               <option value="31">vectorial</option>
                                               <option value="30">photoshop</option>
                                               <option value="33">digital art</option>
                                               <option value="36">illustrator</option>
                                               <option value="37">corel</option>
                                               <option value="34">photo retouch</option>
                                               <option value="35">pictures</option>
                                           </select>
                                       </div>
                                   </div>
                               </div>
                               <div className="uk-width-medium-1-2">
                                   <div className="uk-form-row">
                                       <label className="uk-form-label" htmlFor="page_ordering">Ordonare</label>
                                       <div className="uk-form-controls">
                                           <input className="uk-width" type="text" value="0" name="page[ordering]" id="page_ordering" />
                                       </div>
                                   </div>
                               </div>
                               <div className="uk-width-medium-1-2">
                                   <div className="uk-form-row">
                                       <label className="uk-form-label" htmlFor="page_max_comments">Comentarii max</label>
                                       <div className="uk-form-controls">
                                           <input className="uk-width" type="text" value="50" name="page[max_comments]" id="page_max_comments" />
                                       </div>
                                   </div>
                               </div>
                           </div>
                       </div>
                   </div>
                </form>


                <AdminBodyBottomLinks links={links} {...this.props} />
            </div>
        );
    }
};

export default PageEdit;