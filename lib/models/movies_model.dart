class Movie {
  final int id;
  final String title;
  final int year;
  final List<String> genre;
  final String director;
  final String posterUrl;  // Add a new field for the poster URL
  final String storyline;   // Correct the name to singular, as it represents a single storyline
  final List<String> cast;  // Cast list
  final double imdbRating;  // IMDb rating
  final String initialRelease;  // Initial release date

  Movie({
    required this.id,
    required this.title,
    required this.year,
    required this.genre,
    required this.director,
    required this.posterUrl,
    required this.storyline,
    required this.cast,
    required this.imdbRating,
    required this.initialRelease,
  });

  // Modify the factory constructor to accept both posterUrl and storyline
  factory Movie.fromJson(Map<String, dynamic> json, String posterUrl, String storyline, List<String> cast, double imdbRating, String initialRelease) {
    return Movie(
      id: json['id'],
      title: json['title'],
      year: json['year'],
      genre: List<String>.from(json['genre']),
      director: json['director'],
      posterUrl: posterUrl,
      storyline: storyline,  // Now correctly passing storyline
      cast: cast,
      imdbRating: imdbRating,
      initialRelease: initialRelease,

    );
  }
}

// Manually assign poster URLs
List<String> posterUrls = [
  "assets/The-shawshank-redemption.jpg",
  "assets/the-god-father.jpg",
  "assets/the-dark-knight.jpg",
  "assets/pulp-fiction.jpg",
  "assets/forrest-gump.jpg",
  "assets/inception.jpg",
  "assets/the-matrix.jpg",
  "assets/lord-of-the-rings.jpg",
  "assets/the-dark-knight-return.jpg",
  "assets/interstellar.jpg",
  "assets/fight-club.jpg",
  "assets/gladiator.jpg",
  "assets/lord-of-the-rings.jpg",
  "assets/the-silence.jpg",
  "assets/the-departed.jpg",
  "assets/saving-private-ryan.jpg",
  "assets/the-prestige.jpg",
  "assets/glory.jpg",
  "assets/avengers.jpg",
  "assets/the-lion-king.jpg",
];

List<String> storylines = [
  "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.",
  "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.",
  "When the menace known as the Joker wreaks havoc and chaos on Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
  "The lives of two mob hitmen, a boxer, a gangster's wife, and a pair of diner bandits intertwine in four tales of violence and redemption.",
  "The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama man with an IQ of 75.",
  "A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a CEO.",
  "A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.",
  "A meek hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.",
  "Eight years after the Joker's reign of anarchy, Batman must confront the masked terrorist Bane, as he embarks on a mission to destroy Gotham City.",
  "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.",
  "An insomniac office worker and a devil-may-care soap maker form an underground fight club that evolves into much more.",
  "A former Roman General sets out to exact vengeance against the corrupt emperor who murdered his family and sent him into slavery.",
  "The fate of Middle-earth hangs in the balance as Frodo and Sam continue their perilous mission to destroy the One Ring.",
  "A young FBI cadet must confide in an incarcerated and manipulative killer to receive his help on catching another serial killer.",
  "An undercover cop and a mole in the police attempt to identify each other while infiltrating an Irish gang in Boston.",
  "Following the Normandy Landings, a group of U.S. soldiers go behind enemy lines to retrieve a paratrooper whose brothers have been killed in action.",
  "After a tragic accident, two stage magicians engage in a battle to create the ultimate illusion while sacrificing everything they have to outwit each other.",
  "Robert Gould Shaw leads the U.S. Civil War's first all-black volunteer company, fighting prejudices of both his own Union Army and the Confederates.",
  "Earth's mightiest heroes must come together and learn to fight as a team if they are going to stop the mischievous Loki and his alien army.",
  "Lion prince Simba and his father are targeted by his bitter uncle, who wants to ascend the throne himself.",
];

List<Map<String, dynamic>> movieDetails = [
  {
    "cast": ["Tim Robbins", "Morgan Freeman"],
    "director": "Frank Darabont",
    "imdbRating": 9.3,
    "initialRelease": "September 23, 1994"
  },
  {
    "cast": ["Marlon Brando", "Al Pacino"],
    "director": "Francis Ford Coppola",
    "imdbRating": 9.2,
    "initialRelease": "March 24, 1972"
  },
  {
    "cast": ["Christian Bale", "Heath Ledger"],
    "director": "Christopher Nolan",
    "imdbRating": 9.0,
    "initialRelease": "July 18, 2008"
  },
  {
    "cast": ["John Travolta", "Uma Thurman"],
    "director": "Quentin Tarantino",
    "imdbRating": 8.9,
    "initialRelease": "October 14, 1994"
  },
  {
    "cast": ["Tom Hanks", "Robin Wright"],
    "director": "Robert Zemeckis",
    "imdbRating": 8.8,
    "initialRelease": "July 6, 1994"
  },
  {
    "cast": ["Leonardo DiCaprio", "Joseph Gordon-Levitt"],
    "director": "Christopher Nolan",
    "imdbRating": 8.8,
    "initialRelease": "July 16, 2010"
  },
  {
    "cast": ["Keanu Reeves", "Laurence Fishburne"],
    "director": "Lana Wachowski, Lilly Wachowski",
    "imdbRating": 8.7,
    "initialRelease": "March 31, 1999"
  },
  {
    "cast": ["Elijah Wood", "Ian McKellen"],
    "director": "Peter Jackson",
    "imdbRating": 8.8,
    "initialRelease": "December 19, 2001"
  },
  {
    "cast": ["Christian Bale", "Tom Hardy"],
    "director": "Christopher Nolan",
    "imdbRating": 8.4,
    "initialRelease": "July 20, 2012"
  },
  {
    "cast": ["Matthew McConaughey", "Anne Hathaway"],
    "director": "Christopher Nolan",
    "imdbRating": 8.6,
    "initialRelease": "November 7, 2014"
  },
  {
    "cast": ["Brad Pitt", "Edward Norton"],
    "director": "David Fincher",
    "imdbRating": 8.8,
    "initialRelease": "October 15, 1999"
  },
  {
    "cast": ["Russell Crowe", "Joaquin Phoenix"],
    "director": "Ridley Scott",
    "imdbRating": 8.5,
    "initialRelease": "May 5, 2000"
  },
  {
    "cast": ["Elijah Wood", "Sean Astin"],
    "director": "Peter Jackson",
    "imdbRating": 8.9,
    "initialRelease": "December 18, 2003"
  },
  {
    "cast": ["Jodie Foster", "Anthony Hopkins"],
    "director": "Jonathan Demme",
    "imdbRating": 8.6,
    "initialRelease": "February 14, 1991"
  },
  {
    "cast": ["Leonardo DiCaprio", "Matt Damon"],
    "director": "Martin Scorsese",
    "imdbRating": 8.5,
    "initialRelease": "October 6, 2006"
  },
  {
    "cast": ["Tom Hanks", "Tom Sizemore"],
    "director": "Steven Spielberg",
    "imdbRating": 8.6,
    "initialRelease": "July 24, 1998"
  },
  {
    "cast": ["Hugh Jackman", "Christian Bale"],
    "director": "Christopher Nolan",
    "imdbRating": 8.5,
    "initialRelease": "October 20, 2006"
  },
  {
    "cast": ["Matthew Broderick", "Denzel Washington"],
    "director": "Edward Zwick",
    "imdbRating": 7.8,
    "initialRelease": "December 15, 1989"
  },
  {
    "cast": ["Robert Downey Jr.", "Chris Evans"],
    "director": "Joss Whedon",
    "imdbRating": 8.0,
    "initialRelease": "April 11, 2012"
  },
  {
    "cast": ["Matthew Broderick", "Jeremy Irons"],
    "director": "Roger Allers, Rob Minkoff",
    "imdbRating": 8.5,
    "initialRelease": "June 24, 1994"
  }
];