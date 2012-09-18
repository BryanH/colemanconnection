jQuery ->
  
  if $('[data-help-me=programSessions]').length > 0
    
    myTour = jTour([
      {
        html: '<h1>Getting to know the "Program Sessions" section</h1>'
      },
      {
        html: 'Each of program session is grouped by the program responsible for the session'
        element: $('.row .span8')
        expose: true
        position: 'n'
        overlayOpacity: 0.9
      },
      {
        html: 'To view the details for a given session you can simply click the program name that you would like to explore'
        element: $('#programDates .collapse-group').eq(1)
        expose:
          'background-color': '#fff'
        overlayOpacity: 0.9
        position: 'nw'
      },
      {
        html: 'This will reveal all of the session dates for that program'
        onBeforeShow: ->
          $('#programDates .collapse-group').eq(1).find('.collapse:first').addClass('in')
        element: $('#programDates .collapse-group').eq(1)
        expose:
          'background-color': '#fff'
        overlayOpacity: 0.9
        position: 'nw'
      },
      {
        html: "This number represents the number of candidates that have registered for this particular session. If you would like to have more details however, you can simply click on the date"
        element: $('#programDates .collapse-group').eq(1).find('li:first .badge')
        position: 'n'
        expose: true
        overlayOpacity: 0.9
        goTo: $('#programDates .collapse-group').eq(1).find('li:first a').attr('href')
      },
      {
        html: 'Here you can see the detials of the chosen session. If there are registered candidates, you will be able to review their profile information or check them in.'
      },
      {
        html: 'At anytime, you can return to the full list of program sessions by clicking here.'
        element: $('.row .span4 .boxed').eq(1)
        expose: true
        overlayOpacity: 0.9
        position: 'e'
        goTo: '/employee/program_dates'
      },
      {
        html: 'That concludes our tour of the Program Session pages!'
      }
    ], { opacity: 0.6 })
    
    $('[data-help-me=programSessions]').click ->
      myTour.start()