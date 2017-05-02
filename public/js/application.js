$(document).ready(function() {
  $("#problem").hide();
  $("#generator-solver-checkbox").click(function(e) {
    $("#problem").toggle();
    $("#topic").toggle();
  }); 
});