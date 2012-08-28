jQuery ->
  $('.gallery').on 'mousemove', '.quiz-container', (e) ->
    $(this).find('.arrow-container.prev a')[Quiz.previousAction(this, e)]('hideMe')
    $(this).find('.arrow-container.next a')[Quiz.nextAction(this, e)]('hideMe')
  $('.gallery').on 'mouseleave', '.quiz-container', ->
    $(this).find('.arrow-container a').addClass('hideMe')
  $('.next-quiz').bind 'ajax:success', (evt, xhr, settings) -> 
    $('.gallery').append(xhr)
      .find('.gallery-view:last')
      .toGallery()
      .parent()
        .hide()
        .delay(600)
        .slideDown ->
          $.scrollTo(($('.gallery-view:last').offset().top - 100), 300);
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
      dynamicTabsPosition: 'bottom',
      dynamicArrowsPrevText: '<',
      dynamicArrowsNextText: '>'
    btnGroup = $this.next().find('.btn-group')
    arrowLinks = $this.find('.arrow-container a')
    
    btnGroup.children().map (i, el) ->
      linkWidth += $(el).outerWidth()
    
    btnGroup.css
      width: linkWidth
    arrowLinks.addClass 'hideMe'

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
         $('.gallery').append(xhr)
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
    if (Quiz.postitionOverDiv(parent, e) <= 90) && !Quiz.onReviewPanel(parent) then 'removeClass' else 'addClass'
  nextAction: (parent, e) ->
    if (Quiz.postitionOverDiv(parent, e) >= 850) && !Quiz.onReviewPanel(parent) then 'removeClass' else 'addClass'