(window.myApp ?= {}).pageController =
  pageObjects: {}
  add: (selector, pageObject) ->
    @pageObjects[selector] = pageObject
  canLoad: (selector) ->
    $(selector).length > 0
  unloadPage: ->
    pageObject.unload?() for selector, pageObject of @pageObjects when @canLoad(selector)
  loadPage: ->
    pageObject.load() for selector, pageObject of @pageObjects when @canLoad(selector)


jQuery ->
  console.info('App load!')

  $(document).on 'turbolinks:before-render', ->
    window.myApp.pageController.unloadPage()

  $(document).on 'turbolinks:load', ->
    window.myApp.pageController.loadPage()

