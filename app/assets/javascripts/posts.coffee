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

scroll = (container) ->
  container.infinitescroll {
    navSelector: 'nav.pagination'
    nextSelector: 'nav.pagination a:last-child'
    itemSelector: '#posts-container div.post'
    animate: true
    path: (page) ->
      $('nav.pagination a:last-child').attr 'href'
    debug: true
  }, (posts) ->
    $next = $('nav.pagination a:last-child')
    last_id = posts[posts.length - 1].id

    $next.attr('href', '?after=t3_' + last_id)

    container.imagesLoaded ->
      container.isotope('appended', posts).isotope 'layout'
      return

    paint_posts()
    return

slice_from_link = (url, slice_key) ->
  length = slice_key.length + 1
  queries = url.slice(url.indexOf('?') + 1).split('&')
  sliced = undefined

  queries.forEach (value, index, array) ->
    if value.indexOf(slice_key + '=') == 0
      sliced = value.slice(length)
    return

  sliced

$ ->
  $container = $('#posts-container')

  paint_posts()
  init_isotope $container
  scroll $container
