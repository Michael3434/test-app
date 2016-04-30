$(document).on "ready page:load", ->
  app.auth.init() if $("#signup_modal").length > 0


# Handler user sign in/up through modal view
app.auth =
  init: ->
    @signup.init()
  signup:
    init: ->
      @openModal()
      $("form#new_user").on "ajax:error", @signupError
      $("form#new_user").on "ajax:success", @signupSuccess
      $("#signup_modal").on "hidden.bs.modal", @resetModal
    openModal: ->
      $(".city-picture").on "click", (e) ->
        e.preventDefault()
        city = $(this).data("city")
        $('#user_city').val(city)
        $("#signup_modal").modal()
    signupError: (e, xhr, status, error) ->
      $(this).render_form_errors('user', xhr.responseJSON.errors)
    signupSuccess: (e, data, status, xhr) ->
      $('.step-1').hide()
      $(".step-2 > p > .city").html(data.city)
      $('.step-2').show()
      url = app.auth.facebookUrl(data.city)
      setTimeout ( -> window.location.replace(url) ), 3000
    resetModal: ->
      $("form#new_user").clear_form_errors()
      $("form.new_session").clear_form_errors()
  facebookUrl: (city) ->
      switch city
        when "Paris"
          "https://www.facebook.com/groups/760907487298386/"
        when "Bordeaux"
          "https://www.facebook.com/groups/812857502152075/"
        when "Grenoble"
          "https://www.facebook.com/groups/1717543308514315/"
        when "Lille"
          "https://www.facebook.com/groups/500782700122027/"
        when "Lyon"
          "https://www.facebook.com/groups/1542300126071634/"
        when "Marseille"
          "https://www.facebook.com/groups/254492064896049/"
        when "Montpellier"
          "https://www.facebook.com/groups/1018822214871099/"
        when "Nantes"
          "https://www.facebook.com/groups/621741371326238/"
        when "Rennes"
          "https://www.facebook.com/groups/35162264829516/"
        when "Strasbourg"
          "https://www.facebook.com/groups/1542943339334782/"
        when "Toulouse"
          "https://www.facebook.com/groups/978940688825892/"


