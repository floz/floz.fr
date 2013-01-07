
/*
 * GET home page.
 */

exports.index = function(req, res){
  res.render('works', { title: 'List of works' });
};