//-----------------------------------------------------------------------------
// app/webpacker/src/components/navbar.js
//-----------------------------------------------------------------------------
import React        from 'react'
import { NavLink }  from 'react-router-dom'

const Navbar = () => {
  return (
    <nav className="navbar navbar-expand-lg navbar-dark bg-dark">
      <NavLink to = "/app" className = "navbar-brand" >
        DOUGH
      </NavLink>
      <button className="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span className="navbar-toggler-icon"></span>
      </button>
      <div className="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div className="navbar-nav">
          <NavLink 
            exact to        ="/app" 
            className       = "nav-item nav-link" 
            activeClassName ="active"
          >
            Home
          </NavLink>
          <NavLink 
            to              = "/app/about" 
            className       = "nav-item nav-link"  
            activeClassName = "active"
          >
            About
          </NavLink>
          <NavLink
            to              = "/app/help"
            className       = "nav-item nav-link"
            activeClassName = "active"
          >
            Help
          </NavLink>
        </div>
      </div>
    </nav>
  )
}

// Export Navbar component
export default Navbar