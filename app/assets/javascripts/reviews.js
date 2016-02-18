$(document).on('ready page:load', function(){
  $('#new_review').on('submit', function(eventHandler){
    eventHandler.preventDefault();

    var self = $(this);

    $.ajax({
      url: $(self).attr('action'),
      type: $(self).attr('method'),
      dataType: 'html',
      data: $(this).serialize(),
      success: function(data){
        // $('#review-list').append(data);
      }

    });
  });
});
