class JokeType {
  final String type;

  JokeType({required this.type});

  factory JokeType.fromJson(Map<String, dynamic> json) => JokeType (
    type: json["type"] ?? '',
  );
}