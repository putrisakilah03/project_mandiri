import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:putri_movie/common/models.dart';
import 'package:putri_movie/helpers/db_helpers.dart';
import 'package:putri_movie/ui/detail_movie.dart';

class InsertMovie extends StatefulWidget {
  const InsertMovie({super.key});

  @override
  State<InsertMovie> createState() => _InsertMovieState();
}

class _InsertMovieState extends State<InsertMovie> {
  DbHelpers dbHelpers = DbHelpers();
  List<LastestMovieModels> listmovies = [];

  TextEditingController titleController = TextEditingController();
  TextEditingController actorController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  XFile? _image;
  final picker = ImagePicker();

  Future<void> loadMovies() async {
    final loadedMovies = await dbHelpers.getAllMovies();
    setState(() {
      listmovies = loadedMovies;
    });
  }

  Future<void> saveMovies() async {
    if (titleController.text == '' || actorController.text == '' || descriptionController.text == '' || _image!.path == null) {
      return;
    }

    final movies = LastestMovieModels(
        images: _image!.path,
        title: titleController.text,
        actor: actorController.text,
        description: descriptionController.text,
        isFavorite: 0);

    await dbHelpers.insertMovie(movies);
    setState(() {
      _image = null;
      titleController.clear();
      actorController.clear();
      descriptionController.clear();
    });

    loadMovies();
  }

  @override
  void initState() {
    dbHelpers.database();
    loadMovies();
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    actorController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.pushNamed(context, '/');
        }, icon: const Icon(Icons.arrow_back)),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(10),
        children: [
          CustomTextField(
              fieldController: titleController, labelText: 'Title'),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            fieldController: actorController,
            labelText: 'Actor',
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            fieldController: descriptionController,
            labelText: 'Deskripsi',
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style:
                ElevatedButton.styleFrom(backgroundColor: Colors.amber),
            onPressed: () async {
              final pickedFile = await ImagePicker()
                  .pickImage(source: ImageSource.gallery);
              setState(() {
                if (pickedFile != null) {
                  _image = XFile(pickedFile.path);
                }
              });
            },
            child: const Text('Upload Poster'),
          ),
          _image != null
              ? Image.file(
                  File(_image!.path),
                  width: 200,
                  height: 200,
                )
              : Container(),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: saveMovies,
              child: const Text('Simpan Movies'),
            ),
          ),
          const SizedBox(height: 20,),
          ListView.builder(
            shrinkWrap: true, // Mengatur agar ListView.builder dapat berada di dalam ListView
            physics: const NeverScrollableScrollPhysics(), // Menghilangkan kemampuan menggulir ListView.builder
            itemCount: listmovies.length,
            itemBuilder: (context, index) {
              return ListTile(
                selectedTileColor: Colors.amberAccent,
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
                leading: Image.file(File(listmovies[index].images)),
                title: Text(
                  listmovies[index].title,
                ),
                subtitle: Text(
                  listmovies[index].actor,
                  style: const TextStyle(color: Colors.grey),
                ),
                trailing: IconButton(
                  onPressed: () {
                    dbHelpers.deleteMovie(listmovies[index].id!);
                    loadMovies();
                  },
                  icon: const Icon(Icons.delete),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    required this.fieldController,
    required this.labelText,
  }) : super(key: key);

  final TextEditingController fieldController;
  late String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: fieldController,
      decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  color: Colors.white, width: 1, style: BorderStyle.solid))),
    );
  }
}
