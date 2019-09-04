$(()=>{
    reviewBindClickHandlers()
})

const reviewBindClickHandlers = () => {
    $(document).on("click", ".show_reviews_link", e => {
        e.preventDefault()
        history.pushState(null, null, "reviews")
        console.log(event.target.href + '.json')
        fetch(event.target.href + '.json')
        .then(res => res.json())
        .then(reviews => {

            var $ol = $("div.show_reviews ol")
            $ol.html("")
            reviews.forEach(review => {

                let newReview = new Review(review)
                let reviewHtml = newReview.formatIndex()
                console.log(reviewHtml)
                $ol.append(reviewHtml);
            })
        })
    })

    // $(document).on("click", ".show_link", e => {
    //     e.preventDefault()
    //     fetch(event.target.href + '.json')
    // })
}

function Review(review) {

    this.id = review.id
    this.title = review.title
    this.game_title = review.game.game_title
    this.user = review.user

}

Review.prototype.formatIndex = function() {
    let reviewHtml = `
        <li> Review Title - <a href="/reviews/${this.id}" class= "show_link"> ${this.title}</a> <br> Game - ${this.game_title}</li>
    `
    return reviewHtml
}





// 1. Load Via AJAX

// 1a .Manually Triggering AJAX (json) - Client-Side Logic Model
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

// 1b. Ask The Server For What To Do via AJAX - Server-Side AJAX Model - Remote True
// $(function(){
//     $("a.show_reviews_link").on("click", function(e){
//         $.ajax({
//             url: this.href,
//             dataType: 'script'
//         })
//         e.preventDefault();
//     })
// })

// 2. Submit via AJAX

// 2a. Client-Side
$(function() {
    $("#new_review").on("submit", function(e){
        $.ajax({
            type: ($("input[name='_method']").val() || this.method),
            url: this.action,
            data: $(this).serialize(),
            success: function(response){
                
                var $ol = $("div.show_reviews ol")
                $ol.append(response);
            }
        })
        e.preventDefault();
    })
})
