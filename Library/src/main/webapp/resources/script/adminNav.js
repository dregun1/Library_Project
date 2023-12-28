$(document).ready(function() {
	$(".book-chevron-down").click(function() {
		$(".bookNav").show();
		$(this).hide();
		$(".book-chevron-up").show();
	});

	$(".book-chevron-up").click(function() {
		$(".bookNav").hide();
		$(this).hide();
		$(".book-chevron-down").show();
	});
});

$(document).ready(function() {
	$(".subscription-chevron-down").click(function() {
		$(".subscriptionNav").show();
		$(this).hide();
		$(".subscription-chevron-up").show();
	});

	$(".subscription-chevron-up").click(function() {
		$(".subscriptionNav").hide();
		$(this).hide();
		$(".subscription-chevron-down").show();
	});
});