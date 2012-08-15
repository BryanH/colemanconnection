jQuery ->
  $('[data-attendance]').change ->
    $this = $(this)
    if $this.is ':checked'
      $.post('/employee/session_attendance', { id: $this.val() }, (data) ->
        Attendance.handle_error($this) if !data.success
      )
    else
      $.post('/employee/session_attendance/' + $this.val(), { '_method': 'delete' }, (data) ->
        Attendance.handle_error($this) if !data.success
      )

Attendance =
  handle_error: (checkbox) ->
    $this = $(checkbox)
    checked = $this.is(":checked")
    msg = if checked then 'Cannot mark as attended' else 'Cannot mark as not attended'
    $this.attr('checked', !checked)
    $this.siblings('.label-important').remove()
    $this.after("<span class='label label-important'>" + msg + "</span>")