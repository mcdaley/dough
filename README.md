# DOUGH
Dough is an online personal finance application that allows users to manage
the banking and credit card accounts in a single location. Users will be able
to create accounts and then track all of their transactions and balances in
a single location.

## Project Objectives
* It is an example application to demonstrate how to create a modern webstack with Ruby on Rails and Reactjs. 

* Provide real world examples for my blog posts on product management and coding

* Create a template for automating the creation of rails applications.

### Helpful Articles
The following articles helped me develop the project configuration.

(Goodbye Sprockets Welcome Webpacker 3.0)[https://medium.com/@coorasse/goodbye-sprockets-welcome-webpacker-3-0-ff877fb8fa79]
(Create a Ruby on Rails 5.1 application with Webpack, React 16, and React Router)[https://blog.grillwork.io/create-a-ruby-on-rails-5-1-application-with-webpack-react-16-and-react-router-e2c16d267f73]

## Dependencies
The following packages are required before creating the project:
* rbenv
* homebrew
* node
* protgresql db
* tmux and overmind (needed for running the 2 processes, the web-dev-server and rails)

## Helpful Gems
The following list of gems will be added to the vamamos project for creating 
a rails app:

All Environments
* gem 'haml',           '~> 5.0'
* gem 'awesome_print'

Development Environment
* gem 'better_errors'
* gem 'binding_of_caller'           # Think may be a dependency of binding_of_caller
* gem 'annotate'

Development and Test Environments
Test Environment

## JavaScript Packages
* prop-types
* bootstrap
* jquery / popper.js
* fontawesome
* react-router-dom

### NOTES
Also I want to add the following JavaScript packages to the setup
* eslint

## Setting up the Project

### Create Rails Project
Will create a Ruby on Rails application with a Reactjs frontend. I will also
support adding a web frontend in order to support an admin view. This can also
be a way to migrate a legacy rails app to reactjs without using any of the
reactjs integration gems.

We will not need coffeescript, turbolinks, or sprockets since we'll be 
building the UI with reactjs and react router. We'll also be using PostgreSQL
as the DB and we will add tests later.

Run the following command to create the project:

```
rails new dough --webpack=react --database=postgresql --skip-coffee --skip-turbolinks --skip-sprockets -T
```

After initializing the app then create the empty databases,
```
bin/rake db:create    # Creates development and test DBs
```

#### Set up Overmind
We need to run the webpack-dev-server and rails server at the same time and we 
are using overmind to manage the 2 processes. In the project root directory
create the *Procfile*

```
server: bin/rails server
assets: bin/webpack-dev-server
```

### Add Gems
Add the standard set of gems that I want to work with in the application. 
Eventually the gems will be part of the project creation script
#### Add Utility Gems
**pry**
#### Setup Haml
I personally prefer Haml templates versus ERB, so we'll use HAML as our default
template layout.

### Verify Reactjs is Setup
Create a controller and view and verify that reactjs is setup. First,
create the controller:

```
rails g controller pages home
```

In the ```app/views/alyouts/application.html.erb``` template change the 
```javascript_include_tag application``` to ```javascript_pack_tag application``` 
and add the the hello_react component.

```
<%= javascript_pack_tag     'application' %>
<%= javascript_pack_tag     'hello_react' %>
```

navigate to the ```()[http://localhost:5000/pages/home]``` and verify the *Hello React!*
message is at the bottom of the page.

### Migrate JavaScript
Even though the project was created without sprockets, the asset directory is
still the same, so we need to migrate everything to webpacker. In our 
```app/assets/javascrips/application.js``` we have:

```
//= require rails-ujs
//= require activestorage
//= require_tree .
```

We can get rid of the ```require_tree``` and install all of the other packages 
via ```yarn```.

#### Remove Old JavaScript Files
Remove all of the JavaScript files is app/assets/javascripts.

```
git rm app/assets/javascripts/application.js
git rm app/assets/javascripts/cable.js
git rm app/assets/javascripts/pages.js
```

#### Install jQuery
Since we are using Bootstrap we still need jquery.

```
yarn add jquery
```

Now we have to configure Webpacker to include it in all our environments. To 
do that we change the ```environment.js``` file.

```
\# app/config/webpack/environment.js
const {environment} = require('@rails/webpacker');

const webpack = require('webpack');
environment.plugins.append('Provide', new webpack.ProvidePlugin({
  $: 'jquery',
  jQuery: 'jquery'
}));

module.exports = environment;
```

*NOTE: THIS STILL DOES NOT WORK FOR ME*
so you can finally use it into your application.js file.

```
\# app/javascript/packs/application.js

$(function () {
  console.log('Hello World from Webpacker');
});
```

#### Setup rails-ujs and activestorage
Add the modules

```
yarn add rails-ujs activestorage
```

Start them up in ```app/javascripts/packs/application.js```

```
import Rails          from 'rails-ujs'
import ActiveStorage  from 'activestorage'

Rails.start()
ActiveStorage.start()
```

#### Setup Bootstrap
The last piece missing is Bootstrap. JQuery is in place so we can simply 
install the package and require it.

```
yarn add bootstrap@4.1.1 popper.js
```

add Popper to the environment configuration:

```
\# app/config/webpack/environment.js
...
environment.plugins.append('Provide', new webpack.ProvidePlugin({
  $:      'jquery',
  jQuery: 'jquery',
**Popper: ['popper.js', 'default']**
}));
...
```

and import the plugins:

```
\## app/javascript/packs/application.js

import 'bootstrap/dist/js/bootstrap';
```

### Migrate CSS

#### Rename the app/javascripts directory
Since we are using webpacker to manage the css it sounds weird to store css
files in a directory named ```app/javascripts```, so change the name:

```
mv app/javascripts app/webpacker
```

Then we need to change the ```config/webpacker.yml``` to point to the renamed
directory:

```
\## config/webpacker.yml
default: &default
  source_path:        **app/webpacker**
  source_entry_path:  packs
  public_output_path: packs
  cache_path:         tmp/cache/webpacker
  ...
```

#### Setup Bootstrap Globals and Overrides
Setup the files for overriding default Bootstrap behavior and setting
Sass global variables. All of the stylesheets will be added to the 
```app/webpacker/src/stylesheets``` directory

```
mkdir app/webpacker/src/stylesheets
touch app/webpacker/src/stylesheets/globals.scss
touch app/webpacker/src/stylesheets/bootstrap_and_overrides.scss
```

**TO DO: Add the contents of the files later**

#### Migrate CSS to app/webpacker
Create a ```app/webpacker/packs/application.scss``` file and import the
sass files we added in the previous step and import bootstrap. 

```
// app/webpacker/packs/application.scss
@import   '../src/stylesheets/globals';
@import   '../src/stylesheets/bootstrap_and_overrides';

// Custom bootstrap variables must be set or imported *before* bootstrap
@import   '~bootstrap/scss/bootstrap';
```

When we add need **SCSS** files then we will put them in the 
```app/webpacker/src/stylesheets``` directory and import them in the 
```app/webpacker/packs/application.scss``` file.

#### Update Layout to Include application.scss
In the ```app/views/layouts/application.html.erb``` change the link to the
stylesheets from ```stylesheet_include_tag``` to the following:

```
<%= stylesheet_pack_tag     'application', media: 'all' %>
```

#### Verify Bootstrap is Setup
Reload ```http://localhost:5000/pages/home``` and verify we get the default
Bootstrap font.

**05/24/2018  TODO:**
- Add a boostrap layout and components to verify.

### Setup Fontawesome
### Migrate Images
Migrate the images to be managed by webpacker and we'll verify it works
by creating a temporary page that loads an image using webpacker. We'll
load an example robot image in the _About_ page to show it is working as
expected.

#### Move Images to app/webpacker/images
Create the directory ```app/webpacker/images``` and place all the images
that you want to add to the site in that directoty. For our example, we'll
add the file ```icon_robots_16.svg```

Create an ```index.js``` file in the ```app/webpacker/images``` directory
and reference all of the image files that we moved to that directory.

```
\## app/webpacker/images/index.js
@import './icon_robots_16.svg'
```

Create a file ```app/webpack/packs/images.js``` and import the content of that
folder:

```
\## app/webpack/packs/images.js
import '../images'
```

#### Setup Favicon
### Cleanup Legacy app/assets Directories
## Create Reactjs App

## Software Dependencies
ruby      2.4.3
rails     5.2.0
postgres  10.4

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
