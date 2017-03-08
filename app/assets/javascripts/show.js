/$(window).on("load", function() {
  $(".tab").on("click", function() {
    $(".tab.selected").removeClass("selected");
    $(this).addClass("selected");
    $(".contents .hh").hide();
    $("." + this.id).show();
  });
});
console.log("a")