import React from 'react';
import {render} from 'react-dom';
import axios from 'axios';
import AwesomeComponent from './AwesomeComponent.jsx';

class App extends React.Component {
  render () {
    return (
		<div>
			<p> Hello React!22</p>
			<AwesomeComponent />
		</div>
	);
  }
}

render(<App/>, document.getElementById('app'));