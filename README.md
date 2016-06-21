# Simple JavaScript Loading Pattern with Rails 5 + Turbolinks

This is a Rails 5 and Turbolinks app that demos a simple pattern to organize and selectively execute your JavaScript per controller, controller/action, or any present DOM element.

## This Demo
Get it:

```
git clone git@github.com:nerdcave/javascript-rails-pattern.git
cd javascript-rails-pattern
bundle install
rake db:migrate
rails s
```

Then open your browser's JavaScript console and visit [http://localhost:3000/players](http://localhost:3000/players).

Controller/Action/DOM-specific JavaScript will execute and unload as you navigate. Watch the JavaScript console as you browse around and check out the code in `assets/javascripts/players/*` to see what's going on.


## How it Works
A `pageController` object manages a list of selectors to your JavaScript objects, which then calls `load` on every object when its selector exists on the current page. The order is guaranteed to execute in the same order your JS files are listed in your manifest.

Let's say you want to execute some JavaScript for all your Users controller actions. Create a file called `users.coffee` like so:

```coffeescript
# assets/javascript/users/users.coffee
jQuery ->
  window.myApp.pageController.add("body[data-controller='users']", Users)

Users =
  load: ->
    # executes when any Users action is rendered
  unload: ->
    # optional; executes when you leave the page
```

What if you want to execute additional JavaScript, but only for your Users controller's **index** action? Create another file called `users_index.coffee` like so:

```coffeescript
# assets/javascript/users/users_index.coffee
jQuery ->
  window.myApp.pageController.add("body[data-controller='users'][data-action='index']", UsersIndex)

UsersIndex =
  load: ->
    # only executes when Users#index is rendered
```

The advantage of this pattern is that you create one object for each JavaScript load case, which can then live in its own file. This keeps your app's JavaScript neatly separated and easier to maintain. Just include your files in your JS manifest per usual, and it will all just work.


## Using in your Project
* Copy `app/assets/javascript/page_controller.coffee`
* Change your `<body>` tag to `<body data-controller="<%= controller_name %>" data-action="<%= action_name %>">`.
* Follow the pattern above or in any of the JavaScript files located `assets/javascripts/players/*`

## Not using Turbolinks?
If you're not using Turbolinks, this approach still works. Just remove the Turbolinks code in `page_controller.coffee` and be sure to call `window.myApp.pageController.unloadPage()` when your page unloads, and `window.myApp.pageController.loadPage()` when your page loads.

## Drawbacks?
This works great for me, but if you know of any drawbacks or have a better pattern, let me know!