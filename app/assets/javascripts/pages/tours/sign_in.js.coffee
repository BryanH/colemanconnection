jQuery ->
  
  if $('[data-help-me=signIn]').length > 0
    
    myTour = jTour([
        {
          html: '<h1>Welcome to the "Signing In" Tour.</h1>'
        },
        {
          html: "In order to sign in you will need to have completed the sign up process. If you have not done that already you will need to go to the <a href='/get_started'>Getting Started</a> page."
        },
        {
          html: "Click here to return to the main page"
          element: $('#mast a')
          position: 'sw'
        },
        {
          html: 'Click here if you get stuck and need to speak to an HCC Coleman staff member'
          element: $('.navbar-fixed-top .nav.pull-right > li')
          position: 'se'
          overlayOpacity: 0.2
          expose:
            color: '#fff'
        },
        {
          html: 'Enter your email address. Make sure to spell it correctly!'
          element: $('#user_email')
          expose: true
          position: 'e'
        },
        {
          html: 'Enter your password here. This is case sensitive so make sure caps lock is turned off.'
          element: $('#user_password')
          expose: true
          position: 'e'
        },
        {
          html: 'Having trouble remembering your password? No problem! Click this link to request a password reset email.'
          element: $('#user_password + p a')
          expose:
            'background-color': '#fff'
            'padding': '5px'
          position: 's'
        },
        {
          html: "That's it! Those are the basics to Signing In."
        }
      ],
        overlayOpacity: 0.6)
    
    $('[data-help-me=signIn]').click ->
      myTour.start()