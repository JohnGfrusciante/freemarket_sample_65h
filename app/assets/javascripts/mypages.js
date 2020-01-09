$(function($){
	$('.tab1').click(function(){
		$('.is-active1').removeClass('is-active1');
		$(this).addClass('is-active1');
		$('.is-show1').removeClass('is-show1');
		const index = $(this).index();
		$('.panel1').eq(index).addClass('is-show1');
	});
});

$(function($){
	$('.tab2').click(function(){
		$('.is-active2').removeClass('is-active2');
		$(this).addClass('is-active2');
		$('.is-show2').removeClass('is-show2');
		const index = $(this).index();
		$('.panel2').eq(index).addClass('is-show2');
	});
});