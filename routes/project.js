
/*
 * GET home page.
 */

exports.index = function(req, res){
  res.render('project', { title: 'project' });
};