$(document).on("turbolinks:load", function(){
  console.log("hoge");
  if (window.location.hash == "#_=_") window.location.hash = "";
})