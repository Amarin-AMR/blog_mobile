import 'package:blog_mobile/views/login_page/screen.dart';
import 'package:blog_mobile/views/regis_page/screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 40,
              height: 40,
              color: Colors.red,
              child: const Text('Logo'),
            ),
            _button(context),
          ],
        ),
      ),
    );
  }
}

Widget _button(
  BuildContext context,
) {
  return Column(
    children: [
      SizedBox(
        height: 52,
        width: 300,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const LoginPage(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: const Color(0xff0166ff),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text('Sign In'),
        ),
      ),
      const SizedBox(
        height: 16.0,
      ),
      SizedBox(
        height: 52,
        width: 300,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const RegisPage(),
              ),
            );
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (BuildContext context) => const LoginPage(),
            //   ),
            // );
          },
          // const ButtonStyle(
          //   backgroundColor:
          //       MaterialStatePropertyAll<Color>(Colors.white),
          // ),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(color: Color(0xffdadadb), width: 2.0),
            ),
          ),
          child: const Text(
            'Sign Up',
            style: TextStyle(color: Colors.black),
          ),
        ),
      )
    ],
  );
}
