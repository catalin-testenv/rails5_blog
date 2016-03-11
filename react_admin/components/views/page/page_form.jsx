
import React from 'react';
import ReactDOM from 'react-dom';

class PageForm extends React.Component {

    constructor(...props) {
        super(...props);
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    handleSubmit(e) {
        e.preventDefault();
        const MODEL = this.props.model;
        let data = {
            [MODEL]: {
                name: ReactDOM.findDOMNode(this.refs[`${MODEL}_name`]).value,
                parent_id: ReactDOM.findDOMNode(this.refs[`${MODEL}_parent_id`]).value,
                ordering: ReactDOM.findDOMNode(this.refs[`${MODEL}_ordering`]).value,
                max_comments: ReactDOM.findDOMNode(this.refs[`${MODEL}_max_comments`]).value,
            }
        };
        this.props.onSubmit(data);
    }

    render() {
        const MODEL = this.props.model;
        const resource = this.props.resource;
        const page_categories_all = resource.page_categories_all;

        let pageCategories = [];
        for (let id in page_categories_all) {
            pageCategories.push(<option key={id} value={id}>{page_categories_all[id]}</option>)
        }

        return (
            <form className={`edit_${MODEL} uk-form uk-form-stacked custom-cc custom-cc-fa`} id={`edit_${MODEL}_${resource.id}`} onSubmit={this.handleSubmit} acceptCharset="UTF-8">
                <div className="uk-grid uk-grid-small" data-uk-grid-margin>
                    <div className="uk-width">
                        <div className="uk-grid uk-grid-small" data-uk-grid-margin>
                            <div className="uk-width-medium-1-2">
                                <div className="uk-form-row">
                                    <label className="uk-form-label" htmlFor={`${MODEL}_name`}>Title</label>
                                    <div className="uk-form-controls">
                                        <input className="uk-width" type="text" defaultValue={resource.name} name={`${MODEL}[name]`} id={`${MODEL}_name`} ref={`${MODEL}_name`} />
                                    </div>
                                </div>
                            </div>
                            <div className="uk-width-medium-1-2">
                                <div className="uk-form-row">
                                    <label className="uk-form-label" htmlFor={`${MODEL}_parent_id`}>Category ID</label>
                                    <div className="uk-form-controls">
                                        <select defaultValue={resource.parent_id} className="uk-width" name={`${MODEL}[parent_id]`} id={`${MODEL}_parent_id`} ref={`${MODEL}_parent_id`}>
                                            {pageCategories}
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div className="uk-width-medium-1-2">
                                <div className="uk-form-row">
                                    <label className="uk-form-label" htmlFor={`${MODEL}_ordering`}>Ordering</label>
                                    <div className="uk-form-controls">
                                        <input className="uk-width" type="text" defaultValue={resource.ordering} name={`${MODEL}[ordering]`} id={`${MODEL}_ordering`} ref={`${MODEL}_ordering`} />
                                    </div>
                                </div>
                            </div>
                            <div className="uk-width-medium-1-2">
                                <div className="uk-form-row">
                                    <label className="uk-form-label" htmlFor={`${MODEL}_max_comments`}>Comments max</label>
                                    <div className="uk-form-controls">
                                        <input className="uk-width" type="text" defaultValue={resource.max_comments} name={`${MODEL}[max_comments]`} id={`${MODEL}_max_comments`} ref={`${MODEL}_max_comments`} />
                                    </div>
                                </div>
                            </div>
                            <div className="uk-width-1-1 uk-margin-top">
                                <div className="uk-form-row">
                                    <div className="uk-form-controls">
                                        <input type="submit" className="uk-button uk-width" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        );
    }
};

export default PageForm;