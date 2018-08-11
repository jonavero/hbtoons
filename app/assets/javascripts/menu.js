// $('document').ready(function(){


  $(".icono-menu").click(function(){
    $(".menu").slideToggle();
    $('.icono-menu').toggleClass('fa-bars');
    $('.icono-menu').toggleClass('fa-close');
  });

  $(window).resize(function(){
    var widthWindow = $(this).outerWidth();
    if(widthWindow > 480){
      $('nav.menu').show();
      $('nav.menu').css({
        "display":'flex'
      });
   }else {
     if($('nav.menu').css("display") == "flex" && $('.icono-menu').attr('class').search('fa-bars') >= 1){
       $('nav.menu').hide();
     }
   }
  });


var marcadores = document.querySelectorAll(".informacion-serie .marcadorSeries");
var btnMarcadores = document.querySelectorAll(".botontes-categorias .btn");

function eliminar(e) {
    e.preventDefault();
    let numeroMarcadores = marcadores.length;

    for(let i = 0; i < numeroMarcadores; i++){
        if(this.firstChild.nodeValue != marcadores[i].firstChild.nodeValue){
            marcadores[i].parentNode.parentNode.parentNode.style.display = "block";

            console.log(this + marcadores[i].firstChild);

        }else{
            marcadores[i].parentNode.parentNode.parentNode.style.display = "none";
            // console.log('Diferente; '+ this.firstChild.textContent + " " + marcadores[i].firstChild.nodeValue);
        }
    }
}

for(let i = 0; i < btnMarcadores.length; i++){
    btnMarcadores[i].addEventListener('click',eliminar);
}
// });
