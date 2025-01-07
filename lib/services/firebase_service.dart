import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/FavoriteJoke.dart';

class FirebaseService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final CollectionReference _favoritesCollection =
  _firestore.collection('favorites');

  static Future<void> addFavoriteJoke(FavoriteJoke joke) async {
    await _favoritesCollection.doc(joke.id).set(joke.toJson());
  }

  static Future<List<FavoriteJoke>> getFavoriteJokes() async {
    QuerySnapshot snapshot = await _favoritesCollection.get();
    return snapshot.docs
        .map((doc) => FavoriteJoke.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }
}
