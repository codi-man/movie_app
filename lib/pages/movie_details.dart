import 'package:flutter/material.dart';
import 'package:movie_app/models/movies_model.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;

  const MovieDetails({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 57, 55, 55),
      body: Stack(
        children: [
          // Image at the top
          SizedBox(
            height: 240,  // Fixed height for the image
            width: double.infinity,
            child: Image.asset(
              movie.posterUrl,
              fit: BoxFit.cover,
            ),
          ),
          // Movie details content
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 250),
            child: Container(
              color: const Color.fromARGB(255, 57, 55, 55),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Movie title and year
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          movie.title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        "(${movie.year})",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 203, 199, 199),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Star rating
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        index < 4 ? Icons.star : Icons.star_border, 
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Movie genres
                  Wrap(
                    spacing: 8.0,
                    children: movie.genre.map((genre) {
                      return Chip(
                        label: Text(genre),
                        backgroundColor: Colors.grey[800],
                        labelStyle: const TextStyle(color: Colors.white),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  // Storyline
                  _buildSectionHeader('Storyline'),
                  Text(
                    movie.storyline,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Cast section
                  _buildInfoRow('Cast:', movie.cast.join(', ')),
                  const SizedBox(height: 20),
                  // Initial Release section
                  _buildInfoRow('Initial Release:', movie.initialRelease),
                  const SizedBox(height: 20),
                  // IMDb Rating section
                  _buildInfoRow('IMDb Rating:', movie.imdbRating.toString()),
                ],
              ),
            ),
          ),
          // Transparent AppBar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: const IconThemeData(color: Colors.white),
              automaticallyImplyLeading: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.bookmark_border, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to build section headers
  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  // Helper function to build rows for cast, release date, etc.
  Widget _buildInfoRow(String label, String info) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        Expanded(
          child: Text(
            info,
            style: const TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 20,
              color: Colors.white,
            ),
            softWrap: true,
          ),
        ),
      ],
    );
  }
}