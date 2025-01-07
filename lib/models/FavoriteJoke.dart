class FavoriteJoke {
  final String id;
  final String setup;
  final String punchline;

  FavoriteJoke({required this.id, required this.setup, required this.punchline});

  Map<String, dynamic> toJson() => {
    'id': id,
    'setup': setup,
    'punchline': punchline,
  };

  factory FavoriteJoke.fromJson(Map<String, dynamic> json) {
    return FavoriteJoke(
      id: json['id'],
      setup: json['setup'],
      punchline: json['punchline'],
    );
  }
}
