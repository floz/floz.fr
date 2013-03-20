// Generated by CoffeeScript 1.5.0-pre
var BasicButton,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

BasicButton = (function() {

  function BasicButton(_$target) {
    this._$target = _$target;
    this.out = __bind(this.out, this);
    this.over = __bind(this.over, this);
    this._activate();
    this._$target.css("opacity", 0);
  }

  BasicButton.prototype._activate = function() {
    return this._$target.hover(this.over, this.out);
  };

  BasicButton.prototype.show = function(delay) {
    if (delay == null) {
      delay = 0;
    }
    return TweenLite.to(this._$target, .4, {
      opacity: 1,
      delay: delay
    });
  };

  BasicButton.prototype.hide = function() {
    return TweenLite.to(this._$target, .4, {
      opacity: 0
    });
  };

  BasicButton.prototype.over = function() {
    return TweenLite.to(this._$target, .2, {
      color: "#ffffff",
      backgroundColor: "#ff9c66",
      ease: Quad.easeOut
    });
  };

  BasicButton.prototype.out = function() {
    return TweenLite.to(this._$target, .2, {
      color: "#3d3944",
      backgroundColor: "#ffffff",
      ease: Quad.easeOut
    });
  };

  return BasicButton;

})();
