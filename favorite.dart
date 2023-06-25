import 'package:flutter/material.dart';
import 'package:putri_movie/common/models.dart';
import 'package:putri_movie/detail_movie.dart';

class FavoritePages extends StatefulWidget {
  const FavoritePages({super.key});

 @override
  void initState() {
    _listFavoriteMovie.addAll([
      LastestMovieModels(
        images: 'assets/film_4.jpg',
        title: 'Avenger Endgame',
        genre: 'Genre  : Adventure, Action',
        durasi: 'Durasi  : 1 jam 59 menit',
        sutradara: 'Sutradara  : Taka Watiti',
        rating: 'Rating usia  : 13 tahun',
        actor: 'Tom Hiddleston, Chris Hemsworth, Robert Downey Jr',
        description:
            ' Thor mengisi masa pensiunnya dengan mengembara mencari kedamaian serta berusaha mengembalikan bentuk tubuhnya. Namun, di tengah pengembaraannya Thor kembali diusik dengan kehadiran pembunuh antar galaxi Gorr the God Butcher yang membantai para Dewa.\nGorr the God Butcher memiliki tujuan untuk memusnahkan para Dewa. Menghadapi musuh yang sangat kuat tersebut Thor meminta bantuan King Valkyrie, Korg dan mantan pacarnya Jane Foster.\nBersama-sama, mereka memulai petualangan kosmik yang menegangkan untuk mengungkap dendam dari sang pembantai Dewa dan menghentikannya sebelum terlambat. Namun, yang cukup mengejutkan dalam kisah Thor kali ini, yakni palu ajaib palu ajaibnya, Mjolnir justru merespon kekuatan dan menghampiri Jane di tengah pertempuran.\nKembalinya Natalie Portman sebagai Jane Foster telah lama ditunggu-tunggu para penggemar series hero ini. Pasalnya, Jane tidak muncul lagi sejak putus dengan Thor.',
      ),
      LastestMovieModels(
        images: 'assets/film_5.jpg',
        title: 'DOCTOR STRANGE \MULTIVERSE OF MADNESS',
        genre: 'Genre  : Adventure, Action',
        durasi: 'Durasi  : 1 jam 6 menit',
        sutradara: 'Sutradara  : Sam Raimi',
        rating: 'Rating usia  : 13',
        actor: 'Scott Rix, Elizabeth Olsen, Hank Pym',
        description:
            ' dengan bantuan mstis baik melintasi multiverse yang membahayakan untuk menghadapi musuh',
      ),
      LastestMovieModels(
        images: 'assets/film_3.jpg',
        title: 'Avatar 2 The Way of Water',
        genre: 'Genre  : Fiksi ilmiah',
        durasi: 'Durasi  : 3 jam 12 menit',
        sutradara: 'Sutradara  : James Cameron',
        rating: 'Rating usia  : Semua umur',
        actor: 'Sam Worthington,oe saldana,kate winset',
        description:
            ' perjuangan Jake bersama keluarga kecilnya dalam melawan Sky people yg berniat menghancurkan pandora',
      ),
      LastestMovieModels(
        images: 'assets/film_2.jpg',
        title: 'Ant-Man',
        genre: 'Genre  : Adventure, Action',
        durasi: 'Durasi  : 2 jam 4 menit',
        sutradara: 'Sutradara  : Peter sohn',
        rating: 'Rating usia  : 17 tahun',
        actor: '(Paul Rudd, Evageline lilly)',
        description:'Menjelajahi Alam quantum rempat mereka menemukan mahluk aneh',
      ),
      LastestMovieModels(
        images: 'assets/film_1.jpg',
        title: 'DOCTOR STANGE \nMULTIVERSE OF MADNESS',
        genre: 'Genre  : Adventure, Action',
        durasi: 'Durasi  : 2 jam 6 menit',
        sutradara: 'Sutradara  : Sam Raimi',
        rating: 'Rating usia  : 13 tahun',
        actor: 'Scott Rix, Elizabeth Olsen, Hank Pym',
        description: ' dengan bantuan mstis baik melintasi multiverse yang membahayakan untuk menghadapi musuh',
      ),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: double.infinity,
            color: Colors.purpleAccent,
            child: const Center(
              child: Text(
                'Favorite Movie',
                style: TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
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
    return Padding(
      padding: const EdgeInsets.only(left: 5, top: 10, bottom: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return DetailMoviePages(
                title: listMovie[index].title,
                actor: listMovie[index].actor,
                description: listMovie[index].description,
                images: listMovie[index].images,
                genre: listMovie[index].genre,
                durasi: listMovie[index].durasi,
                sutradara: listMovie[index].sutradara,
                rating: listMovie[index].rating,
              );
            },
          ));
        },
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 200,
                width: 160,
                decoration: BoxDecoration(
                  // color: Colors.amber,
                  image: DecorationImage(
                    image: AssetImage(listMovie[index].images),
                    // fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    listMovie[index].title,
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    listMovie[index].actor,
                    style: const TextStyle(color: Colors.white),
                    maxLines: 50,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                  Text(
                    listMovie[index].durasi,
                    style: const TextStyle(color: Colors.blue),
                    maxLines: 50,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                  Text(
                    listMovie[index].genre,
                    style: const TextStyle(color: Colors.blue),
                    maxLines: 50,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                  Text(
                    listMovie[index].sutradara,
                    style: const TextStyle(color: Colors.blue),
                    maxLines: 50,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                  Text(
                    listMovie[index].rating,
                    style: const TextStyle(color: Colors.blue),
                    maxLines: 50,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
