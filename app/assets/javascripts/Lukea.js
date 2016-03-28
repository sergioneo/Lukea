$(function(){
	
	$(".popup-btn").click(function(e){
		console.debug("abriendo "+".popup#"+$(this).attr("popup-target"));
		$(".popup-overlay").fadeIn();
		$(".popup.abierto").fadeOut();
		$(".popup.abierto").removeClass("abierto");
		$(".popup#"+$(this).attr("popup-target")).fadeIn();
		$(".popup#"+$(this).attr("popup-target")).addClass("abierto");
		e.stopPropagation();
	});
	
	$(".popup").click(function(e){
		$(".select-dropdown").hide();
		e.stopPropagation();
	});
	
	$("html").click(function(){
		$(".popup-overlay").fadeOut();
		$(".popup").fadeOut();
		$(".select-dropdown").hide();
		$(".dropdown-box").slideUp();
	});
	
	$(".awesome-lukea-input.select").each(function(index) {
		$(this).find("select").first().hide();
		var text = $(this).find("select").first().find("option:selected").first().text();
		$(this).append("<div class = 'select-block'><span class = 'label'>"+text+"</span><div class = 'select-dropdown'></div></div>");
		var options = "";
		$(this).find("select").first().find("option").each(function(ind){
			var val = $(this).val();
			var txt = $(this).text();
			options += "<div class = 'select-option' select-val = '"+val+"'>"+txt+"</div>";
		});
		$(this).find(".select-block .select-dropdown").first().html(options);
	}).promise().done( function(){ 
		$(".select-block").click(function(e){
			$(this).find(".select-dropdown").first().toggle();
			e.stopPropagation();
		});
		$(".select-option").click(function(e){
			block = $(this).parent().parent();
			block.find(".label").first().html($(this).html());
			total = block.parent();
			total.find("select").first().val($(this).attr("select-val"));
		});
	} );
	
	$(".dropdown-opener").click(function(e){
		$(this).find(".dropdown-box").first().slideToggle();
		e.stopPropagation();
	});
	
	$(".dropdown-box").click(function(e){e.stopPropagation();});
	
	$('.movies-slider').slick({
	   infinite: true,
	  slidesToShow: 3,
	  slidesToScroll: 3,
	  variableWidth: true
	});
	
	$(".movie-slider-selector").click(function(){
		var obj = $(this).attr("target");
		$(".movies-slider-theater ul li.active").removeClass("active");
		$(this).addClass("active");
		$(".movies-slider.active").fadeOut(function(){
			$(".movies-slider.active").removeClass("active");
			$(obj).fadeIn();
			$(obj).addClass("active");
		});
	});
	
	$(".star.input").click(function(){
		var pos = $(this).attr("num");
		for(var i = 1; i <= 5; i++){
			if (i <= pos) $(this).parent().find(".star.input[num='"+i+"']").first().removeClass("empty").addClass("full");
			else $(this).parent().find(".star.input[num='"+i+"']").first().removeClass("full").addClass("empty");
		}
		$(this).parent().find("input").first().val(pos);
		
	});
	
	$("#inputFoto-btn").click( function() {
		alert("hola");
		$("#inputFoto").click();
	});
	
});