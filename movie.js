<html>
<h1>Update {{movie.title}} {{movie.release_year}}:</h1>
<form id="update-movie" action="/movie" method="post">
	Title: <input type="text" name="title" value="{{movie.title}}"><br>
	Box Office: <input type="number" name="box_office" value="{{movie.box_office}}"><br>
	Year: <input type="number" name="release_year" value="{{movie.release_year}}"><br>
	Director: <input type="text" name="director" value="{{movie.director}}"><br>
	Top Billed Actor: <input type="text" name="actor" value="{{movie.actor}}"><br>
	Genre: <input type="text" name="box_office" value="{{movie.genre}}"><br>
        <option value="{{id}}">{{name}}</option>
        {{/each}}
    </select><br>
</form>
<button onclick="updateMovie({{movie.id}})">Update</button>
</html>
