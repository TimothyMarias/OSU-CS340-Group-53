function deletePerson(id){
    $.ajax({
        url: '/film/' + id,
        type: 'DELETE',
        success: function(result){
            window.location.reload(true);
        }
    })
};

function deleteFilm(fid, aid){
  $.ajax({
      url: '/film_awards/fid/' + fid + '/award/' + aid,
      type: 'DELETE',
      success: function(result){
          if(result.responseText != undefined){
            alert(result.responseText)
          }
          else {
            window.location.reload(true)
          } 
      }
  })
};
