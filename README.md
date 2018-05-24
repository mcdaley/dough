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
still the same, so we need to migrate everything to webpacker.

### Migrate CSS

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
