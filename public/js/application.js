$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $(".vote-button").on("click", function(event){
    event.preventDefault();
    var input = $(this).parent().attr("id");

    var a = $.ajax({
      url: "/posts/"+input+"/vote",
      type: "GET"
    })

    .done(function(result){
      console.log(result);
      $("#" + input + " .points" ).text(result)
    });
  });


  $(".delete").on("click", function(event){
    event.preventDefault();
    id = $(this).attr("href").match(/(\d)+/);
    $.ajax({
      method: "delete",
      url: "/posts/" + id

    })
    .done({
    $("#" + id).remove();
    });
  })


});
