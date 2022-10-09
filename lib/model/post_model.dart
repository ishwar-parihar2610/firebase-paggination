import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  String? title;
  int? likes;
  String? createdAt;
  String? imgUrl;

  Post(
      {required this.createdAt,
      required this.imgUrl,
      required this.likes,
      required this.title});

  Post.fromJson(Map<String, dynamic> json)
      : this(
            title: json['title']! as String,
            likes: json['likes']! as int,
            createdAt: (json['createdAt']!).toString(),
            imgUrl: json['imageUrl']! as String);

  Map<String, Object?> toJson() => {
        'title': title,
        'likes': likes,
        'createdAt': createdAt,
        'imageUrl': imgUrl
      };
}
