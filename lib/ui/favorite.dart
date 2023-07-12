import 'dart:io';

import 'package:flutter/material.dart';
import 'package:putri_movie/common/models.dart';
import 'package:putri_movie/helpers/db_helpers.dart';
import 'package:putri_movie/ui/detail_movie.dart';

class FavoritePages extends StatefulWidget {
  const FavoritePages({super.key});

  @override
  State<FavoritePages> createState() => _FavoritePagesState();
}

class _FavoritePagesState extends State<FavoritePages> {
  DbHelpers dbHelpers = DbHelpers();
  List<LastestMovieModels> _listFavoriteMovie = [];

  Future<void> loadFavoiteMovie() async {
    final loadedMovies = await dbHelpers.getAllMoviesFavorite();
    setState(() {
      _listFavoriteMovie = loadedMovies;
    });
  }

  @override
  void initState() {
    loadFavoiteMovie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: const Text(
          'Favorite Movie',
          style: TextStyle(fontSize: 20, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _listFavoriteMovie.isEmpty
              ? Center(
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'Favorite Movie Kosong',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              : Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      // scrollDirection: Axis.vertical,
                      itemCount: _listFavoriteMovie.length,
                      itemBuilder: (context, index) {
                        return _cardMovieWidget(_listFavoriteMovie, index);
                      },
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  Widget _cardMovieWidget(listMovie, index) {
    return ListTile(
      selectedTileColor: Colors.amberAccent,
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return DetailMoviePages(
              title: listMovie[index].title,
              actor: listMovie[index].actor,
              description: listMovie[index].description,
              images: listMovie[index].images,
            );
          },
        ));
      },
      leading: Image.file(File(listMovie[index].images)),
      title: Text(
        listMovie[index].title,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        listMovie[index].actor,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
