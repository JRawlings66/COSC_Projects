$(document).ready(() => {
	
});

$('nav li').hover(
	function(){
		$('ul',this).stop().slideDown(200);
	},
	function() {
		$('ul',this).stop().slideUp(200);
	}

);
$('.img-w-text').hover(
	function(){
		$('.img-w-text').stop().fadeToggle();
		console.log('image faded')
	}
);
	