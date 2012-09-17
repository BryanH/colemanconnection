jQuery ->
  
  myTour = jTour([
      {
        html: '<h1>Getting to know the Dashboard</h1>'
      },
      {
        html: "You can think of the Dashboard as your home page. Here, you will find the different parts of the website that you have access to."
      },
      {
        html: 'This is your "Quick Menu". From here you can quickly perform common tasks. This is also where you can launch this tutorial.'
        element: $('.navbar-fixed-top .nav.pull-right > li')
        position: 'se'
        overlayOpacity: 0.2
        expose:
          color: '#fff'
      },
      {
        html: 'While you are logged in, you can click the Coleman Connection logo at any time to return you to the Dashboard.'
        element: $('#mast a')
        position: 'sw'
        overlayOpacity: 0.4
      },
      {
        html: "Each of these sections will take you to a different part of the website."
        element: $('.dashboard > .span4').eq(0)
        position: 'sw'
        expose: true
      },
      {
        html: "Within each section you will find links that will allow you to perform specific actions."
        element: $('.dashboard > .span4:first a:first')
        position: 'e'
        expose: true
        overlayOpacity: 0.2
      },
      {
        html: "If you get lost just remember you can always return to this dashboard by clicking the Coleman Connection logo."
      },
      {
        html: "That's it! You've just learned the basics to navigating the Dashboard."
      }
    ],
      overlayOpacity: 0.6)
  
  if $('[data-help-me=dashboard]').length > 0
    $('[data-help-me=dashboard]').click ->
      myTour.start()