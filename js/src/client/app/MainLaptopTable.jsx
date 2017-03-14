import React from 'react';
import axios from 'axios';

class MainLaptopTable extends React.Component {
    render() {
        return (
            <div>
                <table>
                    <TableHeaderControl />
					<TableRowControl />
                </table>
            </div>    
        );
    }
}

class TableHeaderControl extends React.Component {
    
    constructor(props){
        super(props);
        this.state = {headers: "Loading..."};
    }
    componentDidMount() {
        axios.get( `/table/header/` )
            .then( res => {
                this.setState({
                    headers: res.data.map((header) =>
                        <td>{header.headerText}</td>
                    )
                });
            })
    };
    render() {
        return (
            <thead>
                <tr>{this.state.headers}</tr>
            </thead>
        );
    }
}

//TODO: Add row info dynamically from ajax req
class TableRowControl extends React.Component {
	
	constructor(props) {
		super(props);
		this.state = {rows: "test"};
	}
	componentDidMount() {
        axios.get( `/data/laptop/` )
            .then( res => {
                this.setState({
                    rows: res.data.map((row) =>
                    <tr>
                        <td>{row.photoUrl}</td>
                        <td>{row.mfr}</td>
                        <td>{row.model}</td>
                    </tr>
                    )
                });
            })
    };
	render() {
		return (
		        <tbody>{this.state.rows}</tbody>
		);
	}
}

export default MainLaptopTable;