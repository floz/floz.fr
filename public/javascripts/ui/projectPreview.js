// Generated by CoffeeScript 1.5.0-pre
var ProjectDetails, ProjectLayer, ProjectPreview, ProjectTitle,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

ProjectPreview = (function() {

  function ProjectPreview(target) {
    this.target = target;
    this.activate = __bind(this.activate, this);
    this.out = __bind(this.out, this);
    this.over = __bind(this.over, this);
    this.$target = $(this.target);
    this.$project = this.$target.find(".project");
    this.projectTitle = new ProjectTitle(this.$target.find(".cnt_project_title"));
    this.projectImg = new ProjectImg(this.$target.find(".cnt_img"), this.$project);
    this.layer = new ProjectLayer(this.$target.find(".layer"));
    this.init();
  }

  ProjectPreview.prototype.init = function() {
    this.$projectHolder = this.$target.find(".project_holder");
    this.baseProjectWidth = this.$target.width();
    return this.$project.css({
      opacity: 0
    });
  };

  ProjectPreview.prototype.over = function() {
    this.projectTitle.over();
    return this.layer.show();
  };

  ProjectPreview.prototype.out = function() {
    this.projectTitle.out();
    return this.layer.hide();
  };

  ProjectPreview.prototype.show = function(delay) {
    this.projectImg.startLoad();
    this.projectTitle.show(delay);
    delay += .2;
    TweenLite.to(this.$project, .3, {
      autoAlpha: 1,
      delay: delay + .05,
      easing: Quad.easeOut
    });
    return TweenLite.to(this, delay + .4, {
      onComplete: this.activate
    });
  };

  ProjectPreview.prototype.activate = function() {
    return $(this.target).find("a").hover(this.over, this.out);
  };

  return ProjectPreview;

})();

ProjectTitle = (function() {

  function ProjectTitle($title) {
    this.$title = $title;
    this.onComplete = __bind(this.onComplete, this);
    this.$cnt = this.$title.find(".cnt");
    this.$txt = this.$title.find(".project_title");
    this.init();
  }

  ProjectTitle.prototype.over = function() {
    TweenLite.to(this.$title, .4, {
      backgroundColor: "#ff9c66",
      ease: Quad.easeOut
    });
    return TweenLite.to(this.$txt, .4, {
      color: "#fff",
      ease: Quad.easeOut
    });
  };

  ProjectTitle.prototype.out = function() {
    TweenLite.to(this.$title, .4, {
      backgroundColor: "#ffffff",
      ease: Quad.easeIn
    });
    return TweenLite.to(this.$txt, .4, {
      color: "#3d3944",
      ease: Quad.easeIn
    });
  };

  ProjectTitle.prototype.init = function() {
    this.width = this.$cnt.width();
    return this.$title.css({
      opacity: 0,
      width: this.width * .4
    });
  };

  ProjectTitle.prototype.show = function(delay) {
    TweenLite.to(this.$title, .3, {
      opacity: 1,
      width: this.width + 2,
      delay: delay,
      easing: Cubic.easeOut,
      onComplete: this.onComplete
    });
    return TweenLite.to(this.$txt, .3, {
      top: 0,
      delay: delay + .2,
      easing: Cubic.easeOut
    });
  };

  ProjectTitle.prototype.onComplete = function() {
    return this.$txt.css("width", "auto");
  };

  return ProjectTitle;

})();

ProjectLayer = (function() {

  function ProjectLayer($layer) {
    this.$layer = $layer;
    this.details = new ProjectDetails(this.$layer.find(".details"));
    this.init();
  }

  ProjectLayer.prototype.init = function() {
    this.$bg = this.$layer.find(".background");
    this.$btZoomCircle = this.$layer.find(".circle");
    this.$btZoomPlus = this.$layer.find(".plus");
    this.$bt = this.$layer.find(".bt");
    this.$btTxt = this.$layer.find(".bt .txt");
    TweenLite.set(this.$btZoomCircle, {
      autoAlpha: 0,
      scale: .8
    });
    TweenLite.set(this.$btZoomPlus, {
      autoAlpha: 0,
      scale: .8,
      autoAlpha: 0,
      rotation: 20
    });
    return TweenLite.set(this.$bt, {
      x: 20
    });
  };

  ProjectLayer.prototype.show = function(delay) {
    this.killTweens();
    TweenLite.set(this.$btTxt, {
      top: 10
    });
    TweenLite.to(this.$bg, .4, {
      autoAlpha: 1,
      easing: Cubic.easeOut
    });
    TweenLite.to(this.$btZoomCircle, .2, {
      autoAlpha: 1,
      scale: 1,
      delay: .2,
      easing: Cubic.easeOut
    });
    TweenLite.to(this.$btZoomPlus, .2, {
      autoAlpha: 1,
      scale: 1,
      rotation: 0,
      delay: .3,
      easing: Cubic.easeOut
    });
    TweenLite.to(this.$bt, .2, {
      x: 0,
      autoAlpha: 1,
      delay: .3,
      easing: Cubic.easeOut
    });
    TweenLite.to(this.$btTxt, .2, {
      top: 0,
      delay: .45,
      easing: Cubic.easeOut
    });
    return this.details.show();
  };

  ProjectLayer.prototype.hide = function(delay) {
    this.details.hide();
    this.killTweens();
    TweenLite.to(this.$bg, .4, {
      autoAlpha: 0,
      delay: .2,
      easing: Cubic.easeIn
    });
    TweenLite.to(this.$btZoomCircle, .2, {
      autoAlpha: 0,
      scale: .8,
      delay: .05,
      easing: Cubic.easeIn
    });
    TweenLite.to(this.$btZoomPlus, .2, {
      autoAlpha: 0,
      scale: .8,
      rotation: 20,
      easing: Cubic.easeIn
    });
    TweenLite.to(this.$bt, .2, {
      x: 20,
      autoAlpha: 0,
      delay: .15,
      easing: Cubic.easeIn
    });
    return TweenLite.to(this.$btTxt, .2, {
      top: 0,
      easing: Cubic.easeIn
    });
  };

  ProjectLayer.prototype.killTweens = function() {
    TweenLite.killTweensOf(this.$bg);
    TweenLite.killTweensOf(this.$btZoomCircle);
    TweenLite.killTweensOf(this.$btZoomPlus);
    TweenLite.killTweensOf(this.$bt);
    return TweenLite.killTweensOf(this.$btTxt);
  };

  return ProjectLayer;

})();

ProjectDetails = (function() {

  function ProjectDetails($details) {
    this.$details = $details;
    this.$cnt = this.$details.find(".cnt");
    this.$txt = this.$details.find(".txt");
  }

  ProjectDetails.prototype.show = function(delay) {
    TweenLite.to(this.$details, .2, {
      bottom: 0,
      easing: Cubic.easeOut
    });
    return TweenLite.to(this.$txt, .2, {
      top: 0,
      delay: .25,
      easing: Cubic.easeOut
    });
  };

  ProjectDetails.prototype.hide = function(delay) {
    TweenLite.to(this.$details, .3, {
      bottom: -40,
      easing: Cubic.easeIn,
      delay: .15
    });
    return TweenLite.to(this.$txt, .2, {
      top: 11,
      easing: Cubic.easeIn
    });
  };

  return ProjectDetails;

})();
