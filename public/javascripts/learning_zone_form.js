var LearningZoneForm = {
  init:function(){
    
    $('#date').datepicker({
      altField:'.the_date',
      altFormat:'yy-mm-dd',
      onSelect:function(){
        LearningZoneForm.getPeriods();
      },
      beforeShowDay:$.datepicker.noWeekends
    });
    LearningZoneForm.datepicker.disable();
    
    $(':checkbox').click(function(){
      var row = $(this).data('row');
      $("select#"+row+"_reason_id").val('').removeAttr('selected').attr('disabled', true);
      $("select#"+row+"_referrer_id").val('').removeAttr('selected').attr('disabled', true);
    })
    
    // Show Students from year group
    $('#year_group').change(function(){
      LearningZoneForm.spinner.start();
      LearningZoneForm.datepicker.disable();
      LearningZoneForm.reset();
      var year_group_id = $(this).val();
      $.getJSON('/year_groups/'+year_group_id+'.json', function(data){
        var students = []
        students += "<option val=''></option>"; // The blank one at the top
        $.each(data, function(key, val){
          var student = val.student
          students += JST.student({id:student.id, first_name:student.first_name, last_name:student.last_name})
        });
        $('#student').html(students);
        LearningZoneForm.spinner.stop();
      });
    });

    // Show periods for a student
    $('#student').change(function(){
      LearningZoneForm.getPeriods();
    });
    
    $('form#learning_zone_data_entry').submit(function(){LearningZoneForm.spinner.start()})

  },
  spinner: {
    start:function(){
      $('#loading').show();
    },
    stop:function(){
      $('#loading').hide();
    }
  },
  
  datepicker:{
    disable:function(){
      $('#date').datepicker('disable');
    },
    enable:function(){
      $('#date').datepicker('enable');
    }
  },
  
  getPeriods:function(){
    LearningZoneForm.spinner.start();
    LearningZoneForm.datepicker.enable();
    LearningZoneForm.prefillPeriodIds();
    LearningZoneForm.reset();
    var student_id = $('#student').val(),
    date = LearningZoneForm.date();

    $('form').attr('action', '/students/'+student_id+'/sessions?date='+date);
    $.getJSON('/students/'+student_id+'/sessions.json?date='+date, function(data){
      $.each(data, function(key, val){
        var session = val.session;
        // period
        LearningZoneForm.fillPeriodWithData(session.period, session.id, 'id', session.id)
        LearningZoneForm.fillPeriodWithData(session.period, session.id, 'referrer_id', session.referrer_id);
        LearningZoneForm.fillPeriodWithData(session.period, session.id, 'reason_id', session.reason_id);
        LearningZoneForm.fillPeriodWithData(session.period, session.id, 'period', session.period);
        LearningZoneForm.nameDeleteAttribute(session.period, session.id);
        LearningZoneForm.renamePeriodDate(session.period, session.id);
     });
      LearningZoneForm.spinner.stop();
    });
  },
  
  prefillPeriodIds:function(){
    var periods = [1,2,3,4,5];
    $.each(periods, function(key, val){
      LearningZoneForm.fillPeriodWithData(val, null, 'id', null)
      LearningZoneForm.fillPeriodWithData(val, 'new_'+val, 'period', val);
      LearningZoneForm.fillPeriodWithData(val, 'new_'+val, 'reason_id', null);
      LearningZoneForm.fillPeriodWithData(val, 'new_'+val, 'referrer_id', null);
      LearningZoneForm.nameDeleteAttribute(val, 'new_'+val);
      LearningZoneForm.renamePeriodDate(val, 'new_'+val);
    });
  },
  
  nameDeleteAttribute:function(period, session_id){
    $('#period_'+period+'__destroy').attr('name', 'student[sessions_attributes]['+session_id+'][_destroy]')
  },
  
  fillPeriodWithData:function(period, session_id, field, data){
    $('#period_'+period+'_'+field).val(data);
    $('#period_'+period+'_'+field).attr('name', 'student[sessions_attributes]['+session_id+']['+field+']');
  },
  
  renamePeriodDate:function(period, session_id){
    $('#period_'+period+'_date').attr('name', 'student[sessions_attributes]['+session_id+'][date]');
  },
  
  
  
  date:function(){
    return $('.the_date:first').val();
  },
  
  deactivate:function(){
    $('input:submit').disable();
  },
  
  reset:function(){
    $('select.resetable').val('').removeAttr('selected').removeAttr('disabled');
    $('input[type="checkbox"]').prop("checked", false);
  },
  
  resetAll:function(){
    $('#student').html('');
    $('select').val('').removeAttr('selected');
        $('input[type="checkbox"]').prop("checked", false);

    LearningZoneForm.datepicker.disable();
    //LearningZoneForm.deactivate();
  }
}