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
        this.state = {headers: "Loading..."}
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
            <tr>{this.state.headers}</tr>
        );
    }
}

class TableRowControl extends React.Component {
	
	constructor(props) {
		super(props);
		this.props.rowTest = ["0","0","0","0","0","0","0","0","0"];
	}
	
	render() {
		var rowElements = [];
		this.props.rowTest.forEach(function(element) {
			rowElements.push(<td>{element}</td>)
		});
		return (
			<tr>{rowElements}</tr>
		);
	}
}

export default MainLaptopTable;