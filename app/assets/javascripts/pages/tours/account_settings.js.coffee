jQuery ->
  
  myTour = jTour([
      {
        html: '<h1>Getting to know your Account Settings</h1>'
        goTo: '/settings/account'
      },
      {
        html: "Your account setttings will assist the HCC Coleman Faculty and Staff in guiding you down the right path."
      },
      {
        html: "This section is how you navigate through each of the different areas of your account settings."
        element: $('.row .span4')
        position: 'e'
        expose:
          'background-color': '#fff'
      },
      {
        html: "Account settings pertain to how you log into Coleman Connection"
        element: $('.row .span4 li').eq(0)
        expose: true
        position: 'e'
      },
      {
        html: "Here you can edit your first and last name as well as your email. Be careful though because your email is what you will use to log into the website."
        element: $('.row .span8')
        expose: true
        position: 'n'
        goTo: '/settings/password'
      },
      {
        html: 'If you ever need to change your password you can do that here. Clicking this link will display this page and ask you for a new password.'
        element: $('.row .span4 li').eq(1)
        position: 'e'
        expose: true
      },
      {
        html: 'Something to keep in mind is that once you submit this form you will be logged out of the website and asked to log back in with your new password. This is for security purposes.'
        element: $('.row .span8')
        position: 'n'
        expose: true
        goTo: '/settings/demographics'
      },
      {
        html: 'Here, we ask you to fill out some demographic information. This will help our staff contact you about program sessions you are currently signed up for as well as applications you may have submitted.'
        element: $('.row .span4 li').eq(2)
        position: 'e'
        expose: true
      },
      {
        html: "Making sure this information is up-to-date will ensure we can contact you when we need to"
        element: $('.row .span8')
        position: 'n'
        expose: true
        goTo: '/settings/hcc'
      },
      {
        html: "Are you currently enrolled at HCC? Let us know by filling out this information."
        element: $('.row .span4 li').eq(3)
        position: 'e'
        expose: true
      },
      {
        html: "Even if you aren't a current HCC Student, you should have an HCC Student ID. This ID will help us in tracking where you are in the application/enrollement process"
        element: $('.row .span8')
        position: 'n'
        expose: true
        goTo: '/settings/coleman'
      },
      {
        html: "Here we ask you about your interest in HCC Coleman College"
        element: $('.row .span4 li').eq(4)
        position: 'e'
        expose: true
      },
      {
        html: "This information will give us a better understanding of what your interests are in our programs"
        element: $('.row .span8')
        position: 'n'
        expose: true
        goTo: '/settings/account'
      },
      {
        html: "Now you know the basics of updating your account settings."
      }
    ],
      overlayOpacity: 0.6)
  
  if $('[data-help-me=accountSettings]').length > 0
    $('[data-help-me=accountSettings]').click ->
      myTour.start()