class Post {
  int userId;
  int id;
  String title;
  String body;

  Post({
    this.body,
    this.id,
    this.title,
    this.userId,
  });

  factory Post.fromJson(Map json) => Post(
        body: json['body'],
        id: json['id'],
        title: json['title'],
        userId: json['userId'],
      );
}
