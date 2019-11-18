//= require jquery
//= require jquery.turbolinks
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

// 特定の位置までスクロール
$(".remind").click(function() {
  $("html,body").animate({scrollTop:$(".input_container").offset().top});
});


// Animate.cssのfadeInUpエフェクトを適用
$(".fadein").waypoint(function(direction) {
  if (direction === "down") {
    $(this.element).addClass("fadeInUp");
    this.destroy();
  }
}, { offset: "100%" });
