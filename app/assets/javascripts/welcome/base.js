$('#show_login_form').click(function(){
		$('#login_form').css('display','block');
});

$('#close').click(function(){
		$('#login_form').css('display','none');
});

//$("a[rel=gallery]").fancybox({
//	'transitionIn'		: 'none',
//	'transitionOut'		: 'none',
//	'titlePosition' 	: 'over',
//	'titleFormat'		: function(title, currentArray, currentIndex, currentOpts) {
//		return '<span id="fancybox-title-over">Image ' + (currentIndex + 1) + ' / ' + currentArray.length + (title.length ? ' &nbsp; ' + title : '') + '</span>';
//	}
//});
//
//
//$("a[rel=youtube]").click(function() {
//		$.fancybox({
//				'padding'		: 0,
//				'autoScale'		: false,
//				'transitionIn'	: 'none',
//				'transitionOut'	: 'none',
//				'width'			: 680,
//				'height'		: 495,
//				'href' : this.href.replace(new RegExp("watch\\?v=", "i"), 'v/') + '&autoplay=1',
//				'type'			: 'swf',
//				'swf'			: {
//				   	 'wmode'		: 'transparent',
//					'allowfullscreen'	: 'true'
//				}
//			});
//	
//		return false;
//	});