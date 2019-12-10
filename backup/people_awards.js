module.exports = function(){
    var express = require('express');
    var router = express.Router();

    function getPeople(res, mysql, context, complete){
        mysql.pool.query("SELECT people_id AS pid, name FROM people", function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.people = results;
            complete();
        });
    }

    function getAwards(res, mysql, context, complete){
        sql = "SELECT award_id AS aid, title FROM award";
        mysql.pool.query(sql, function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end()
            }
            context.awards = results
            complete();
        });
    }

    /* get people with awards */
    function getPeopleWithAwards(res, mysql, context, complete){
        sql = "SELECT pid, aid, people.name AS name, award.title AS certificate FROM people INNER JOIN award_people on people.people_id = award_people.pid INNER JOIN award on award.award_id = award_people.aid ORDER BY name, certificate"
         mysql.pool.query(sql, function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end()
            }
            context.people_with_certs = results
            complete();
        });
    }
  

    /* List of those with awards */
    router.get('/', function(req, res){
        var callbackCount = 0;
        var context = {};
        context.jsscripts = ["deleteperson.js"];
        var mysql = req.app.get('mysql');
        var handlebars_file = 'people_certs'

        getPeople(res, mysql, context, complete);
        getAwards(res, mysql, context, complete);
        getPeopleWithAwards(res, mysql, context, complete);
        function complete(){
            callbackCount++;
            if(callbackCount >= 3){
                res.render(handlebars_file, context);
            }
        }
    });

    /* Associate certificate or awards with a person and 
     * then redirect to the people_with_certs page after adding 
     */
    router.post('/', function(req, res){
        console.log("We get the multi-select certificate dropdown as ", req.body.certs)
        var mysql = req.app.get('mysql');
        // let's get out the awards from the array that was submitted by the form 
        var awards = req.body.awards
        var person = req.body.pid
        for (let award of awards) {
          console.log("Processing certificate id " + award)
          var sql = "INSERT INTO award_people (pid, aid) VALUES (?,?)";
          var inserts = [person, award];
          sql = mysql.pool.query(sql, inserts, function(error, results, fields){
            if(error){
                //TODO: send error messages to frontend as the following doesn't work
                /* 
                res.write(JSON.stringify(error));
                res.end();
                */
                console.log(error)
            }
          });
        } //for loop ends here 
        res.redirect('/people_certs');
    });

    /* Delete someone's award */
 
    router.delete('/pid/:pid/award/:aid', function(req, res){
        //console.log(req) //I used this to figure out where did pid and aid go in the request
        console.log(req.params.pid)
        console.log(req.params.aid)
        var mysql = req.app.get('mysql');
        var sql = "DELETE FROM award_people WHERE pid = ? AND aid = ?";
        var inserts = [req.params.pid, req.params.aid];
        sql = mysql.pool.query(sql, inserts, function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.status(400); 
                res.end(); 
            }else{
                res.status(202).end();
            }
        })
    })

    return router;
}();
