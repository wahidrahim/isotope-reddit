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
  init_isotope $container
