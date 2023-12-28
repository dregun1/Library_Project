$(document).ready(function() {
	// 각 항목에 대한 이벤트 핸들링
	$('.headerNav2 nav ul li').mouseover(function() {
		// 마우스 오버 시 실행되는 코드
		$('.headerNav2 nav ul li ul').css('display', 'block');
	}).mouseleave(function() {
		// 마우스 아웃 시 실행되는 코드
		$('.headerNav2 nav ul li ul').css('display', 'none');
	});
});
$(document).ready(function() {
	// 각 항목에 대한 이벤트 핸들링
	$('.headerNav2 nav ul li').hover(function() {
		// 마우스 오버 시 실행되는 코드
		$(this).find('ul').css('background-color', '#eee');
	}, function() {
		// 마우스 아웃 시 실행되는 코드
		$(this).find('ul').css('background-color', ''); // 기본 배경색으로 변경
	});
});