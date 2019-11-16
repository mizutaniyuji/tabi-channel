//= require jquery
//= require jquery_ujs
//= require_tree .

// 特定の位置までスクロール
$('.remind_register').click(function() {
  $("html,body").animate({scrollTop:$(".top_introduction").offset().top});
});


// Animate.cssのfadeInUpエフェクトを適用
$(".fadein").waypoint(function(direction) {
  if (direction === "down") {
    $(this.element).addClass("fadeInUp");
    this.destroy();
  }
}, { offset: "100%" });
