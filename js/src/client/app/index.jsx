import React from 'react';
import { render } from 'react-dom';
import axios from 'axios';
import AwesomeComponent from './AwesomeComponent.jsx';

class App extends React.Component {
    constructor( props ) {
        super( props );
        this.state = { tableData: "Loading..." };
    }

    //see https://daveceddia.com/ajax-requests-in-react/
    componentDidMount() {
        axios.get( `/data/laptop/` )
            .then( res => {
                console.log( res.data );
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
                <p> Hello React!23332</p>
                <AwesomeComponent />
            </div>
        );
    }
}

render( <App />, document.getElementById( 'app' ) );