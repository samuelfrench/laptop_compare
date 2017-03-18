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
                <TableHeaderColumn dataField='photoUrl'>Photo</TableHeaderColumn>
                <TableHeaderColumn dataField='mfr'>Brand</TableHeaderColumn>
                <TableHeaderColumn isKey dataField='model'>Model</TableHeaderColumn>
                <TableHeaderColumn dataField='screenSize'>Screen Size</TableHeaderColumn>
                <TableHeaderColumn dataField='osVersion'>OS</TableHeaderColumn>
                <TableHeaderColumn dataField='cpuModel'>CPU Model</TableHeaderColumn>
                <TableHeaderColumn dataField='baseCpuClockGhz'>CPU Speed</TableHeaderColumn>
                <TableHeaderColumn dataField='batteryLifeHr'>Battery Life (Hour)</TableHeaderColumn>
                <TableHeaderColumn dataField='price'>Price</TableHeaderColumn>
            </BootstrapTable>
        );
    }
}

export default MainLaptopTable;