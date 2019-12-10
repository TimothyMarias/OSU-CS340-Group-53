$(document).ready(function(){
	// Post data demonstration
	$("#peopleSearch").click(function(){
		// getting form text data
		var userInput = $("#peopleSearchText").val();
		 $.ajax({
	            url: "https://httpbin.org/post",
	            type:'POST',
	            dataType: 'json',
	            data: {'userInput': userInput},
	            success:function(data){
	            	// Call to output the results
			var userData = outputData(data);
			$("#outputSubmission").html(userData);
			$("#outputSubmission").val('');
			}
	    })

	});

});
	
// Output result from post demonstration
function outputData(data){
	return "<div><h4>Success: " + data.userInput + "</h4></div>";
}
