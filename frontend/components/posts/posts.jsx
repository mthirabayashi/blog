import React from 'react';
import { Link, withRouter } from 'react-router';
import PostItem from './post_item';
import Modal from 'react-modal';
import merge from 'lodash/merge';
import $ from 'jquery';

// TODO: move Modal into its own component/container

class Posts extends React.Component {

  constructor(props){
    super(props);
  }

  render () {
    return (
      <div className='posts-feed'>
        Post Section
      </div>
    );
  }
}

export default Posts;
