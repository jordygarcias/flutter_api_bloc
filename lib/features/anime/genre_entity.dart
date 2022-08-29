class GenreEntity {
  final String id;
  final String name;

  GenreEntity({
    required this.id,
    required this.name,
  });

  factory GenreEntity.fromJson(Map<String, dynamic> json) {
    return GenreEntity(
      id: json['mal_id'].toString(),
      name: json['name'],
    );
  }
}