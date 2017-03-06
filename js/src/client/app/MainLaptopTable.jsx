import React from 'react';

class MainLaptopTable extends React.Component {
    render() {
        return (
                <div>
                    <table>
                        <TableHeaderControl />
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
           headers.push(<td>{header}</td>)
        });
        return (
                <tr>
                {headers}
                </tr>
        );
    }
}

export default MainLaptopTable;