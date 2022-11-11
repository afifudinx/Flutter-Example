import 'package:flutter_instagram_clone/models/user.dart';

class Post {
  User? user;
  String? image;
  int? likesCount;
  String? caption;
  Map<User?, String?>? comments;

  Post({this.user, this.image, this.likesCount, this.caption, this.comments});
}
