jQuery ->
  
  # Show the keyboard shortcut help window
  jwerty.key 'shift+/', ->
    if not $('input, textarea').is(':focus')
      $('#keyboardShortcuts').modal()
  
  # Focus the search box, if there is one
  jwerty.key 's', ->
    if not $('input, textarea').is(':focus')
      $('[name=q]').focus() if $('[name=q]')?
      false
  
  # Goto the Employee index page
  jwerty.key 'g,e', ->
    if not $('input, textarea').is(':focus')
      window.location = '/employee/users'
  
  jwerty.key 'g,c', ->
    if not $('input, textarea').is(':focus')
      window.location = '/employee/candidates'
  
  jwerty.key 'g,p', ->
    if not $('input, textarea').is(':focus')
      window.location = '/employee/program_dates'

  jwerty.key 'g,d', ->
    if not $('input, textarea').is(':focus')
      window.location = '/employee'
  
  # Employee Navigation
  jwerty.key 'x,x', ->
    if not $('input, textarea').is(':focus')
      window.location = '/users/sign_out'
  
  jwerty.key 'e,e', ->
    if not $('input, textarea').is(':focus')
      window.location = $('.navbar-inner .pull-right .dropdown-menu li:first a').attr('href')