import 'package:blog_mobile/views/blog_page/viewmodel.dart';
import 'package:blog_mobile/views/home_page/screen.dart';
import 'package:blog_mobile/views/login_page/viewmodel.dart';
import 'package:blog_mobile/views/regis_page/viewmodel.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginViewModel(context: context),
        ),
        ChangeNotifierProvider(
          create: (_) => BlogViewModel(context: context),
        ),
        ChangeNotifierProvider(
          create: (_) => RegisViewModel(context: context),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
