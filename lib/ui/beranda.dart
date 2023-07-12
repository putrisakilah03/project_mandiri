import 'dart:io';

import 'package:flutter/material.dart';
import 'package:putri_movie/common/models.dart';
import 'package:putri_movie/helpers/db_helpers.dart';
import 'package:putri_movie/ui/detail_movie.dart';

class BerandaPages extends StatefulWidget {
  const BerandaPages({super.key});

  @override
  State<BerandaPages> createState() => _BerandaPagesState();
}

class _BerandaPagesState extends State<BerandaPages> {
  List<LastestMovieModels> _listLatestMovie = [];
  List<LastestMovieModels> _listFavoriteMovie = [];

  DbHelpers dbHelpers = DbHelpers();
  List<LastestMovieModels> listmovies = [];

  Future<void> loadMovies() async {
    final loadedMovies = await dbHelpers.getAllMovies();
    setState(() {
      listmovies = loadedMovies;
    });
  }

  Future<void> setFavorite(id, isFavorite) async {
    int favorite = isFavorite == 1 ? 0 : 1;
    await dbHelpers.favoriteMovie(id, favorite);
    loadMovies();
  }

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/insert');
        },
        tooltip: 'Tambah Movie',
        child: const Icon(Icons.add),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          // Header Section
          _headerMovie(),

          const SizedBox(
            height: 20,
          ),
          //Search Section
          _searchMovie(),

          const SizedBox(
            height: 20,
          ),

          // Lastest Movie Section
          _lastestMovie(listmovies),
        ],
      ),
    );
  }

  Widget _headerMovie() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Welcome Putri',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Let\'s relax and watch some movies',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const CircleAvatar(
          backgroundColor: Colors.amber,
          backgroundImage: AssetImage('assets/profile.jpg'),
        )
      ],
    );
  }

  Widget _searchMovie() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        autofocus: false,
        decoration: InputDecoration(
          fillColor: Colors.grey.withOpacity(0.2),
          filled: true,
          labelText: 'Search Movie',
          floatingLabelBehavior: FloatingLabelBehavior.never,
          prefixIcon: const Icon(Icons.search),
          labelStyle: const TextStyle(color: Colors.amber),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }

  Widget _lastestMovie(List listmovies) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Latest Movie',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Jumlah kolom dalam grid
            mainAxisSpacing: 10.0, // Jarak antara item dalam satu baris
            crossAxisSpacing: 5.0, // Jarak antara kolom
            childAspectRatio: 0.75, // Rasio lebar-tinggi setiap item
          ),
          itemCount: listmovies.length,
          itemBuilder: (context, index) {
            return _cardMovieWidget(listmovies, index);
          },
        ),
      ],
    );
  }

  Widget _cardMovieWidget(listmovies, index) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return DetailMoviePages(
              title: listmovies[index].title,
              actor: listmovies[index].actor,
              description: listmovies[index].description,
              images: listmovies[index].images,
            );
          },
        ));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 5),
              height: 180,
              width: 160,
              decoration: BoxDecoration(
                // color: Colors.amber,
                image: DecorationImage(
                    image: Image.file(
                      File(listmovies[index].images),
                    ).image,
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  listmovies[index].title,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(color: Colors.white),
                ),
                IconButton(
                  onPressed: () {
                    setFavorite(
                        listmovies[index].id, listmovies[index].isFavorite);
                  },
                  color: listmovies[index].isFavorite == 1
                      ? Colors.redAccent
                      : Colors.grey,
                  icon: const Icon(
                    Icons.favorite_border_outlined,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // Widget _favoriteMovie() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       const Text(
  //         'Favorite Movie',
  //         style: TextStyle(fontSize: 20, color: Colors.white),
  //       ),
  //       Container(
  //         margin: const EdgeInsets.symmetric(vertical: 10),
  //         width: double.infinity,
  //         height: 250,
  //         child: ListView.builder(
  //           padding: EdgeInsets.zero,
  //           scrollDirection: Axis.horizontal,
  //           itemCount: _listFavoriteMovie.length,
  //           itemBuilder: (context, index) {
  //             return _cardMovieWidget(_listFavoriteMovie, index);
  //           },
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
