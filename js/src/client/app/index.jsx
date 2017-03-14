import React from 'react';
import { render } from 'react-dom';
import axios from 'axios';
import MainLaptopTable from './MainLaptopTable.jsx';
import {BootstrapTable, TableHeaderColumn} from 'react-bootstrap-table';

class App extends React.Component {
    constructor( props ) {
        super( props );
        this.state = { tableData: "Loading..." };
        this.state.products = [{
            id: 1,
            name: "Product1",
            price: 120
        }, {
            id: 2,
            name: "Product2",
            price: 80
        }];
    }
    render() {
        return (
            <BootstrapTable data={this.state.products} striped hover>
                <TableHeaderColumn isKey dataField='id'>Product ID</TableHeaderColumn>
                <TableHeaderColumn dataField='name'>Product Name</TableHeaderColumn>
                <TableHeaderColumn dataField='price'>Product Price</TableHeaderColumn>
            </BootstrapTable>
        );
    }
}

render( <App />, document.getElementById( 'app' ) );