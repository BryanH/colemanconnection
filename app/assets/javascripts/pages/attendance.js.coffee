jQuery ->
  $('[data-attendance]').change ->
    Attendance.remove_errors()
    $this = $(this)
    if $this.is ':checked'
      $.post('/employee/session_attendance', { id: $this.val() }, (data) ->
        Attendance.handle_error($this) if !data.success
      )
    else
      $.post('/employee/session_attendance/' + $this.val(), { '_method': 'delete' }, (data) ->
        Attendance.handle_error($this) if !data.success
      )
  
  $('[data-session-attendance]').change ->
    Attendance.remove_errors()
    $this = $(this)
    if $this.is ':checked'
      $.post($this.data('attendance-url'), { 'id': $this.val() }, (data) ->
        if !data.success
          Attendance.handle_error($this)
          $(':checkbox').not($this).attr('disabled', false)
      )
      
      $(':checkbox').not($this).attr('disabled', true)
    else
      $.post($this.data('attendance-url') + '/' + $this.val(), { '_method': 'delete' }, (data) ->
        if !data.success
          Attendance.handle_error($this)
          $(':checkbox').not($this).attr('disabled', true)
      )
      
      $(':checkbox').not($this).attr('disabled', false)
  
  $(':checkbox').not('[data-session-attendance]').attr('disabled', $('[data-session-attendance]').is(":checked"))

Attendance =
  handle_error: (checkbox) ->
    $this = $(checkbox)
    checked = $this.is(":checked")
    msg = if checked then 'Cannot mark' else 'Cannot remove mark'
    $this.attr('checked', !checked)
    $this.siblings('.label-important').remove()
    $this.after("<span class='label label-important'>" + msg + "</span>")
  
  remove_errors: () ->
    $('.label-important').remove()