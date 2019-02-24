import React from 'react'

export default class MainRouter extends React.Component {

	componentDidMount() {
			fetch('./gears')
		  .then(response => {
		      if (response.status !== 200) {
		        return;
		      }

		      // Examine the text in the response
		      response.json().then(data => {
		        console.log(data);
		      });
		    }
		  )
		  .catch(err => {
		    console.log('Fetch Error :-S', err);
		  });
		}

	render() {

		return (
			<div>Hello.</div>
		)
	}
}