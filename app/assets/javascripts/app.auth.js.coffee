$(document).on "ready page:load", ->
  app.auth.init() if $("#signup_modal").length > 0


# Handler user sign in/up through modal view
app.auth =
  init: ->
    @signup.init()
    @signin.init()
    $('.want-to-signin').click @showsSignUp
  signin:
    init: ->
      $(".signin").click @openModal
      $("#signin_modal").on "shown.bs.modal", @formFocus
      $("form.new_session").on "ajax:error", @signinError
      $("form.new_session").on "ajax:success", @signinSuccess
    openModal: (e) ->
      e.preventDefault()
      $("#signin_modal").modal()
    formFocus: ->
      $("#signin_modal #user_email").focus()
    signinError: (e, xhr, status, error) ->
      div = $(this).closest("div").find(".error_explanation")
      alert = $("<div></div>", { class: "alert alert-danger" })
      alert.append("<p>#{xhr.responseJSON.error}</p>")
      div.html(alert)
    signinSuccess: (e, data, status, xhr) ->
      $(this).closest(".modal").modal("hide")
      $('.signout').removeClass('hidden')
      $('.signin').addClass('hidden')
      $('.facebook-link').each (element, i) ->
        $(i).removeClass('hidden')
  signup:
    init: ->
      $(".city-picture").click @addCityToSignupForm
      $("form#new_user").on "ajax:error", @signupError
      $("form#new_user").on "ajax:success", @signupSuccess
      $("#signup_modal").on "hidden.bs.modal", @resetModal
    addCityToSignupForm: ->
        city = $(this).data("city")
        $('#user_city').val(city)
    signupError: (e, xhr, status, error) ->
      $(this).render_form_errors('user', xhr.responseJSON.errors)
    signupSuccess: (e, data, status, xhr) ->
      $('.facebook-link').each (element, i) ->
        $(i).removeClass('hidden')
      $('.signout').removeClass('hidden')
      $('.signin').addClass('hidden')
      $('.step-1').hide()
      url = app.auth.facebookUrl(data.city)
      if url == ""
        $(".step-3 > p > .city").html(data.city)
        $('.step-3').show()
        $('.btn-closing').on "click", -> $("#signup_modal").modal('hide')
      else
        $(".step-2 > p > .city").html(data.city)
        $('.step-2').show()
        setTimeout ( -> window.location.replace(url) ), 5000
    resetModal: ->
      $("form#new_user").clear_form_errors()
      $("form.new_session").clear_form_errors()
  initFacebook: ->
    ((d, s, id) ->
      js = undefined
      fjs = d.getElementsByTagName(s)[0]
      if d.getElementById(id)
        return
      js = d.createElement(s)
      js.id = id
      js.src = '//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.6&appId=534500913376942'
      fjs.parentNode.insertBefore js, fjs
      return
    ) document, 'script', 'facebook-jssdk'
  showsSignUp: ->
    $("#signin_modal").modal('hide')
    $("#signup_modal").modal()
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
        else
          ""


