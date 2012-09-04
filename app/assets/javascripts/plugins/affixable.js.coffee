jQuery ->
  
  $('body').on 'click', 'a.affixable', (e) ->
    $this = $(this)
    $panel = $(this.hash)
    $container = $panel.parents('.tabbable')
    top = $this.position().top
    bottom = $panel.outerHeight() + top
    $panel.css({ width: $panel.width() })
    $container.css({ height: $container.outerHeight() })
    
    if bottom > $container.outerHeight()
      $panel.css({ position: 'absolute', bottom: 0 })
    else
      $panel.css({ position: 'absolute', top: $this.position().top })