paint_posts = ->
  color_a = '#182945'
  color_b = '#FF4820'
  $posts = $(".post")
  $posts.each ->
    score = $(this).find(".score").text()
    percent = parseFloat((score / 5000).toFixed(2))
    percent = (if percent > 1.0 then 1.0 else percent)
    color = Gradient.at(color_a, color_b, percent)
    $(this).css "background-color", color

init_isotope = (container) ->
  container.isotope
    itemSelector: '.post'
    layoutMode: 'masonry'
    masonry:
      gutter: 20
      isFitWidth: true
  container.imagesLoaded(->
    container.isotope 'layout'
  )

$ ->
  $container = $('#posts-container')

  paint_posts()
  init_isotope $container
