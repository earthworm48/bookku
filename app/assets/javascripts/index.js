$(document).ready(function(){
	$('.category').click(function(event){
		event.preventDefault();
		$.ajax({
			url: $(this).attr('href') + "&ajax=true",
			dataType: "html",
			success: function(response){
				$('.books_section').html(response)
			}
		});
	})
});
