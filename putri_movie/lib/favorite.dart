import 'package:flutter/material.dart';
import 'package:putri_movie/common/models.dart';
import 'package:putri_movie/detail_movie.dart';

class FavoritePages extends StatefulWidget {
  const FavoritePages({super.key});

  @override
  State<FavoritePages> createState() => _FavoritePagesState();
}

class _FavoritePagesState extends State<FavoritePages> {
  List<LastestMovieModels> _listFavoriteMovie = [];
  @override
  void initState() {
    _listFavoriteMovie.addAll([
      LastestMovieModels(
        images: 'assets/film_4.jpg',
        title: 'END GAME',
        actor: 'Tom Hiddleston, Chris Hemsworth, Robert Downey Jr',
        description:
            ' Avengers: End Game (2019) Film ini diumumkan pada bulan Oktober 2014 sebagai Avengers: Infinity War - Part 2. Russo bersaudara ditunjuk untuk mengarahkan pada bulan April 2015, dan pada bulan Mei, Markus dan McFeely dikontrak sebagai penulis naskah film tersebut. Pada bulan Juli 2016, Marvel menghapus judul, merujuknya hanya sebagai Untitled Avengers. Pembuatan film dimulai pada bulan Agustus 2017 di Pinewood Atlanta Studios di Fayette County, Georgia, mengambil gambar secara berurutan dengan Infinity War, dan berakhir pada Januari 2018. Pembuatan film tambahan dilakukan di wilayah Metro dan Pusat Kota Atlanta dan New York. Judul resmi terungkap pada Desember 2018. Dengan perkiraan anggaran 356 juta dolar, menjadikan film ini termahal ketiga yang pernah dibuat..',
      ),
      LastestMovieModels(
        images: 'assets/film_5.jpg',
        title: 'DOCTOR STANGE \nMULTIVERSE OF MADNESS',
        actor: 'Scott Rix, Elizabeth Olsen, Hank Pym',
        description:
            ' Dr. Strange (Benedict Cumberbatch) mencoba mencari tahu siapa yang mengejar America Chavez (Xochitl Gomez), seorang gadis dengan kemampuan untuk melintasi multiverse. Untuk memecahkan masalah ini, Stephen Strange memutuskan meminta bantuan kepada penyihir yang paling kuat yang ia kenal, Wanda Maximoff (Elizabeth Olsen)',
      ),
      LastestMovieModels(
        images: 'assets/film_3.jpg',
        title: 'Avatar 2 The Way of Water',
        actor: 'Jake Sully dan Neytiri (Zoe Saldana)',
        description:
            'Film Avatar 2: The Way of Water mengisahkan sosok Jake Sully dengan pasangannya Neytiri tinggal bersama anak-anak mereka di tempat yang jauh dari Planet Pandora. Diceritakan bahwa mereka berjanji akan melakukan segala hal dan menghadapi segala rintangan untuk tetap bersama.. Akan tetapi, dikisahkan datanglah sebuah ancaman. Mereka harus memerangi kembalinya RDA.Hal tersebut membuat Jake Sully dan keluarganya harus kembali ke Planet Pandora. Dikisahkan pula bahwa terdapat klan baru serta tempat baru yang dekat dengan terumbu karang. ',
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
            color: Colors.amberAccent,
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
