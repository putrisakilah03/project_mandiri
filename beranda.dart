import 'package:flutter/material.dart';
import 'package:putri_movie/common/models.dart';
import 'package:putri_movie/detail_movie.dart';

class BerandaPages extends StatefulWidget {
  const BerandaPages({super.key});

  @override
  State<BerandaPages> createState() => _BerandaPagesState();
}

class _BerandaPagesState extends State<BerandaPages> {
  List<LastestMovieModels> _listLatestMovie = [];
  List<LastestMovieModels> _listFavoriteMovie = [];

  @override
  void initState() {
    _listLatestMovie.addAll([
      LastestMovieModels(
        images: 'assets/film_1.jpeg',
        title: 'Thor: Love And Thunder',
        actor: 'Tom Hiddleston, Chris Hemsworth, Robert Downey Jr',
        description:
            'Thor mengisi masa pensiunnya dengan mengembara mencari kedamaian serta berusaha mengembalikan bentuk tubuhnya. Namun, di tengah pengembaraannya Thor kembali diusik dengan kehadiran pembunuh antar galaxi Gorr the God Butcher yang membantai para Dewa.\nGorr the God Butcher memiliki tujuan untuk memusnahkan para Dewa. Menghadapi musuh yang sangat kuat tersebut Thor meminta bantuan King Valkyrie, Korg dan mantan pacarnya Jane Foster.\nBersama-sama, mereka memulai petualangan kosmik yang menegangkan untuk mengungkap dendam dari sang pembantai Dewa dan menghentikannya sebelum terlambat. Namun, yang cukup mengejutkan dalam kisah Thor kali ini, yakni palu ajaib palu ajaibnya, Mjolnir justru merespon kekuatan dan menghampiri Jane di tengah pertempuran.\nKembalinya Natalie Portman sebagai Jane Foster telah lama ditunggu-tunggu para penggemar series hero ini. Pasalnya, Jane tidak muncul lagi sejak putus dengan Thor.',
      ),
      LastestMovieModels(
        images: 'assets/film_2.jpg',
        title: 'Ant-Man and the \nWasp: Quantumania',
        actor: 'Scott Rix, Elizabeth Olsen, Hank Pym',
        description: ' Thor: Love And Thunder (2011)',
      ),
      LastestMovieModels(
        images: 'assets/film_3.jpg',
        title: 'Avatar 2 The Way of Water',
        actor: 'Tom Hiddleston, Chris Hemsworth, Robert Downey Jr',
        description: ' Thor: Love And Thunder (2011)',
      ),
    ]);
    _listFavoriteMovie.addAll([
      LastestMovieModels(
        images: 'assets/film_4.jpg',
        title: 'END GAME',
        actor: 'Tom Hiddleston, Chris Hemsworth, Robert Downey Jr',
        description:
            ' Thor mengisi masa pensiunnya dengan mengembara mencari kedamaian serta berusaha mengembalikan bentuk tubuhnya. Namun, di tengah pengembaraannya Thor kembali diusik dengan kehadiran pembunuh antar galaxi Gorr the God Butcher yang membantai para Dewa.\nGorr the God Butcher memiliki tujuan untuk memusnahkan para Dewa. Menghadapi musuh yang sangat kuat tersebut Thor meminta bantuan King Valkyrie, Korg dan mantan pacarnya Jane Foster.\nBersama-sama, mereka memulai petualangan kosmik yang menegangkan untuk mengungkap dendam dari sang pembantai Dewa dan menghentikannya sebelum terlambat. Namun, yang cukup mengejutkan dalam kisah Thor kali ini, yakni palu ajaib palu ajaibnya, Mjolnir justru merespon kekuatan dan menghampiri Jane di tengah pertempuran.\nKembalinya Natalie Portman sebagai Jane Foster telah lama ditunggu-tunggu para penggemar series hero ini. Pasalnya, Jane tidak muncul lagi sejak putus dengan Thor.',
      ),
      LastestMovieModels(
        images: 'assets/film_5.jpg',
        title: 'DOCTOR STANGE \nMULTIVERSE OF MADNESS',
        actor: 'Scott Rix, Elizabeth Olsen, Hank Pym',
        description: ' Thor: Love And Thunder (2011)',
      ),
      LastestMovieModels(
        images: 'assets/film_3.jpg',
        title: 'Avatar 2 The Way of Water',
        actor: 'Tom Hiddleston, Chris Hemsworth, Robert Downey Jr',
        description: ' Thor: Love And Thunder (2011)',
      ),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
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
            _lastestMovie(),

            // Favorite Movie Section
            _favoriteMovie(),
          ],
        ),
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

  Widget _lastestMovie() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Latest Movie',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _listLatestMovie.length,
            itemBuilder: (context, index) {
              return _cardMovieWidget(_listLatestMovie, index);
            },
          ),
        ),
      ],
    );
  }

  Widget _cardMovieWidget(listMovie, index) {
    return InkWell(
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
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              height: 200,
              width: 160,
              decoration: BoxDecoration(
                // color: Colors.amber,
                image: DecorationImage(
                    image: AssetImage(listMovie[index].images),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              listMovie[index].title,
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  Widget _favoriteMovie() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Favorite Movie',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          height: 250,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: _listFavoriteMovie.length,
            itemBuilder: (context, index) {
              return _cardMovieWidget(_listFavoriteMovie, index);
            },
          ),
        ),
      ],
    );
  }
}
