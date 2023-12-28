$(document).ready(function() {
	function prev() {
		$('.mainSlide li:last').prependTo('.mainSlide');
		$('.mainSlide').css('margin-left', -1200);
		$('.mainSlide').stop().animate({
			marginLeft: 0
		}, 1200);
	}

	function next() {
		$('.mainSlide').stop().animate({
			marginLeft: -1200
		}, function() {
			$('.mainSlide li:first').appendTo('.mainSlide');
			$('.mainSlide').css({
				marginLeft: 0
			});
		});
	}

	function slide() {
		$('.mainSlide').stop().animate({
			marginLeft: -1200
		}, function() {
			$('.mainSlide li:first').appendTo('.mainSlide');
			$('.mainSlide').css({
				marginLeft: 0
			});
		});
	}

	setInterval(slide, 5000);

	$('.prev').click(function() {
		prev();
	});

	$('.next').click(function() {
		next();
	});
});

/*recommend*/
$(document).ready(function() {
	// 초기로드시
	$('.bestTitle').addClass('underline');
	$('.bestWrap').show();
	$('.newWrap').hide();

	// 'bestTitle'을 클릭하면 '인기도서' 표시 및 '신착도서' 숨김
	$('.bestTitle').click(function() {
		$('.bestTitle').addClass('underline');
		$('.newTitle').removeClass('underline');
		$('.bestWrap').show(); // 인기도서 보이기
		$('.newWrap').hide(); // 신착도서 숨기기
		$('.newWrap').css('opacity', '0');
	});

	// 'newTitle'을 클릭하면 '신착도서' 표시 및 '인기도서' 숨김
	$('.newTitle').click(function() {
		$('.newTitle').addClass('underline');
		$('.bestTitle').removeClass('underline');
		$('.newWrap').show(); // 신착도서 보이기
		$('.bestWrap').hide(); // 인기도서 숨기기
		$('.newWrap').css('opacity', '1');
	});
});