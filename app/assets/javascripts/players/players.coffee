jQuery ->
  # load for every Players controller action
  window.myApp.pageController.add("body[data-controller='players']", Players)

Players =
  load: ->
    console.log("load: Players")

  # unload is optional
  unload: ->
    console.log("unload: Players")
