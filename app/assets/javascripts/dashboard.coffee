# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  $('li.media:has(.col-md-2)').addClass('unread')

  $('a.chat').on 'click', (e) ->
    e.preventDefault()

    chat_id = $(this).data('cid')
    chatBox.openChat(chat_id)

    $('li.media').removeClass('active')
    $(this).closest('li.media').addClass('active')
    

  $('body').on 'keydown', '.chatboxtextarea', (e) ->
        chat_id = $(this).data('cid')
        chatBox.checkInputKey(e, $(this), chat_id)

  # chatbox logic
  chatBox =
    openChat: (chat_id) ->
      $('#chat-box').children().remove()

      $.ajax '/chats/' + chat_id,
        type: 'GET'
        dataType: 'html'
        success: (data) ->
          $('#chat-box').append(data)
          $('#chatbox_' + chat_id + ' .chatbox-content').scrollTop($('#chatbox_' + chat_id + ' .chatbox-content')[0].scrollHeight)
          $('.chatboxtextarea').focus()

    checkInputKey: (event, chatboxtextarea, chat_id) ->
      if event.keyCode == 13 and event.shiftKey == 0
        event.preventDefault()

        message = chatboxtextarea.val()
        message = $.trim(message)

        if message != ''
          $('#chatbox_' + chat_id).submit()
          $(chatboxtextarea)
            .val('')
            .focus()
            .css('height', '44px')

    notify: ->
      audioPlayer = $('#chatAudio')[0]
      audioPlayer.play()

$(document).ready(ready)
$(document).on('page:load', ready)
