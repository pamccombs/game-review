//Manually Triggering AJAX (json) - Client-Side Logic Model
// $(function(){
//     $("a.show_reviews_link").on("click", function(e){
//         $.get(this.href).success(function(json){
//             var $ol = $("div.show_reviews ol")
//             $ol.html("")
//             //console.log(json.reviews)
//             json.reviews.forEach(function(review){
//                 $ol.append("<li>" + review.title + "<br>" + review.game.game_title + "</li>");
//             })
//         })
//         e.preventDefault();      
//     })
// })

// Ask The Server For What To Do via AJAX - Server-Side AJAX Model - Remote True
$(function(){
    $("a.show_reviews_link").on("click", function(e){
        $.ajax({
            url: this.href,
            dataType: 'script'
        })
        e.preventDefault();
    })
})
