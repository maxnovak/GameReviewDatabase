/*Find all games with a score greater than 9.0*/
SELECT title, gameScore
    FROM review
        INNER JOIN game ON review.idGame = game.idGame
            WHERE gameScore >9.0
            ORDER BY gameScore;
            
/*Find all reviews whose score are greater than 8.5*/
SELECT title, gameScore, source, console, reviewText 
    FROM review
        INNER JOIN game ON review.idGame = game.idGame
            WHERE reviewScore > 8.5
            ORDER BY reviewScore;

/*Find all games from nintendo*/
SELECT title, developerName
    FROM developer
        INNER JOIN game ON developer.idDeveloper = game.idDeveloper
            WHERE developerName = 'Nintendo';
            
/*Find the reviews that have errors linked to them and bring up the error*/
SELECT title, errorText
    FROM review
        INNER JOIN errorReport ON review.idReview = errorReport.idReview
        INNER JOIN game ON review.idGame = game.idGame;
        
/*Find all users who have writen reviews*/
SELECT name
    FROM author
        INNER JOIN user ON author.idAuthor = user.idAuthor;
        
/*Find all authors who have a publisher*/
SELECT name
    FROM author
        WHERE publisher IS NOT NULL;

/*Find all games released after December 2011*/
SELECT title
    FROM game
        WHERE dateOfRelease>'2011-12-01 00:00:00';
        
