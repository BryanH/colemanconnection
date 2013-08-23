$ = jQuery
$ ->
	$main = $('#gs-main')
	$pages = $main.children('.gs-page')
	animationCursor = 1
	pagesCount = $pages.length
	current = 0
	isAnimating = false
	endCurrentPage = false
	endNextPage = false
	animationEndEventNames = {
		'WebkitAnimation' : 'webkitAnimationEnd',
		'OAnimation' : 'oAnimationEnd',
		'msAnimation' : 'MSAnimationEnd',
		'animation' : 'animationend'
	}
	animationEndEventName = animationEndEventNames[ Modernizr.prefixed('animation') ]
	support = Modernizr.cssanimations
	
	init = ->
		$pages.each ->
			$page = $(this)
			$page.data('originalClassList', $page.attr('class'))
		
		$pages.eq(current).addClass('gs-page-current')
		
		updateProgress()
		
		$('.gs-next-page').click (ev) ->
			ev.preventDefault()
			nextPage()
			updateProgress()
		
		$('.gs-prev-page').click (ev) ->
			ev.preventDefault()
			previousPage()
			updateProgress()
	
	updateProgress = ->
		progressBarPercent = (((current + 1) / pagesCount) * 100)
		$('.gs-progress-bar').css('width', "#{progressBarPercent}%")
	
	nextPage = ->
		return false if isAnimating
		return false if current == (pagesCount - 1)
		isAnimating = support
		$currentPage = $pages.eq(current)
		
		++ current if current < pagesCount - 1
		
		$nextPage = $pages.eq(current).addClass('gs-page-current')
		$nextPage.removeClass($nextPage.data('out-class') + ' ' + $nextPage.data('in-class'))
		$currentPage.removeClass($currentPage.data('out-class') + ' ' + $currentPage.data('in-class'))
		
		prepareNextPage($nextPage, $nextPage.data('in-class'))
		prepareCurrentPage($currentPage, $currentPage.data('out-class'))
		
		if support
			$nextPage.on(animationEndEventName, ->
				onEndAnimation $currentPage
			)
		else
			resetPage $currentPage
	
	previousPage = ->
		return false if isAnimating
		return false if current == 0
		isAnimating = support
		$currentPage = $pages.eq(current)
		
		--current if current != 0
		
		$nextPage = $pages.eq(current).addClass('gs-page-current')
		$nextPage.removeClass($nextPage.data('out-class') + ' ' + $nextPage.data('in-class'))
		$currentPage.removeClass($currentPage.data('out-class') + ' ' + $currentPage.data('in-class'))
		
		prepareNextPage($nextPage, $nextPage.data('in-class'))
		prepareCurrentPage($currentPage, $currentPage.data('out-class'))
			
		if support
			$nextPage.on(animationEndEventName, ->
				onEndAnimation $currentPage
			)
		else
			resetPage $currentPage
		
		
	prepareCurrentPage = ($currentPage, animation) ->
		$currentPage.addClass(animation)
	
	prepareNextPage = ($nextPage, animation) ->
		$nextPage.addClass(animation)
	
	clearCurrentPage = ->
		$('.gs-page-current').removeClass('gs-page-current')
	
	onEndAnimation = ($outpage) ->
		endCurrentPage = false
		endNextPage = false
		resetPage $outpage
		isAnimating = false
	
	resetPage = ($page) ->
		$page.attr('class', $page.data('originalClassList'))
	
	init()
	
	return { init : init }
