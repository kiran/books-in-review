$(document).ready(function() {
    var $btns = $('.btn').click(function() {
  		$btns.removeClass('active');
	  	var allBooks = $('#books-list > article');
		if (this.id == 'clear') {
		    $('#count').html(allBooks.length);
		  	allBooks.fadeIn(450);
		  } else {
		    var $el = $('.' + this.id).fadeIn(450);
		    var books = $('#books-list > article').not($el);
		    books.hide();
		    $('#count').html(1 - books.length);
			$(this).addClass('active');
			$(this).addClass('ui-state-active');
		  }
		});

    $('.book-txt').readmore({
    	speed: 150,
    	moreLink: '<a href="#" class="morelink">Read more</a>',
    	lessLink: '<a href="#" class="morelink">Close</a>'
    });
});
