// Generated by CoffeeScript 1.5.0-pre
var Home,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

Home = (function(_super) {
  var showBot, showTop;

  __extends(Home, _super);

  function Home() {
    return Home.__super__.constructor.apply(this, arguments);
  }

  Home.prototype.init = function() {
    var element, _i, _len, _ref;
    _ref = [$("article.top .content"), $("article.bot h4")];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      element = _ref[_i];
      element = $(element);
      element.css({
        "top": element.height()
      });
    }
  };

  Home.prototype.show = function() {
    return showBot(showTop() - .75);
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
    return TweenLite.to($("article.bot h4"), .4, {
      top: 0,
      delay: delay,
      ease: Quad.easeOut
    });
  };

  Home.prototype.hide = function() {};

  return Home;

})(Module);

new Home;
