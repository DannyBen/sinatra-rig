$ ->
  updateClock = -> 
    time = (new Date()).toLocaleTimeString()
    $("#clock").html time

  setInterval updateClock, 1000