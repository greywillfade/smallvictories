$(document).ready(function() {
	
    $('body').addClass('js');

    //Navigation actions
    var $menu = $('#menu'),
    $menulink = $('.menu-link');
  
	$menulink.click(function() {
		$menulink.toggleClass('active');
		$menu.toggleClass('active');
		return false;
	});

});