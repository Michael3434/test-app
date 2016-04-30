app.pages =
  home:
    init: ->
      $("#scroll-down").click this.scrollHeroClicked
      $(".btn-cta").click this.scrollHeroClicked
      $('.nav-testimonials').click this.scrollToTesimonial
      $('.nav-cities').click this.scrollHeroClicked
      $("#video-modal").on "hidden.bs.modal", => @stopVideo()
    stopVideo: ->
      youtubeSrc = $('#ytplayer').attr("src");
      $('#ytplayer').attr("src", "");
      $('#ytplayer').attr("src", youtubeSrc);
    scrollHeroClicked: ->
      $("html, body").animate {
        scrollTop: $(".cities").offset().top
      }, 750
    scrollToTesimonial: ->
      $("html, body").animate {
        scrollTop: $(".testimonial").offset().top
      }, 750

$(document).on "ready page:load", ->
  app.pages.home.init() if $(".static_pages.home").length > 0
