import React from 'react';
import { withRouter } from 'react-router';

class Header extends React.Component {
  constructor (props) {
    super(props);
    this.state = {
      search: '',
      timer: null
    };
  }

  render() {
    return(
      <div className='header'>
        Header
      </div>
    );
  }

}


export default withRouter(Header);
