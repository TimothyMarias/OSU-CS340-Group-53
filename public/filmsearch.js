function searchFilmName() {
    var filmName = document.getElementById('filmSearchText').value
    window.location = '/film/search/' + encodeURI(filmName)
}
