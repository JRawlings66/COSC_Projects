// RUN this script to create the inital database for Lab 2
// Run it only once. ;)
// If you run it twice, Use `MATCH (n) WHERE (n:Person OR n:Movie) DETACH DELETE n` to start over.

create (apollo:Movie{title: "Apollo 13",  tmdbId: 568,released: '1995-06-30', imdbRating: 7.6,
	genres: ['Drama', 'Adventure', 'IMAX'],
    tagline: "Houston, we have a problem."} )
	
create (sleep:Movie{title: "Sleepless in Seattle", 
    tmdbId: 858, released: '1993-06-25',imdbRating: 6.8,
	genres: ['Comedy', 'Drama', 'Romance'],
	tagline: 'What if someone you never met, someone you never saw, someone you never knew was the only someone for you?'})

create (hoffa:Movie{title: "Hoffa",  tmdbId: 10410, released: '1991-12-25',imdbRating: 6.6,
	genres: ['Crime', 'Drama'],
    tagline: "He didn't want law. He wanted justice."} )

create	(meg:Person{name: "Meg Ryan", born: '1961-11-19', tmdbId: 5344})
create	(tom:Person{name: "Tom Hanks", born: '1956-07-09', tmdbId: 31})
create	(jack:Person{name: "Jack Nicholson", born: '1937-04-22', tmdbId: 514})
create	(danny:Person{name: "Danny DeVito", born: '1944-11-17', tmdbId: 518})
