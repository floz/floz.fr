// Generated by CoffeeScript 1.5.0-pre
var Home, home;

Home = (function() {
  var showBot, showTop;

  function Home() {}

  Home.prototype.init = function() {
    var element, _i, _len, _ref;
    _ref = $("article.top .content");
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      element = _ref[_i];
      element = $(element);
      element.css({
        "top": element.height()
      });
    }
  };

  Home.prototype.show = function() {
    var delay;
    delay = showTop();
    return showBot(delay);
  };

  showTop = function() {
    var contents, delay, element, _i, _len;
    delay = 0;
    contents = $("article.top .content");
    for (_i = 0, _len = contents.length; _i < _len; _i++) {
      element = contents[_i];
      TweenLite.to(element, .4, {
        top: 0,
        delay: delay,
        ease: Quad.easeOut
      });
      delay += 0.075;
    }
    return delay;
  };

  showBot = function(delay) {
    return console.log(delay);
  };

  Home.prototype.hide = function() {};

  return Home;

})();

home = new Home;

home.init();

$(document).ready(function() {
  return home.show();
});
