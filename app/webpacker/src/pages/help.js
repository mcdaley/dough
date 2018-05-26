//-----------------------------------------------------------------------------
// app/webpacker/src/pages/help.js
//-----------------------------------------------------------------------------
import React from 'react'

import Robot  from '../components/robot'
import Camera from '../components/camera'

const Help = () => {
  return(
    <div>
      <h1>Dough Help Page</h1>
      <p>
        The help page demonstrates displaying images and font awesome icons
        in a react component.
      </p>
      <Robot  />
      <Camera />
    </div>
  )
}

// Export the help page
export default Help