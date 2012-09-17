jQuery ->
  
  
  
  if $('#mcgovernInfo').length > 0
    $mcgovernInfo = $('#mcgovernInfo')
    
    $('#session_program_name').change ->
      if $(this).val() == 'Pharmacy Technician'
        $mcgovernInfo
          .show()
        
        setTimeout ->
          $('#session_program_date_id').change ->
            $('span', $mcgovernInfo).text($(':selected', this).text())
          .change()
        , 100
      else
        $mcgovernInfo.hide()