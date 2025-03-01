import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/pages/fecth_movies.dart';
import 'package:movie_app/pages/movie_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Movie>> futureMovies;
  late List<Movie> allMovies; // Store all movies
  List<Movie> filteredMovies = []; // Store filtered movies
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    futureMovies = fetchMovies(); // Fetch movies when the widget is initialized
    futureMovies.then((movies) {
      setState(() {
        allMovies = movies;
        filteredMovies = movies;
      });
    });

    // Listen for changes in the search field
    searchController.addListener(() {
      filterMovies();
    });
  }

  // Function to filter movies based on search input
  void filterMovies() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredMovies = allMovies.where((movie) {
        return movie.title.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top portion with "Watch Now" text and search icon
          Container(
            decoration: const BoxDecoration(color: Color.fromARGB(255, 57, 55, 55)),
            child: Padding(
              padding: const EdgeInsets.only(top: 90, left: 20, right: 20, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Watch Now",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    style: const TextStyle(
                      color: Colors.white
                    ),
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: "Search movies",
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 25,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          child: const Row(
                            children: [
                              Text(
                                "Populars",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          child: const Row(
                            children: [
                              Text(
                                "Coming Soon",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          child: const Row(
                            children: [
                              Text(
                                "Top Rated",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Movie Grid Section with Black Background
          Expanded(
            child: Container(
              color: Colors.black,
              child: FutureBuilder<List<Movie>>(
                future: futureMovies, // Use the fetched data
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    return GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(20),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.65,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: filteredMovies.length, // Show filtered movies
                      itemBuilder: (context, index) {
                        final movie = filteredMovies[index];
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => MovieDetails(movie: filteredMovies[index]));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15), // Apply to the entire card
                            ),
                            child: ClipRRect( // This ensures the entire card has rounded corners
                              borderRadius: BorderRadius.circular(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Image with rounded corners
                                  Image.asset(
                                    movie.posterUrl,
                                    height: 150,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                  // Content below the image
                                  Expanded(
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 57, 55, 55),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    movie.title,
                                                    style: const TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                    ),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                const SizedBox(width: 5),
                                                Text(
                                                  "(${movie.year})",
                                                  style: const TextStyle(color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 5),
                                            const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              "Genre: ${movie.genre.join(', ')}",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Text(
                                              "Director: ${movie.director}",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: Text(
                        'No movies found',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}