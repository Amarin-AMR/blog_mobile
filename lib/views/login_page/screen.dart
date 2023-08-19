import 'package:blog_mobile/views/regis_page/screen.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0, // get rid of shadow
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'back',
                  style: TextStyle(
                    color: Colors.grey,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 44),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _welcomeText(),
              _form(
                context,
                emailController: emailController,
                passController: passwordController,
              ),
              _loginButton(
                context,
                emailController: emailController,
                passController: passwordController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _welcomeText() {
  return SizedBox(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Welcome, back',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
          textAlign: TextAlign.start,
        ),
        Text(
          'please, enter the email and password',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey),
          textAlign: TextAlign.start,
        ),
      ],
    ),
  );
}

Widget _form(
  BuildContext context, {
  required TextEditingController? emailController,
  required TextEditingController? passController,
}) {
  return Column(
    children: [
      _textformfield(
        type: 'email',
        controller: emailController,
      ),
      const SizedBox(
        height: 8.0,
      ),
      _textformfield(
        type: 'password',
        controller: passController,
      ),
    ],
  );
}

Widget _textformfield({
  required String? type,
  required TextEditingController? controller,
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
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Enter your $type',
        contentPadding: const EdgeInsets.all(12),
        border: InputBorder.none,
      ),
      cursorColor: Colors.black,
      maxLines: 1,
      style: const TextStyle(
          color: Color(0xff0166ff), fontWeight: FontWeight.bold),
    ),
  );
}

Widget _loginButton(
  BuildContext context, {
  required TextEditingController? emailController,
  required TextEditingController? passController,
}) {
  return Column(
    children: [
      SizedBox(
        height: 52,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            debugPrint(emailController!.text.toString());
            debugPrint(passController!.text.toString());
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: const Color(0xff0166ff),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text('Login'),
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Don\'t have an account?'),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const RegisPage(),
                ),
              );
            },
            child: const Text(
              'Register now',
              style: TextStyle(
                color: Colors.grey,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      )
    ],
  );
}
