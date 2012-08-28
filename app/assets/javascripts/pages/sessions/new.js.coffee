jQuery ->
  $('form').on 'change', '#session_program_name', (event) ->
    $this = $(this)
    $dateSelect = $("#session_program_date_id")
    if $this.val() isnt ''
      $dateSelect.load "/candidate/program_sessions/date_list", program: $this.val(), ->
        $dateSelect.val($('#selected').val())
    else
      $dateSelect.html("<option>Please choose a program first</option>")
    
  $('#session_program_name').change()