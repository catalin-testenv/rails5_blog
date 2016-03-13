
import React from 'react';

const defaultProps = {
    errorMessages: []
};


class FormSelect extends React.Component {

    constructor(props) {
        super(props);
        this.handleChange = this.handleChange.bind(this);
    }

    static get defaultProps() {
        return Object.assign({}, super.defaultProps, defaultProps);
    }

    handleChange(e) {
        this.props.onChange(e);
    }

    render() {

        let type = this.props.type;
        let MODEL = this.props.model;
        let label = this.props.label;
        let name = this.props.name;
        let value = this.props.value;
        let errorMessages = this.props.errorMessages;

        return (
            <div>
                <div className={errorMessages.length > 0 ? 'field_with_errors' : ''}>
                    <label className="uk-form-label" htmlFor={`${MODEL}_${name}`}>{label}</label>
                </div>
                <div className="uk-form-controls">
                    <div className={errorMessages.length > 0 ? 'field_with_errors' : ''}>
                        <input className="uk-width"
                               type={type}
                               value={value}
                               name={`${MODEL}[${name}]`}
                               id={`${MODEL}_${name}`}
                               ref={`${MODEL}_${name}`}
                               onChange={this.handleChange} />
                    </div>
                </div>
                {errorMessages.map((message) => {
                    return <p className="uk-form-help-block uk-text-danger" key={message}>{message}</p>
                })}
            </div>
        );
    }

}

export default FormSelect;