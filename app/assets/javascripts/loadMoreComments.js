// Wait for the document to be ready before running the code.
$( document ).ready(function() {
  // Listen for a click event on the .more-comments classes (each of our ‘view all x comments’ links).
  $('.more-comments').click( function() {
    // Once the AJAX call has been successful, move on to the next lines.
    $(this).on('ajax:success', function(event, data, status, xhr) {
      // Assign a postId variable based on the contents of the data-post-id html attribute (which we assigned in our post partial
      var postId = $(this).data("post-id");
      // Replace the #comments_ + postId div with the contents of the returned AJAX data
      $("#comments_" + postId).html(data);
      //
      $("#comments-paginator-" + postId).html("<a id='more-comments' data-post-id=" + postId + "data-type='html' data-remote='true' href='/posts/" + postId + "/comments>show more comments</a>");
    });
  });
});
