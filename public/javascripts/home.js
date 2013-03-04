// Generated by CoffeeScript 1.4.0
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
    var $botTitle, $projects, delayAdd, i, p, _i, _ref, _results;
    $botTitle = $("article.bot h4");
    TweenLite.to($botTitle, .4, {
      top: 0,
      delay: delay,
      ease: Quad.easeOut
    });
    delayAdd = .2;
    $projects = $("article.bot li");
    _results = [];
    for (i = _i = 0, _ref = $projects.length; _i < _ref; i = _i += 1) {
      p = new ProjectPreview($projects[i]);
      p.show(delay + .1);
      delay += delayAdd;
      delayAdd *= .92;
      if (delayAdd < .05) {
        _results.push(delayAdd = .05);
      } else {
        _results.push(void 0);
      }
    }
    return _results;
  };

  Home.prototype.hide = function() {};

  return Home;

})(Module);

new Home;
