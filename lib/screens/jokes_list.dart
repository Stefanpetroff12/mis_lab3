import 'package:flutter/material.dart';
import '../models/Joke.dart';
import '../models/FavoriteJoke.dart';
import '../services/api_services.dart';
import '../services/firebase_service.dart';

class JokesListScreen extends StatelessWidget {
  final String type;

  JokesListScreen({required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$type Jokes')),
      body: FutureBuilder<List<Joke>>(
        future: ApiServices.getJokesByType(type),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final joke = snapshot.data![index];
                return Card(
                  child: ListTile(
                    title: Text(joke.setup),
                    subtitle: Text(joke.line),
                    trailing: IconButton(
                      icon: Icon(Icons.favorite_border),
                      onPressed: () async {
                        await FirebaseService.addFavoriteJoke(
                          FavoriteJoke(
                            id: joke.id.toString(),
                            setup: joke.setup,
                            punchline: joke.line,
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Added to favorites!')),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
