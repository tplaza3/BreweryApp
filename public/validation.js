$(document).ready(function(){

  $(".error").hide();
  
  // Alternative, example of validation on-submit.
  $("#beer_form").on("submit", function(e){
    // By default, let the form be valid.
    var valid_form = true;
    
    var beer_name = $("#beer_name").val();
    if (beer_name === ""){
      $("#beer_name").next().show();
      valid_form = false;
    }
		
    var style = $("#style").val();
    if (style === ""){
      $("#style").next().show();
      valid_form = false;
    }
		
    var rating = $("#rating").val();
    if (rating === ""){
      $("#rating").next().show();
      valid_form = false;
    }
    
    if (valid_form === false){
      alert("INVALID FORM");
      e.preventDefault();
    }
    
  });
});