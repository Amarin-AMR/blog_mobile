import 'package:blog_mobile/base/base_screen.dart';
import 'package:blog_mobile/views/blog_page/viewmodel.dart';
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
    return BaseScreen(
      initModel: (model) async {
        await model.postData();
      },
      builder: ((context, model, child) {
        return Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
            title: const Text(
              'Blog Mobile',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
          ),
          body: ListView.builder(
            itemBuilder: ((context, index) {
              return PostContainer(posts: model.listPost?[index]);
            }),
            itemCount: model.listPost?.length,
          ),
        );
      }),
      model: BlogViewModel(context: context),
    );
  }
}
