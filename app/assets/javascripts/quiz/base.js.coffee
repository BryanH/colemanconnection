jQuery ->
  $('.paper').on 'click', '.content-player-tabs-container a.btn', (e) ->
    Quiz.handleHideMe this
    
  $('.paper').on 'click', 'a', (e) ->
    Quiz.handleHideMe $(this).parents('.gallery-view').prev().find('.btn-primary')
    
  $('a.been-there').click ->
    $(this).parents('.masthead').slideUp()
    
  $('.gallery-view').toGallery()
  
  $('.gallery').on 'submit', '[data-quiz-form]', (e) ->
    e.preventDefault()
    $(this).validateQuiz()

jQuery.fn.toGallery = ->
  this.each ->
    $this = $(this)
    linkWidth = 0
    $this.content_player
      dynamicArrowsPrevText: '<',
      dynamicArrowsNextText: '>',
    btnGroup = $this.prev().find('.btn-group')
    arrowLinks = $this.find('.arrow-container a')
    
    btnGroup.children().map (i, el) ->
      linkWidth += $(el).outerWidth()
    
    btnGroup.css
      width: linkWidth

jQuery.fn.validateQuiz = ->
  $form = $(this)
  $buttons = $form.find('.radio_buttons')
  
  $('.radio_buttons .controls', $form).each ->
    $controls = $(this)
    if $controls.find('input:not(:checked)').length > 1
      $controls.parent().addClass('error')
  $form.find('.radio_buttons:checked').each ->
    $input = $(this)
    $group = $input.parents('.control-group')
    if $input.val() != $input.data('answer')
      $group.addClass("error")
    else
      $group.removeClass("error")
  unless $form.find(".control-group.error").length > 0
    $('.actions', $form).html("<p>Getting next section...")
    if $form.data('nextQuiz') == 'sign_up'
      $.get $form.data('nextQuiz'), (xhr) ->
        $('.gallery').append(xhr)
          .find('.sign-up')
          .hide()
          .delay(600)
          .slideDown ->
            $.scrollTo(($('.sign-up:first').offset().top - 100), 300)
    else
      $.get $form.data('nextQuiz'), (xhr) ->
         $('.quiz-container').append(xhr)
            .find('.gallery-view:last')
            .toGallery()
            .hide()
            .delay(600)
            .slideDown ->
              $.scrollTo(($('.gallery-view:last').offset().top - 100), 300)

Quiz =
  onReviewPanel: (parent) ->
    $('.btn-primary', parent).text() == 'Review'
  postitionOverDiv: (parent, e) ->
    e.pageX - $(parent).offset().left
  previousAction: (parent, e) ->
    if (Quiz.postitionOverDiv(parent, e) <= 90) then 'removeClass' else 'addClass'
  nextAction: (parent, e) ->
    if (Quiz.postitionOverDiv(parent, e) >= 850) then 'removeClass' else 'addClass'
  handleHideMe: (elem) ->
    $this = $(elem)
    if $this.text() == 'Review'
      $this.parents('.content-player-tabs-container').next().find('.arrow-container a').addClass('hideMe')
      $this.parents('.content-player-tabs-container').next().on 'mousemove', (e) ->
        $(this).find('.arrow-container.prev a')[Quiz.previousAction(this, e)]('hideMe')
        $(this).find('.arrow-container.next a')[Quiz.nextAction(this, e)]('hideMe')
      $this.parents('.content-player-tabs-container').next().on 'mouseleave', (e) ->
        $(this).find('.arrow-container a').addClass('hideMe')
    else
      $this.parents('.content-player-tabs-container').next().find('.hideMe').removeClass 'hideMe'
      $this.parents('.content-player-tabs-container').next().unbind('mousemove')
      $this.parents('.content-player-tabs-container').next().unbind('mouseleave')