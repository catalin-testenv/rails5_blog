
import React from 'react';



class Notification extends React.Component {

    constructor(props) {
        super(props);
        this.state = {show: true};
        this.handleClick = this.handleClick.bind(this);
    }

    componentWillReceiveProps(nextProps) {
        this.setState({show: true});
    }

    handleClick(e) {
        e.preventDefault();
        this.setState({show: false});
    }

    render() {
        let notification = <div />;

        if (this.state.show) {
            notification = (
                <div className={`uk-alert uk-margin-bottom-remove uk-alert-${this.props.type}`}>
                    <a href="" onClick={this.handleClick} className="uk-alert-close uk-close"></a>
                    <p>{this.props.children}</p>
                </div>
            );
        }

        return notification;
    }
}


export default Notification;