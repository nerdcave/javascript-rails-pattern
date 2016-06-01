jQuery ->
  window.myApp.pageController.add("#increase-score-button", IncreaseScoreButton)

IncreaseScoreButton =
  load: ->
    console.log("load: IncreaseScoreButton")

    $('#increase-score-button').click ->
      $scoreInput = $('#player_high_score')
      score = parseFloat($scoreInput.val()) || 0
      $scoreInput.val(score + 100)
      false

  unload: ->
    console.log("unload: IncreaseScoreButton")
