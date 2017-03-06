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
    render() { //why is this executing twice? - the second time it says this.props.headersTest is undefined - TODO
        var headers = [];
        console.log(this.props.headersTest);
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