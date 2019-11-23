module.exports = function(){
    var express = require('express');
    var router = express.Router();
	console.log("movie.js ran");
    function getMovie(res, mysql, context, id, complete){
        var sql = "SELECT film_id as id, title, box_office, genre, release_year, actor, director";
        var inserts = [id];
        mysql.pool.query(sql, inserts, function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.movie = results[0];
            complete();
        });
    }

    // Display films, use AJAX for insert and delete

    router.get('/', function(req, res){
        var callbackCount = 0;
        var context = {};
        context.javascripts = ["deleteMovie.js","filterMovie.js","searchMovie.js"];
        var mysql = req.app.get('mysql');
        getMovie(res, mysql, context, complete);
        function complete(){
            callbackCount++;
            if(callbackCount >= 2){
                res.render('movie', context);
            }

        }
    });

    // Display movie with provided title
		
    router.get('/search/:s', function(req, res){
        var callbackCount = 0;
        var context = {};
        context.javascripts = ["deleteMovie.js","filterMovie.js","searchMovie.js"];
        var mysql = req.app.get('mysql');
        getMovieWithTitle(req, res, mysql, context, complete);
        function complete(){
            callbackCount++;
            if(callbackCount >= 2){
                res.render('movie', context);
            }
        }
    });

    // Display movie for updating

    router.get('/:id', function(req, res){
        callbackCount = 0;
        var context = {};
        context.javascripts = ["updateMovie.js"];
        var mysql = req.app.get('mysql');
        getMovie(res, mysql, context, req.params.id, complete);
        function complete(){
            callbackCount++;
            if(callbackCount >= 2){
                res.render('update-movie', context);
            }

        }
    });

    /* Adds a person, redirects to the people page after adding */

    router.post('/', function(req, res){
        var mysql = req.app.get('mysql');
        var sql = "INSERT INTO film_movies (title, box_office, genre, director, actor, release_year) VALUES (?,?,?,?, ?, ?)";
        var inserts = [req.body.title, req.body.box_office, req.body.genre, req.body.director, req.body.actor, req.body.release_year];
        sql = mysql.pool.query(sql,inserts,function(error, results, fields){
            if(error){
                console.log(JSON.stringify(error))
                res.write(JSON.stringify(error));
                res.end();
            }else{
                res.redirect('/movie');
            }
        });
    });

    /* The URI that update data is sent to in order to update a person */

    router.put('/:id', function(req, res){
        var mysql = req.app.get('mysql');
        console.log(req.body)
        console.log(req.params.id)
        var sql = "UPDATE film_movies SET title=?, box_office=?, genre=?, director=?, actor=?, release_year=? WHERE film_id=?";
        var inserts = [req.body.title, req.body.box_office, req.body.genre, req.body.director, req.body.actor, req.body.release_year, req.params.id];
        sql = mysql.pool.query(sql,inserts,function(error, results, fields){
            if(error){
                console.log(error)
                res.write(JSON.stringify(error));
                res.end();
            }else{
                res.status(200);
                res.end();
            }
        });
    });
        var mysql = req.app.get('mysql');
        var sql = "DELETE FROM bsg_people WHERE character_id = ?";
        var inserts = [req.params.id];
        sql = mysql.pool.query(sql, inserts, function(error, results, fields){
            if(error){
                console.log(error)
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
