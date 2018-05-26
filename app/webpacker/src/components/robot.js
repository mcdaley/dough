//-----------------------------------------------------------------------------
// app/webpacker/src/components/robot.js
//-----------------------------------------------------------------------------
import React from 'react'

/****
 * The Robots component is just an example that shows how to load images
 * in reactjs with the webpacker gem. It loads a background image defined
 * in CSS/SASS and an image defined with the <img> tag
 */
const Robot = () => {
  return(
    <div className='col-12'>
      <h2> Example of CSS background image </h2>
      <div className='robot-icon'>
        <h3> Hello Mr. Roboto </h3>
      </div>
      <br />
      <h2> Example of HTML image tag </h2>
      <div>
        <h4>Danger Will Robinson</h4>
        <img src={require('../../images/icon_robots_10')} height="128" width="128"/>
      </div>
    </div>
  )
}

export default Robot