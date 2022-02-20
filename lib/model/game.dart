class Game {
  int id;
  String title;
  String thumbnail;
  String description;
  String genre;
  String platform;
  String publisher;
  String developer;
  String release_date;
  List<ScreenShot> screenshots;

  Game({
    this.description,
    this.developer,
    this.genre,
    this.id,
    this.platform,
    this.publisher,
    this.release_date,
    this.screenshots,
    this.thumbnail,
    this.title,
  });

  factory Game.fromJson(Map<String, dynamic> json) => Game(
        description: json['description'],
        developer: json['developer'],
        genre: json['genre'],
        id: json['id'],
        platform: json['platform'],
        publisher: json['publisher'],
        release_date: json['release_date'],
        screenshots: List.castFrom(json['screenshots'])
            .map((e) => ScreenShot.fromJson(e))
            .toList(),
        thumbnail: json['thumbnail'],
        title: json['title'],
      );
}

class ScreenShot {
  int id;
  String image;

  ScreenShot({this.id, this.image});

  factory ScreenShot.fromJson(Map<String, dynamic> json) => ScreenShot(
        id: json['id'],
        image: json['image'],
      );
}
