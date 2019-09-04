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

    $("#new_review").on("submit", function(e){
        e.preventDefault();
        const values = $(this).serialize()

        $.post('/reviews', values).done(function(data) {
            var $ol = $("div.show_new_review ol")
            $ol.html("")
            const newReview = new Review(data)
            const htmlToAdd = newReview.formatShow()
            $ol.html(htmlToAdd)
        })

        // $.ajax({
        //     type: ($("input[name='_method']").val() || this.method),
        //     url: this.action,
        //     data: $(this).serialize(),
        //     success: function(response){
                
        //         var $ol = $("div.show_reviews ol")
        //         $ol.append(response);
        //     }
        // })
        
    })
}

function Review(review) {

    this.id = review.id
    this.title = review.title
    this.game_title = review.game.game_title
    this.user = review.user
    this.rating = review.rating
    this.body = review.body

}

Review.prototype.formatIndex = function() {
    let reviewHtml = `
        <li> Review Title - <a href="/reviews/${this.id}" class= "show_link"> ${this.title}</a> <br> Game - ${this.game_title}</li>
    `
    return reviewHtml
}

Review.prototype.formatShow = function() {
    let reviewHtml = `
        <h2> New Review Submitted <h2>
        <h3>${this.game_title}</h3>
        <h3>${this.rating}</h3>
        <h3>${this.title}</h3>
        <h4>${this.body}</h4>
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
// $(function() {
//     $("#new_review").on("submit", function(e){
//         $.ajax({
//             type: ($("input[name='_method']").val() || this.method),
//             url: this.action,
//             data: $(this).serialize(),
//             success: function(response){
                
//                 var $ol = $("div.show_reviews ol")
//                 $ol.append(response);
//             }
//         })
//         e.preventDefault();
//     })
// })
