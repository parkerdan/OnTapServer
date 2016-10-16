
var listener = (window.Turbolinks) ? "page:change":"DOMContentLoaded";

function addRecipeClick(element){
  var recipe = element.getAttribute('data-recipe');
  var title = element.getAttribute('data-title');
  element.addEventListener('click',function(){
    document.getElementById("recipe-modal-text").innerHTML = recipe.replace(/\n\r?/g, '<br />');
    document.getElementById("modal-header").innerHTML = title;
  });
};


document.addEventListener(listener, function(){

  if (document.getElementsByClassName("ribbon").length > 0) {

    var ribbons = document.getElementsByClassName("ribbon");

    for (var i = 0; i < ribbons.length; i++) {
      addRecipeClick(ribbons[i])
    }

  }

});
