# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
formatDate = (date) ->
  hours = date.getHours()
  minutes = date.getMinutes()
  seconds = date.getSeconds()
  ampm = if hours >= 12 then "PM" else "AM"
  hours = hours % 12
  hours = if hours then hours else 12
  minutes = if minutes < 10 then '0' + minutes else minutes
  hours + ':' + minutes + ':' + seconds + ' ' + ampm

$ ->
  $('#new_message').on 'ajax:complete', (event, data, status) ->
    message = JSON.parse(data.responseText)?.message
    return unless message
    date = new Date(message.created_at)
    formattedDate = formatDate(date)
    $('.js-message-filter').text(message.body)
    $('.js-messages').append "<li>#{$('.js-message-filter').html()} <small>&mdash; from: #{message.username} at #{formattedDate}</small></li>"
    $('#message_body').val('')

