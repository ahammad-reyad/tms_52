$(document).ready ->
  $("#menu-toggle").click (e) ->
    e.preventDefault()
    $("#wrapper").toggleClass "toggled"
    return
  $(".nav-tabs a").click ->
    $(this).tab "show"
    return
  return
