class AnimeEntity {
  final String id;
  final String name;
  final String imageUrl;
  final String synopsis;
  final String rating;
  final double score;
  final List<String> genres;

  const AnimeEntity({
    required this.name,
    required this.imageUrl,
    required this.synopsis,
    required this.rating,
    required this.score,
    required this.genres,
    required this.id,
  });

  factory AnimeEntity.fromJson(Map<String,dynamic> json) {
    return AnimeEntity(
      id: json['mal_id'].toString(),
      name: json['title'],
      imageUrl: json['images']['jpg']['image_url'],
      synopsis: json['synopsis'],
      rating: json['rating'],
      score: json['score'] as double,
      genres: List<String>.from(json['genres'].map((item) => item['name'])),
    );
  }
}