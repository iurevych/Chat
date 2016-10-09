# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
$ ->
  $('#new_message').on 'ajax:complete', (event, data, status) ->
    message = JSON.parse(data.responseText)?.message.body
    $('.js-messages').append "<li>#{message}</li>"
    $('#message_body').val('')

