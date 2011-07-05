$(function(){ 
  
  // Keep awake! don't let heroku go to sleep  
  setInterval("keepAwake()", 3000);
  
  LearningZoneForm.init();
  
  $(document).bind('keydown', 'shift+r', function(){
    $('#show_lz_form').trigger('click');
  });
  $('#show_lz_form').click(function(){
    LearningZoneForm.resetAll();
    $('#learning_zone_form').slideToggle();
  });
  
  $('#cancel').click(function(){
    $('#learning_zone_form').slideUp();
  });

  
  $('h3#recent_on_calls_button').click(function(){
    $('table#recent_on_calls').toggle();
  });
  
  $('table.sortable').tablesorter({});
  $('table.learning_zone').tablesorter({
    headers:{
      1:{sorter:false},
      2:{sorter:false},
      3:{sorter:false},
      4:{sorter:false},
      5:{sorter:false}
    }
  });
    
  
  $('#record_time').click(function(){
    $('#session_edit_dropdown').fadeIn('fast')
    $('#overlay').fadeIn('fast');
  });
  $.expr[':'].textEquals = function (a, i, m) {
  return $(a).text().match("^" + escape_regexp(m[3]) + "$");
};
function escape_regexp(text) {
  return text.replace(/[-[\]{}()*+?.,\\^$|#\s]/g, "\\$&");
}
  
  $('#cancel').click(function(){
    $('#session_edit_dropdown').fadeOut('fast');
    $('#overlay').fadeOut('fast');
  })
});

  function keepAwake(){
    $.get('/rise_and_shine', function(){
      // do nothing
    });
  }