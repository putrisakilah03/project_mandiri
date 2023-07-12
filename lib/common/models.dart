class LastestMovieModels {
  int? id;
  late String images;
  late String title;
  late String actor;
  late String description;
  late int? isFavorite;

  LastestMovieModels({this.id, required this.images, required this.title, required this.actor, required this.description, this.isFavorite = 0});

  LastestMovieModels.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    images = map['images'];
    title = map['title'];
    actor = map['actor'];
    description = map['description'];
    isFavorite = map['isFavorite'];
  } 

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'images': images,
      'title': title,
      'actor': actor,
      'description': description,
      'isFavorite': isFavorite
    };
  }

  

}