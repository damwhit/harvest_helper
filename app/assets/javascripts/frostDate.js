var zipInput = $('#zip')
var tag = $('#tag')
var id = tag.attr("data-plant")

function add(htmltag, frostdate) {

var block = [
'<p class="plant-text">spring date: ' + frostdate.spring + '<br>fall date: ' + frostdate.fall +
'</p><p class="plant-text">*both fall and spring frost dates are based on threshold of 32 degrees and 50% probability</p>'
];

return htmltag.prepend(block);
}

zipInput.keypress(function(e){
  var key = e.which;
  if(key == 13){
    console.log("pressed enter")
    console.log(tag.attr("data-plant"))
    $('#frost-search').empty()
    e.preventDefault()
    $.ajax({
      url: '/plants/' + id + '?utf8=%E2%9C%93&zip=' + zipInput.val(),
      type: 'GET',
      dataType: "json",
    }).success(function(frostdate) {
      console.log(frostdate)
      add($('#frost-search'), frostdate)
    })
  }
});
