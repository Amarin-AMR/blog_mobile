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
  Widget _addbutton(
    BuildContext context, {
    required BlogViewModel model,
    required TextEditingController? titlecontroller,
    required TextEditingController? contentcontroller,
  }) {
    return IconButton(
      onPressed: () {
        _dialogAddPost(
          context,
          model: model,
          titlecontroller: titlecontroller,
          contentcontroller: contentcontroller,
        );
      },
      icon: const Icon(
        Icons.add,
        color: Colors.black,
      ),
    );
  }

  Future<String?> _dialogAddPost(
    BuildContext context, {
    required BlogViewModel model,
    required TextEditingController? titlecontroller,
    required TextEditingController? contentcontroller,
  }) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Add Post'),
        content: SizedBox(
          width: 400,
          child: Column(
            children: [
              _titlebox(model: model, titlecontroller: titlecontroller),
              const SizedBox(
                height: 20,
              ),
              _contentbox(model: model, contentcontroller: contentcontroller),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              model.addPost(model.title, model.content);

              Navigator.pop(context, 'OK');
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Widget _contentbox({
    required BlogViewModel model,
    required TextEditingController? contentcontroller,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2.0),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      height: 100,
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        onChanged: (value) {
          model.content = value;
        },
        decoration: const InputDecoration(
          hintText: 'any content',
          contentPadding: EdgeInsets.all(12),
          border: InputBorder.none,
        ),
        cursorColor: Colors.black,
        maxLines: 4,
        maxLength: 200,
        style: const TextStyle(
            color: Color(0xff0166ff), fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _titlebox({
    required BlogViewModel model,
    required TextEditingController? titlecontroller,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2.0),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      height: 52,
      child: TextFormField(
        onChanged: (value) {
          model.title = value;
        },
        decoration: const InputDecoration(
          hintText: 'any content',
          contentPadding: EdgeInsets.all(12),
          border: InputBorder.none,
        ),
        cursorColor: Colors.black,
        maxLines: 1,
        maxLength: 100,
        style: const TextStyle(
            color: Color(0xff0166ff), fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController? titlecontroller;
    TextEditingController? contentcontroller;
    return BaseScreen(
      initModel: (model) async {
        await model.postData();
      },
      builder: ((context, model, child) {
        return Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            leading: _addbutton(
              context,
              model: model,
              titlecontroller: titlecontroller,
              contentcontroller: contentcontroller,
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
