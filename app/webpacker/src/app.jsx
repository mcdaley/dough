//-----------------------------------------------------------------------------
// app/webpacker/src/app.jsx
//-----------------------------------------------------------------------------
import React  from 'react'
import {
  BrowserRouter as Router,
  Route,
  Link
} from 'react-router-dom'

import Home   from './pages/home'

export default class App extends React.Component {
  render() {
    return(
      <Router>
        <div className="App">
          <Route exact path='/'     component={Home} />
          <Route exact path='/app'  component={Home} />
          <Route path='/app/home'   component={Home} />
        </div>
      </Router>
    )
  }
}
