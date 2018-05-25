//-----------------------------------------------------------------------------
// app/webpacker/src/app.jsx
//-----------------------------------------------------------------------------
import React  from 'react'
import {
  BrowserRouter as Router,
  Route,
  Link
} from 'react-router-dom'

import Navbar from './components/navbar'
import Home   from './pages/home'
import About  from './pages/about'
import Help   from './pages/help'

export default class App extends React.Component {
  render() {
    return(
      <Router>
        <div className="App">
          <Navbar />
          <Route exact path='/'     component={Home}  />
          <Route exact path='/app'  component={Home}  />
          <Route path='/app/home'   component={Home}  />
          <Route path='/app/about'  component={About} />
          <Route path='/app/help'   component={Help}  />
        </div>
      </Router>
    )
  }
}
