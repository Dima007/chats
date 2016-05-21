// var ready = function() {

//   chatBox = {

//     openChat: function(chat_id) {
//       $("#chat-box").children().remove();

//       $.get("chats/" + chat_id, function(data) {
//         $("#chat-box").append(data);
//         $("#chatbox_" + chat_id + " .chatbox-content").scrollTop($("#chatbox_" + chat_id + " .chatbox-content")[0].scrollHeight);
//         $(".chatboxtextarea").focus();
//       }, "html");
//     },

//     checkInputKey: function(event, chatboxtextarea, chat_id) {
//       if (event.keyCode == 13 && event.shiftKey == 0) {
//         event.preventDefault();

//         var message = chatboxtextarea.val();
//         message = $.trim(message);

//         if (message != '') {
//           $("#chat_form_" + chat_id).submit();
//           $(chatboxtextarea)
//             .val('')
//             .focus()
//             .css('height', '44px');
//         }
//       }
//     },
    
//     notify: function() {
//       var audioPlayer = $('#chatAudio')[0];
//       audioPlayer.play();
//     }
//   }
// }

// $(document).ready(ready);
// $(document).on("page:load", ready);
