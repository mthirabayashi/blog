import React from 'react';
// import Footer from './footer';
import HeaderContainer from './header/header_container';

const App = ({ children, route }) => {

  return (
    <div className='app'>
      <HeaderContainer />
      {children}
    </div>
  );
};

export default App;
