var spinner

function showSpinner(flag){
	if(flag == true) {
		$('body').css('opacity', '0.3');
		jQuery(function(){
		    spinner = new Spinner().spin().el;
		    jQuery(document.body).append(spinner);
		    
		    var spinerTextFontSize = 14;
		    var spinerTextPadding = 10;
		    var spinerTextWidth = 200;
		    var spinerTextBorderWidth = 2;
		    var spinerTextMarginTop = (((spinerTextFontSize + (spinerTextBorderWidth * 2) + (spinerTextPadding * 2)) / 2) * -1);
		    var spinnerMarginLeft = (spinerTextWidth/2);
		 
		    $(spinner).append('<div class="spinerText"></div>');
		    $(".spinerText").css("width",spinerTextWidth + "px");
		    $(".spinerText").css("font-size",spinerTextFontSize + "px");
		    $(".spinerText").css("line-height",spinerTextFontSize + "px");
		    $(".spinerText").css("margin-top",spinerTextMarginTop + "px");
		    $(".spinerText").css("padding",spinerTextPadding + "px");
		    $(".spinerText").css("font-weight","bold");
		    $(".spinerText").css("display","table"); //'margin', 'auto')
		    $(".spinerTextDiv").css("display","table-cell");
		    $(".spinerTextDiv").css("text-align","center");
		    $(".spinerTextDiv").css("vertical-align","middle");
		    
		    $(spinner).css('margin-left','-' + spinnerMarginLeft + 'px');
		    $(spinner).css('margin', 'auto');
		});
	} else {
		$('body').css('opacity', '1');
		$(spinner).empty();
	}
};
