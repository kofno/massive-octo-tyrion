# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#

jQuery ->

  $('body').on 'ajax:success', '[data-remote][data-append]', (evt, data, status, xhr) ->
    ui = $(this)
    result = $(data)

    target = $(ui.data('append'))
    target.append(result.find('#transactions tr'))

    new_link = result.find('#' + ui.attr('id'))
    ui.replaceWith($(new_link))
    
