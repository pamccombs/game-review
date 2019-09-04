$(()=>{
    reviewBindClickHandlers()
})

const reviewBindClickHandlers = () => {
    $(".show_reviews_link").on("click", e => {
        e.preventDefault()
        history.pushState(null, null, "reviews")
        getReviews()
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
    })
}

const getReviews = () => {
    fetch(event.target.href + '.json')
    .then(res => res.json())
    .then(reviews => {
        var $ol = $("div.show_reviews ol")
        $ol.html("")
        reviews.forEach(review => {
            let newReview = new Review(review)
            let reviewHtml = newReview.formatIndex()
            $ol.append(reviewHtml);
        })
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