function searchPeopleName() {
    var personName = document.getElementById('nameSearchBox').value
    window.location = '/people/search/' + encodeURI(personName)
}
