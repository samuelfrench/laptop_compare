import React from 'react';
import { render } from 'react-dom';
import axios from 'axios';
import MainLaptopTable from './MainLaptopTable.jsx';
import {BootstrapTable, TableHeaderColumn} from 'react-bootstrap-table';

class App extends React.Component {
    constructor( props ) {
        super( props );
    }
    render() {
        return (
            <div>
                <MainLaptopTable />
            </div>
        );
    }
}

render( <App />, document.getElementById( 'app' ) );