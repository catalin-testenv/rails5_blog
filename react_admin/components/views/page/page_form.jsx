
import React from 'react';

import FormInput from '../../subcomponents/form_input';
import FormSelect from '../../subcomponents/form_select';

const MODEL = 'page';

const defaultProps = {
    globalErrorsFor: ['base']
};

class PageForm extends React.Component {

    constructor(...props) {
        super(...props);
        this.handleSubmit = this.handleSubmit.bind(this);
        this.handleChange = this.handleChange.bind(this);

        this.state = {
            [MODEL]: this.props.resource
        }
    }

    static get defaultProps() {
        return Object.assign({}, super.defaultProps, defaultProps);
    }

    componentWillReceiveProps(nextProps) {
        this.setState({[MODEL]: nextProps.resource});
    }

    handleSubmit(e) {
        e.preventDefault();
        this.props.onSubmit(this.state);
    }

    handleChange(e) {
        let key = e.target.name.match(/^.+\[(.+)\]/)[1];
        let value = e.target.value;
        let state = this.state;
        state[MODEL][key] = value;
        this.setState(state);
    }

    render() {
        const resource = this.props.resource;
        const pageCategoriesAll = resource.page_categories_all;
        const errorMessages = this.props.errorMessages;

        let globalErrorMessages = [];
        for (let name in errorMessages) {
            if (this.props.globalErrorsFor !== '*' && this.props.globalErrorsFor.indexOf(name) === -1) {
                continue;
            }
            for (let message of errorMessages[name]) {
                globalErrorMessages.push(<li key={`${name}:${message}`}>{name}: {message}</li>)
            }
        }

        let errors = globalErrorMessages.length > 0 ? (
            <div className="uk-alert uk-alert-danger cancel-panel-box-horizontal-padding">
                <h4>Errors:</h4>
                <ul>{globalErrorMessages}</ul>
            </div>
        ) : null;

        return (
            <div>
                {errors}
                <form className={`edit_${MODEL} uk-form uk-form-stacked custom-cc custom-cc-fa`} id={`edit_${MODEL}_${resource.id}`} onSubmit={this.handleSubmit} acceptCharset="UTF-8">
                    <div className="uk-grid uk-grid-small" data-uk-grid-margin>
                        <div className="uk-width">
                            <div className="uk-grid uk-grid-small" data-uk-grid-margin>
                                <div className="uk-width-medium-1-2">
                                    <div className="uk-form-row">
                                        <FormInput type="text"
                                                   model={MODEL}
                                                   name="name"
                                                   value={this.state[MODEL]['name']}
                                                   label="Title"
                                                   onChange={this.handleChange}
                                                   errorMessages={errorMessages['name']} />
                                    </div>
                                </div>
                                <div className="uk-width-medium-1-2">
                                    <div className="uk-form-row">
                                        <FormSelect model={MODEL}
                                                    name="parent_id"
                                                    value={this.state[MODEL]['parent_id']}
                                                    label="Category ID"
                                                    options={pageCategoriesAll}
                                                    onChange={this.handleChange} />
                                    </div>
                                </div>
                                <div className="uk-width-medium-1-2">
                                    <div className="uk-form-row">
                                        <FormInput type="text"
                                                   model={MODEL}
                                                   name="ordering"
                                                   value={this.state[MODEL]['ordering']}
                                                   label="Ordering"
                                                   onChange={this.handleChange} />
                                    </div>
                                </div>
                                <div className="uk-width-medium-1-2">
                                    <div className="uk-form-row">
                                        <FormInput type="text"
                                                   model={MODEL}
                                                   name="max_comments"
                                                   value={this.state[MODEL]['max_comments']}
                                                   label="Comments max"
                                                   onChange={this.handleChange} />
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
            </div>
        );
    }
};

export default PageForm;