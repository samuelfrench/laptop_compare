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
    render() {
        return (
                <tr>
                <th> Example Header - Collection Fed </th>
                </tr>
        );
    }
}

export default MainLaptopTable;