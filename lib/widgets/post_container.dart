import 'package:blog_mobile/models/posts/post_model.dart';
import 'package:flutter/material.dart';

class PostContainer extends StatelessWidget {
  final PostModel? posts;
  const PostContainer({super.key, this.posts});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0.1,
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraint) => Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Expanded(
                    child: Text(
                      'Author //realate with ID',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    'times',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              const SizedBox(
                height: 4.0,
              ),
              Row(
                children: const [
                  Expanded(child: Text('title')),
                ],
              ),
              const SizedBox(height: 8),
              const Center(
                child: Text(
                  'content',
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
