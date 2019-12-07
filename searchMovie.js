getMovieWithTitle(req, res, mysql, context, complete)
{
    var inserts = [req.body.search];
    var sql = 'SELECT title FROM film WHERE title LIKE %' + inserts + '%';
    mysql.pool.query(sql, inserts, function(error, results, fields){
        if(error){
            res.write(JSON.stringify(error));
            res.end();
        }
        context.search = results;
        complete();
    });
}