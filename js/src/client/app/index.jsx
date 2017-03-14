import React from 'react';
import { render } from 'react-dom';
import axios from 'axios';
import MainLaptopTable from './MainLaptopTable.jsx';
//import AwesomeComponent from './AwesomeComponent.jsx';

class App extends React.Component {
    constructor( props ) {
        super( props );
        this.state = { tableData: "Loading..." };
    }
    /* componentDidMount() {
        axios.get( `/data/laptop/` )
            .then( res => {
                this.setState( {
                    tableData: res.data.map(( laptopItem ) =>
                        <tr>
                            <td>{laptopItem.model}</td>
                            <td>{laptopItem.mfr}</td>
                        </tr>
                    )
                });
            })
    }; */
    render() {
        return (
            <div>
                <MainLaptopTable />
            </div>
        );
    }
}

render( <App />, document.getElementById( 'app' ) );