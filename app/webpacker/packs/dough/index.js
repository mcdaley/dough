//-----------------------------------------------------------------------------
// app/webpacker/packs/dough/index.js
//-----------------------------------------------------------------------------

/****
 * The application.js file is the main entry point for the app. The file
 * provides same functionality as a index.js in a react app created with 
 * the create-react-app.
 *
 * The goal is to create a react UI that calls a rails API and to wrap the
 * UI and the Server into a single rails app.
 * 
 * The reactjs app setup for this was from an article:
 *  https://blog.grillwork.io/create-a-ruby-on-rails-5-1-application-with-webpack-react-16-and-react-router-e2c16d267f73
 *
 * To use this as the entry point in your reactjs app you need to add the
 * following in the app/views/layouts/application.html.haml
 *   = javascript_pack_tag 'dough/index'
 *
 */

import React      from 'react';
import ReactDOM   from 'react-dom';
//** import Routes from './routes';

import App        from '../../src/app'

import 'bootstrap/dist/js/bootstrap';

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <App />, document.getElementById('dough-app'),
  )
});