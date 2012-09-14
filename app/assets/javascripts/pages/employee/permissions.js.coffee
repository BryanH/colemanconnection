jQuery ->
  if $('.form-permissions').length > 0
    $selects = $('select')
    $selects.change ->
      $this = $(this)
      if $this.val() == 'true'
        $this.siblings('span').addClass 'allowed'
      else
        $this.siblings('span').removeClass 'allowed'
    $selects.each ->
      $(this).triggerHandler 'change'
