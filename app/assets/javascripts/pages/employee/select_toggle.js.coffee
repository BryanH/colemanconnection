jQuery ->
  $.fn.checkForTrue = ->
    isItTrue = false
    
    this.each ->
      isItTrue = true if $(this).val() == "true"
    
    isItTrue
  
  $.fn.handleDependencies = ->
    this.each ->
      $caller = $(this)
      
      $caller.bind 'change iterate', (e) ->
        $dependencies = []
        $this = $(this)
        
        $.each $caller.data('permission-dependency').split('|'), ->
          $dependencies.push $('[data-permission=' + this + ']')
        
        if $dependencies.length > 0
          $.each $dependencies, ->
            $dependent = $(this)
            disabled = $this.val() == 'true' or $('[data-permission-dependency*=' + $dependent.data('permission') + ']').checkForTrue()
            
            if $this.val() == 'true'
              $dependent.prop
                value: true
                disabled: disabled
            else
              $dependent.prop
                disabled: disabled
            
            $dependent.trigger 'iterate', ['Iterate', 'Event']
            $dependent.triggerHandler 'change'
      
      $caller.trigger 'iterate', ['Iterate', 'Event']
  
  if $('[data-permission]')?
    $('[data-permission]').each ->
      $this = $(this)
      $this.handleDependencies() if $this.data('permission-dependency')?
    
    $('form').submit ->
      $('select').prop
        disabled: false