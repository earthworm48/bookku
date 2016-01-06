
$("#process-payment").click(function(){
	debugger
	alert( "Handler for .click() called." );
	$( "#payment-form" ).append( "<%= hidden_field_tag 'value', value: 30 %>" );
});