import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:putri_movie/common/models.dart';
import 'package:sqflite/sqflite.dart';

class DbHelpers {
  final String _nameDatabase = 'movies_db';

//create Database
  Database? _database;

//init database
  Future<Database> database() async {
    //checking database not null
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future _initDatabase() async {
    Directory docDirectory = await getApplicationDocumentsDirectory();
    String path = join(docDirectory.path, _nameDatabase);
    return openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        """CREATE TABLE movies (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, actor TEXT, description TEXT, images LONGTEXT, isFavorite INTEGER)""");
  }

  // insert movies
  Future<int> insertMovie(LastestMovieModels movie) async {
    Database db = await database();
    int result = await db.insert('movies', movie.toMap());
    return result;
  }

  Future<int> favoriteMovie(int id, int isFavorite) async {
    Database db = await database();
    var result = await db.update('movies', {'isFavorite': isFavorite}, where: 'id = ?', whereArgs: [id]);
    return result;
    
  }

  Future<int> deleteMovie(int id) async {
    Database db = await database();
    var result = await db.delete('movies', where: 'id = ?', whereArgs: [id]);
    return result;
  }

  Future<List<Map<String, dynamic>>> getMovies() async {
    Database db = await database();
    var result = await db.query('movies');
    return result;
  }

  Future<List<Map<String, dynamic>>> getMoviesFavorite() async {
    Database db = await database();
    var result = await db.query('movies', where: 'isFavorite = ?', whereArgs: [1]);
    return result;
  }
  
  Future<List<LastestMovieModels>> getAllMovies() async{
    var listMapsMovies = await getMovies();
    int count = listMapsMovies.length;

    List<LastestMovieModels> listMovies = [];
    for (var i = 0; i < count; i++) {
      listMovies.add(LastestMovieModels.fromMap(listMapsMovies[i]));
    }
    return listMovies;
  }

  Future<List<LastestMovieModels>> getAllMoviesFavorite() async{
    var listMapsFavoriteMovies = await getMoviesFavorite();
    int count = listMapsFavoriteMovies.length;

    List<LastestMovieModels> listMovies = [];
    for (var i = 0; i < count; i++) {
      listMovies.add(LastestMovieModels.fromMap(listMapsFavoriteMovies[i]));
    }
    return listMovies;
  }


}
