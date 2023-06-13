class Album {
  final int content;
  final int id;
  final String title;

  Album({
    required this.content,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      content: json['userid'],
      id: json['id'],
      title: json['title'],
    );
  }
}
