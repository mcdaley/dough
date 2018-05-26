//-----------------------------------------------------------------------------
// app/webpacker/src/components/camera.js
//-----------------------------------------------------------------------------
import React            from 'react'
import FontAwesomeIcon  from '@fortawesome/react-fontawesome'
import faCoffee         from '@fortawesome/fontawesome-free-solid/faCoffee'
import faCameraRetro    from '@fortawesome/fontawesome-free-solid/faCameraRetro'

/****
 * Example reactjs component that uses font awesome icons. This is probably
 * the most cumbersome way to use the icons because you need to specifically
 * import each icon that you want to use. For more details on how to use
 * the font awesome icons with react see:
 *
 *   https://www.npmjs/com/package/@fortawesome/react-font-awesome
 */
const Camera = () => {
  return(
    <div className='col-12'>
      <br />
      <h2> Example using Font Awesome Free Icons </h2>
      <FontAwesomeIcon
        icon      = {faCoffee}
        className = 'fa-4x'
      />
      <FontAwesomeIcon
        icon      = {faCameraRetro}
        size      = '3x'
        className = 'font-awesome-color'
      />
    </div>
  )
}

// Export Camera component
export default Camera