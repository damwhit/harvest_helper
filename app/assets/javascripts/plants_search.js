var input = $('#search')

function render(htmlField, plant) {
  var markup = [
  '<h1>' + plant.name + '</h1>',
  '<h3 class="media-text">' + plant.description + '</h3>',
  '<img' + plant.image + '/>',
];

return htmlField.append(markup);
}

input.keyup(function(){
  $('#search-results').empty()
$.ajax({
  url: '/plants?term=' + input.val(),
  type: 'GET',
  dataType: "json",
}).success(function(plants) {
  console.log(plants)
  $.each(plants, function(index, plant) {
    render($('#search-results'), plant)
  })
}).fail(function(error) {
  console.log('Did not work', error)
})
})
