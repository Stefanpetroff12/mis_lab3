class Joke {
  final int id;
  final String type;
  final String setup;
  final String line;

  Joke({required this.id, required this.type, required this.setup, required this.line});

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      id: json['id'] ?? 1,
      type: json['type'] ?? '',
      setup: json['setup'] ?? '',
      line: json['line'] ?? '',
    );
  }
}