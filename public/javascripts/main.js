// Generated by CoffeeScript 1.4.0
var init, show;

$(document).ready(function() {
  return init();
});

init = function() {
  return show();
};

show = function() {
  return $(".animated").each(function() {
    var $this;
    $this = $(this);
    $this.removeClass("hide");
    return $this.addClass("show");
  });
};