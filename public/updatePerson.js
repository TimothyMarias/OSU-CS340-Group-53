function updatePerson(id){
    $.ajax({
        url: '/people/' + id,
        type: 'PUT',
        data: $('#updatePerson').serialize(),
        success: function(result){
            window.location.replace("./");
        }
    })
};
