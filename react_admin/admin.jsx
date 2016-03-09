'use strict';

import React from 'react';
import ReactDOM from 'react-dom';

import ReactAdmin from './components/react_admin';

import { Router, Route, hashHistory, IndexRoute  } from 'react-router';

class Dashboard extends React.Component {
    render() {
        return (
            <div style={{height: 500}}>Dashboard</div>
        );
    }
};

class Pages extends React.Component {
    render() {
        return (
            <div style={{height: 500}}>Pages</div>
        );
    }
};

class Other extends React.Component {
    render() {
        return (
            <div style={{height: 500}}>Other</div>
        );
    }
};
var Routes = (
    <Router history={hashHistory}>
        <Route path="/" component={ReactAdmin}>
            <IndexRoute component={Dashboard} />
            <Route path="/pages" component={Pages} />
            <Route path="/other" component={Other} />
        </Route>
    </Router>
);

$(() => ReactDOM.render(
    Routes,
    document.querySelector('#react-admin')
));
