# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  $('a.chat').on 'click', (e) ->
    e.preventDefault()

    chat_id = $(this).data('cid')
    chatBox.openChat(chat_id)

    $('li.media').removeAttr('style')
    $(this).parent().parent().css({
    	'background-color':'#7293b6',
    	'color': 'white'
    	})

  $(document).on 'keydown', '.chatboxtextarea', (event) ->
    id = $(this).data('cid')
    chatBox.checkInputKey(event, $(this), id)

$(document).ready(ready)
$(document).on('page:load', ready)
