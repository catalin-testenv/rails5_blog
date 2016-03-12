import React from 'react';

/*
requires Component to define _onChange method
*/

export default function FluxRegisteredDeco(stores) {

    return function inner (Component) {

        class Decorated extends Component {
            constructor(props) {
                super(props);
                this._onChange = this._onChange.bind(this);
            }

            componentWillMount() {
                stores.forEach((store) => {
                    store.addChangeListener(this._onChange);
                });

                super.componentWillMount && super.componentWillMount();
            }

            componentWillUnmount() {
                stores.forEach((store) => {
                    store.removeChangeListener(this._onChange);
                });
                super.componentWillUnmount && super.componentWillUnmount();
            }
        }
        return Decorated;

    }

}