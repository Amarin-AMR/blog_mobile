import 'package:blog_mobile/base/base_screen.dart';
import 'package:blog_mobile/views/blog_page/screen.dart';
import 'package:blog_mobile/views/login_page/viewmodel.dart';
import 'package:blog_mobile/views/regis_page/screen.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return BaseScreen(
        builder: ((context, model, child) {
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
                      model: model,
                      usernameController: usernameController,
                      passController: passwordController,
                    ),
                    _loginButton(
                      context,
                      model: model,
                      emailController: usernameController,
                      passController: passwordController,
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
        model: LoginViewModel(context: context));
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
    required TextEditingController? usernameController,
    required TextEditingController? passController,
    required LoginViewModel model,
  }) {
    return Column(
      children: [
        _textformfield(
          model: model,
          type: 'username',
          controller: usernameController,
        ),
        const SizedBox(
          height: 8.0,
        ),
        _textformfield(
          model: model,
          type: 'password',
          controller: passController,
        ),
      ],
    );
  }

  Widget _textformfield({
    required String? type,
    required LoginViewModel model,
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
        onChanged: (value) {
          if (type == 'username') {
            model.username = value;
          } else if (type == 'password') {
            model.password = value;
          }
        },
        obscureText: type == 'password' ? true : false,
        controller: controller,
        decoration: InputDecoration(
          errorText: (controller?.text.toString() == '') ? 'error' : null,
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
    required LoginViewModel model,
  }) {
    return Column(
      children: [
        SizedBox(
          height: 52,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () async {
              final navigator = Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const BlogPage(),
                ),
              );
              var response = await model.loginData();
              if (model.password == '' || model.username == '') {
              } else {
                debugPrint(response.token);
                navigator;
              }
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
}
