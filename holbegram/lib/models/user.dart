import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  final String uid;
  final String email;
  final String username;
  final String bio;
  final String photoUrl;
  final List<dynamic> followers;
  final List<dynamic> following;
  final List<dynamic> posts;
  final List<dynamic> saved;
  final String searchKey;

  const Users({
    required this.uid,
    required this.email,
    required this.username,
    required this.bio,
    required this.photoUrl,
    required this.followers,
    required this.following,
    required this.posts,
    required this.saved,
    required this.searchKey,
  });

  static Users fromSnap(DocumentSnapshot snap) {
    final snapshot = snap.data() as Map<String, dynamic>;

    return Users(
      uid: (snapshot['uid'] ?? snap.id) as String,
      email: (snapshot['email'] ?? '') as String,
      username: (snapshot['username'] ?? '') as String,
      bio: (snapshot['bio'] ?? '') as String,
      photoUrl: (snapshot['photoUrl'] ?? '') as String,
      followers: List<dynamic>.from(snapshot['followers'] ?? []),
      following: List<dynamic>.from(snapshot['following'] ?? []),
      posts: List<dynamic>.from(snapshot['posts'] ?? []),
      saved: List<dynamic>.from(snapshot['saved'] ?? []),
      searchKey: (snapshot['searchKey'] ?? '') as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'email': email,
    'username': username,
    'bio': bio,
    'photoUrl': photoUrl,
    'followers': followers,
    'following': following,
    'posts': posts,
    'saved': saved,
    'searchKey': searchKey,
  };
}
