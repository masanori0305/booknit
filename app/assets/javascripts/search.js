$(window).on('load', function(){
  $("#button").on("click", function(e) {
    console.log("クリックされた");
    e.preventDefault();
    var text = $("#keyword").val();
    $.ajax({
      url: "/books/search_ajax",
      type: "GET",
      data: {keyword: text}
    })
    .done(function(date){
     console.log("成功");
     console.log(text);
    })
    .fail(function(date){
     console.log("失敗");
    })
  });
})






