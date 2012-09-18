jQuery ->
  
  if $('[data-help-me=gettingStarted]').length > 0
    
    myTour = jTour([
        {
          html: '<h1>Welcome to the Getting Started Tour.</h1>'
        },
        {
          html: 'This tour will walk you through the different parts of the screen and exmplain what each one is for.'
        },
        {
          html: "The tour will move along on on it's own but you can always pause it by placing your cursor over this box. Go ahead and try that now. You will also see some navigation links appear that you can use to guide you through the tour."
        },
        {
          html: "Click here to return to the main page"
          element: $('#mast a')
          position: 'sw'
          overlayOpacity: 0.4
        },
        {
          html: 'Click here if you get stuck and need to speak to an HCC Coleman staff member'
          element: $('.navbar-fixed-top .nav.pull-right > li')
          position: 'se'
          expose:
            color: '#fff'
        },
        {
          html: 'This is the slideshow navigation. Click one of these buttons to view the details for that panel.'
          element: $('.content-player-tabs-container')
          position: 'n'
          expose: true
          overlayOpacity: 0.9
        },
        {
          html: 'Or click here to go backwards...'
          element: $('.arrow-container.prev')
          position: 'nw'
          expose:
            position: 'absolute'
          overlayOpacity: 0.9
        },
        {
          html: 'and here to go forwards'
          element: $('.arrow-container.next')
          position: 'ne'
          expose:
            position: 'absolute'
          overlayOpacity: 0.9
        },
        {
          html: "That's it! Those are the basics to getting around this page."
        }
      ],
        overlayOpacity: 0.6)
    
    $('[data-help-me=gettingStarted]').click ->
      myTour.start()