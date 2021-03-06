var express = require('express');
var router = express.Router();
var execFile = require('child_process').execFile;

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index');
});

/* GIT PAYLOAD */
router.post('/', function(req, res, next) {
  var execOptions = {
    maxBuffer : 1024 * 1024
  }

  var branch = JSON.parse(req.body.payload).ref;
  if(branch !== "refs/heads/master") {
    console.log("Skipping deployment");
    res.sendStatus(200);
    return;
  }

  console.log("Performing deploy");

  execFile("/auto-git-deployer/util/update-script.sh", execOptions, function(error, stdout, stderr) {
    console.log('Git script executed');
    console.log(error);
  });

  res.sendStatus(200);
});

module.exports = router;
