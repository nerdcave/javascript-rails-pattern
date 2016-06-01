jQuery ->
  window.myApp.pageController.add(
    "body[data-controller='players'][data-action='new'],
    body[data-controller='players'][data-action='create']", PlayerNew)

PlayerNew =
  load: ->
    console.log("load: PlayerNew")
    $w = $(window)
    $w.resize ->
      console.log("window dimensions (height/width): #{$w.height()}/#{$w.width()}")

  unload: ->
    console.log("unload: PlayerNew")
    $(window).off('resize')
