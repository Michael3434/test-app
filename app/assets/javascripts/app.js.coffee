window.app ||= {}

app.init = ->
  console.log "Init app.js"
$(document).on "ready page:load", ->
  app.init()
