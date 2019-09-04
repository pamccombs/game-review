$(()=>{
    gameBindClickHandlers()
})

const gameBindClickHandlers = () => {
    $(".show_games_link").on("click", e => {
        e.preventDefault()
        history.pushState(null, null, "games")
        getGames()
        
    })

    $(document).on("click", ".show_game_link", e => {
        e.preventDefault()
        fetch(event.target.href + '.json')
        .then(res => res.json())
            .then(game => {
                console.log(game)

                var $ol = $("div.show_game ol")
                $ol.html("")
                

                let newGame = new Game(game)
                let gameHtml = newGame.formatShow()
                console.log(gameHtml)
                $ol.append(gameHtml);
                game.reviews.forEach(review => {

                    let newReview = new Review(review)
                    let reviewHtml = newReview.formatIndex()
                    console.log(reviewHtml)
                    $ol.append(reviewHtml);
                })
            })
    })
}

const getGames = () => {
    console.log(event.target.href + '.json')
        fetch(event.target.href + '.json')
        .then(res => res.json())
        .then(games => {

            var $ol = $("div.show_games ol")
            $ol.html("")
            games.forEach(game => {

                let newGame = new Game(game)
                let gameHtml = newGame.formatIndex()
                console.log(gameHtml)
                $ol.append(gameHtml);
            })
        })
}

function Game(game) {

    this.id = game.id
    this.title = game.title
    this.genre = game.genre
    this.platform = game.platform
    this.avg_rating = game.avg_rating
    this.reviews = game.reviews

}

Game.prototype.formatIndex = function() {
    let gameHtml = `
        <li><a href="/games/${this.id}" class= "show_game_link"> ${this.title}</a></li>
    `
    return gameHtml
}

Game.prototype.formatShow = function() {

    let gameHtml = `
        ${this.title} ${this.genre} ${this.platform} ${this.avg_rating} <br>
    `
    return gameHtml
}