class AnimeCharacterEntity {
  final String id;
  final String name;
  final String imageUrl;

  AnimeCharacterEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory AnimeCharacterEntity.fromJson(Map<String, dynamic> json) {
    return AnimeCharacterEntity(
      id: json['mal_id'].toString(),
      name: json['name'],
      imageUrl: json['images']['jpg']['image_url']
    );
  }
}