var input = $('#zip')
var tag = $('#tag')

input.keypress(function(e){
  var key = e.which;
  if(key == 13){
    console.log("pressed enter")
    $.ajax({
      url: '/plants/' + tag.attr("data-plant") + '?zip=' + input.val(),
      type: 'GET',
      dataType: "json",
    }).success(function(frostdates) {
      console.log(frostdates)
    })
  }
});
