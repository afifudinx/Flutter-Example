import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/datas/sample.dart';
import 'package:flutter_instagram_clone/models/post.dart';
import 'package:flutter_instagram_clone/pages/user.dart';
import 'package:google_fonts/google_fonts.dart';

class MakePost extends StatefulWidget {
  final Post? post;
  const MakePost({Key? key, this.post}) : super(key: key);

  @override
  _MakePostState createState() => _MakePostState();
}

class _MakePostState extends State<MakePost> {
  dynamic maxLines = 2;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return UserPage(user: widget.post!.user);
                  }));
                },
                child: Container(
                  height: 36,
                  width: 36,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              'assets/images/${widget.post?.user?.profilePic}'))),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return UserPage(user: widget.post!.user);
                  }));
                },
                child: Text(widget.post!.user!.username!,
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700, fontSize: 16)),
              ),
              const Spacer(),
              const Icon(Icons.more_horiz)
            ],
          ),
        ),
        Image.asset(
          'assets/images/posts/${widget.post?.image}',
        ),
        Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Image.asset(
                    'assets/icons/icon-heart.png',
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Image.asset('assets/icons/icon-comment.png'),
                  const SizedBox(
                    width: 12,
                  ),
                  Image.asset('assets/icons/icon-share.png'),
                  const Spacer(),
                  Image.asset('assets/icons/icon-bookmark.png'),
                ]),
                const SizedBox(
                  height: 12,
                ),
                Text('100 Likes',
                    style: GoogleFonts.inter(fontWeight: FontWeight.w700)),
                const SizedBox(
                  height: 4,
                ),
                RichText(
                    overflow: TextOverflow.ellipsis,
                    maxLines: maxLines,
                    text: TextSpan(
                        style: GoogleFonts.inter(
                            color: Colors.black, fontWeight: FontWeight.w700),
                        text: Sample.selena.username,
                        children: [
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  setState(() {
                                    maxLines = 999;
                                  });
                                },
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w400),
                              text: '  ${widget.post?.caption}'),
                        ])),
                const SizedBox(
                  height: 4,
                ),
                Text('View all 75 comments',
                    style: GoogleFonts.inter(color: Colors.grey)),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Text('${widget.post?.comments!.keys.toList()[0]!.username}',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                        )),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                        '${widget.post?.comments![widget.post?.comments!.keys.toList()[0]!]}',
                        maxLines: 2,
                        style: GoogleFonts.inter())
                  ],
                ),
                Row(
                  children: [
                    Text('${widget.post?.comments!.keys.toList()[1]!.username}',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                        )),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                        '${widget.post?.comments![widget.post?.comments!.keys.toList()[1]!]}',
                        maxLines: 2,
                        style: GoogleFonts.inter())
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            )),
      ],
    );
  }
}
