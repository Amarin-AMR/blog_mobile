import 'package:blog_mobile/widgets/post_container.dart';
import 'package:flutter/material.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: const ColoredBox(
          color: Colors.pink,
        ),
        title: const Text(
          'Blog Mobile',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: const [
          PostContainer(),
          PostContainer(),
        ],
      ),
    );
  }
}
