var ready = function() {

  chatBox = {

    openChat: function(chat_id) {
      $(".col-md-8").children().remove();

      $(".col-md-8").append('<div id="chatbox_' + chat_id + '" class="chatbox"></div>');

      $.get("chats/" + chat_id, function(data) {
        $("#chatbox_" + chat_id).html(data);
        $("#chatbox_" + chat_id + " .chatbox-content").scrollTop($("#chatbox_" + chat_id + " .chatbox-content")[0].scrollHeight);
        $(".chatboxtextarea").focus();
      }, "html");
    },

    checkInputKey: function(event, chatboxtextarea, chat_id) {
      if (event.keyCode == 13 && event.shiftKey == 0) {
        event.preventDefault();

        message = chatboxtextarea.val();
        message.replace(/^\s+|\s+$/g, "");

        if (message != '') {
          $("#chat_form_" + chat_id).submit();
          $(chatboxtextarea).val('');
          $(chatboxtextarea).focus();
          $(chatboxtextarea).css('height', '44px');
        }
      }
    },
    
    notify: function() {
      var audioPlayer = $('#chatAudio')[0];
      audioPlayer.play();
    }
  }
}

$(document).ready(ready);
$(document).on("page:load", ready);
