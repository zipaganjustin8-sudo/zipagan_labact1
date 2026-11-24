import 'package:material_ui/material_ui.dart';
import '../widgets/newsfeed_card.dart';

// The newsfeed: a list of two posts.
// TODO: Post 1 is YOUR post. Replace 'Your Name' with your own name
// and write your own post text.
// TODO: Post 2 is by a CLASSMATE you pick. Replace "Classmate's Name"
// with their name and write their post text.

class Post {
  Post({
    required this.authorName,
    required this.date,
    required this.text,
    required this.likes,
    this.avatarAsset,
    this.imageAsset,
  });

  final String authorName;
  final String date;
  final String text;
  int likes;
  final String? avatarAsset;
  final String? imageAsset;
  
}

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({super.key});

  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  final List<Post> _posts = [
    Post(
      authorName: 'Justin Mae Zipagan',
      date: 'September 29',
      text: 'HBD to me! I am now officially 20 years old! 🎉🎂',
      likes: 168,
      avatarAsset: 'assets/icons/justin_maee.png',
      imageAsset: null,
    ),
    Post(
      authorName: "Charley Marie",
      date: 'December 2',
      text: 'Kicking off the holiday season!',
      likes: 900,
      // TODO: Add an image file named post_image.png to assets/images/,
      // or change this path to your own image. If the file is missing,
      // the card shows a grey placeholder instead of crashing.
      avatarAsset: 'assets/icons/charley_marie.jpg',
      imageAsset: 'assets/images/holiday.webp',
    ),
  ];

  void _likePost(int index) {
    setState(() {
      _posts[index].likes += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _posts.length,
      itemBuilder: (context, index) {
        final post = _posts[index];
        return NewsFeedCard(
          authorName: post.authorName,
          date: post.date,
          text: post.text,
          likes: post.likes,
          avatarAsset: post.avatarAsset,
          imageAsset: post.imageAsset,
          onLike: () => _likePost(index),
        );
      },
    );
  }
}
