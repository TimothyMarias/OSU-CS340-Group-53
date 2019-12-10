function searchPeopleName() {
    var personName = document.getElementById('peopleSearchText').value
    window.location = '/people/search/' + encodeURI(personName)
}
