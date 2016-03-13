
import React from 'react';

class FormInput extends React.Component {

    constructor(props) {
        super(props);
        this.handleChange = this.handleChange.bind(this);
    }

    handleChange(e) {
        this.props.onChange(e);
    }

    render() {

        let MODEL = this.props.model;
        let label = this.props.label;
        let name = this.props.name;
        let value = this.props.value;
        let options = this.props.options;

        let htmlOptions = [];
        for (let id in options) {
            htmlOptions.push(<option key={id} value={id}>{options[id]}</option>);
        }

        return (
            <div>
                <label className="uk-form-label" htmlFor={`${MODEL}_${name}`}>{label}</label>
                <div className="uk-form-controls">
                    <select value={value} className="uk-width" name={`${MODEL}[${name}]`} id={`${MODEL}_${name}`} ref={`${MODEL}_${name}`} onChange={this.handleChange} >
                        {htmlOptions}
                    </select>
                </div>
            </div>
        );
    }

}

export default FormInput;