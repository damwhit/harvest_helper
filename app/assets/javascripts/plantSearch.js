var input = $('#search')

function render(htmlField, plant) {
  var markup = [
  '<h5><a class="plant-link" href="/plants/'+ plant.id + '">' + plant.name + '</a></h5>',
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
