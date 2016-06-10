(function($) {  
	$(document).on('click', '.articles-form-vote-container .btn', function(){ 
		var v = $(this).data('vote'),
		$u = $('.articles-form-vote-container input[name="article_user[user_id]"]');
		if ($u.length < 1 || $u.val() === '0' ) {
			alert("You have to login to vote");
			return;
		}
		$('.articles-form-vote-container #article_user_vote').val(v); 
		$('.articles-form-vote-container form').submit();
	});
})(jQuery);