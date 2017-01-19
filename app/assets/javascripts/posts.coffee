# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Masonry pinterest style layout
$ ->
  $('#posts').imagesLoaded ->
    $('#posts').masonry
      itemSelector: '.post-box'
      gutter: 20

# Make entire post-box link to post itself
 $(document).ready ->
   $('.post-box').click ->
     window.location = $(this).find('a:contains("Read more")').attr('href')
     false
     return
