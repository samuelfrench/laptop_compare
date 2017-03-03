import React from 'react';
import {render} from 'react-dom';
import axios from 'axios';
import AwesomeComponent from './AwesomeComponent.jsx';

class App extends React.Component {
//see https://daveceddia.com/ajax-requests-in-react/
componentDidMount() {
    axios.get(`/data/laptop/`)
      .then(res => {
        console.log(res.data);
      });
  }
  render () {
    return (
		<div>
			<p> Hello React!23332</p>
			<AwesomeComponent />
		</div>
	);
  }
}

render(<App/>, document.getElementById('app'));