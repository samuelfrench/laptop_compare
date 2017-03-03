import React from 'react';
import { render } from 'react-dom';
import axios from 'axios';
//import AwesomeComponent from './AwesomeComponent.jsx';

class App extends React.Component {
    constructor( props ) {
        super( props );
        this.state = { tableData: "Loading..." };
    }
    componentDidMount() {
        axios.get( `/data/laptop/` )
            .then( res => {
                this.setState( {
                    tableData: res.data.map(( laptopItem ) =>
                        <tr>
                            <td>{laptopItem.model}</td>
                            <td>{laptopItem.brand}</td>
                        </tr>
                    )
                });
            })
    };
    render() {
        return (
            <div>
                <table>
                    <tr>
                        <th> Model # </th>
                        <th> Brand </th>
                    </tr>
                    {this.state.tableData}
                </table>
            </div>
        );
    }
}

render( <App />, document.getElementById( 'app' ) );