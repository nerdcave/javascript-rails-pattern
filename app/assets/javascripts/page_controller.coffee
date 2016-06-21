(window.myApp ?= {}).pageController =
  entries: []
  add: (selector, pageObject) ->
    @entries.push({selector, pageObject})
  canLoad: (selector) ->
    $(selector).length > 0
  unloadPage: ->
    entry.pageObject.unload?() for entry in @entries when @canLoad(entry.selector)
  loadPage: ->
    entry.pageObject.load() for entry in @entries when @canLoad(entry.selector)


jQuery ->
  console.info('App load!')

  $(document).on 'turbolinks:before-render', ->
    window.myApp.pageController.unloadPage()

  $(document).on 'turbolinks:load', ->
    window.myApp.pageController.loadPage()

