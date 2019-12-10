function getMovieWithTitle(req, res, mysql, context, complete)
{
    var inserts = [req.body.search];
    var sql = 'SELECT title FROM film WHERE title LIKE %' + inserts + '%';
    mysql.pool.query(sql, inserts, function(error, results, fields){
        if(error){
            res.write(JSON.stringify(error));
            res.end();
        }
        var data =[];
        for ( i=0; i <rows.length; i++)
        {
            data.push(rows[i].title);
        }
        res.send(JSON.stringify(data));
        complete();
    });
}