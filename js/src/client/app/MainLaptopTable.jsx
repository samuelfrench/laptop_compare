import React from 'react';
import axios from 'axios';

class MainLaptopTable extends React.Component {
    constructor(props){
        super(props);
        this.state = {rows: null};
    }
    componentDidMount() {
        axios.get( `/data/laptop/` )
            .then( res => {
                this.setState({
                    rows: res.data
                });
            })
    };
    
    render() {
        return (
            <BootstrapTable data={this.state.rows} striped={ true } hover={ true } condensed={ true }>
                <TableHeaderColumn isKey dataField='model'>Model</TableHeaderColumn>
                <TableHeaderColumn dataField='mfr'>Brand</TableHeaderColumn>
            </BootstrapTable>
        );
    }
}

export default MainLaptopTable;