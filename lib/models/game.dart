class Game {
  String? name;
  String? image;
  int? metaCritic;
  int? id;

  Game({this.metaCritic, this.name, this.image, this.id = 0});

  Game.fromJson(
    Map<String, dynamic> json,
  ) {
    name = json['name'];
    id = json['id'];
    image = json['background_image'];
    metaCritic = json['metacritic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['metaCritic'] = metaCritic;
    data['image'] = image;
    return data;
  }
}
