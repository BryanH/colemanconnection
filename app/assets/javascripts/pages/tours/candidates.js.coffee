jQuery ->
  
  if $('[data-help-me=candidates]').length > 0
    
    myTour = jTour([
        {
          html: '<h1>Getting to know the "Candidates" section</h1>'
        },
        {
          html: "Candidates are the potential students that have created an account on Coleman Connection. These people have expressed an interest in HCC Coleman College and are taking their first steps toward a career in health care"
        },
        {
          html: "This page lists candidates in alphabetical order by last name"
          element: $('.row .span8')
          position: 'n'
          expose: true
          overlayOpacity: 0.9
        },
        {
          html: 'Each page will list 30 candidates. To move between pages you can use these pagination links.'
          element: $('.pagination ul')
          position: 'nw'
          expose:
             'background-color': '#fff'
          overlayOpacity: 0.9
        },
        {
          html: "While you can use the pagination links at the bottom to navigate, the fastest way to find a candidate is by searching for them"
        },
        {
          html: "Here you can type any part of the candidates <strong>first name</strong>, <strong>last name</strong>, or <strong>email address</strong>"
          element: $('.boxed-main h1 form')
          expose: true
          position: 'w'
          overlayOpacity: 0.9
          goTo: '/employee/candidates?q=sch'
        },
        {
          html: 'If you perform a search, you will see a new navigation link here on the left. This will show you what the last search term was.'
          element: $('.row .span4 li').eq(1)
          expose: true
          overlayOpacity: 0.9
          position: 'e'
        },
        {
          html: "This section will also be updated with the candidates that match your search criteria. Remember though that the search matches on any part of the <strong>first name</strong>, <strong>last name</strong>, or <strong>email address</strong> so you may see result you weren't expecting."
          element: $('.row .span8')
          expose: true
          position: 'sw'
          overlayOpacity: 0.9
          goTo: '/employee/candidates'
        },
        {
          html: "To get more information on a candidate you can use these links. Clicking on 'profile' will take you to the candidates profile information. This includes things like demographic information and the candidates interest in HCC Coleman programs. Clicking 'program sessions' will show you a list of program sessions that this candidate has registered for and whether or not they attended."
          element: $(".candidate .pull-right").eq(1)
          position: 'w'
          expose: true
          overlayOpacity: 0.9
        },
        {
          html: "That concludes our tour of the Candidates page. You now have the knowledge you need to search for and review candidate information."
        }
      ],
        overlayOpacity: 0.6)
    
    $('[data-help-me=candidates]').click ->
      myTour.start()