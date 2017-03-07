import React from 'react';

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
        this.props.headersTest = ["Header A", "Header B"];
    }
    render() {
        var headers = [];
        this.props.headersTest.forEach(function(header){
           headers.push(<th>{header}</th>)
        });
        return (
            <tr>{headers}</tr>
        );
    }
}

class TableRowControl extends React.Component {
	
	constructor(props) {
		super(props);
		this.props.rowTest = ["r1","r1-2"];
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