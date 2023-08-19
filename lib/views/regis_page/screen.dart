import 'package:blog_mobile/base/base_screen.dart';
import 'package:blog_mobile/views/regis_page/viewmodel.dart';
import 'package:flutter/material.dart';

class RegisPage extends StatefulWidget {
  const RegisPage({super.key});

  @override
  RegisPageState createState() => RegisPageState();
}

class RegisPageState extends State<RegisPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController? usernameController;
    TextEditingController? nameController;
    TextEditingController? emailController;
    TextEditingController? passController;
    TextEditingController? confirmPassController;
    return BaseScreen<RegisViewModel>(
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
                  _infoText(),
                  _form(
                    context: context,
                    model: model,
                    nameController: nameController,
                    usernameController: usernameController,
                    emailController: emailController,
                    passController: passController,
                    confirmPassController: confirmPassController,
                  ),
                  _regisButton(
                    context: context,
                    model: model,
                    nameController: nameController,
                    usernameController: usernameController,
                    emailController: emailController,
                    passController: passController,
                    confirmPassController: confirmPassController,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
      model: RegisViewModel(context: context),
    );
  }
}

Widget _infoText() {
  return SizedBox(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Sign in, with us',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
          textAlign: TextAlign.start,
        ),
        Text(
          'Please, enter the username, email address and password here.',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey),
          textAlign: TextAlign.start,
        ),
      ],
    ),
  );
}

Widget _form({
  required BuildContext context,
  required RegisViewModel model,
  required TextEditingController? usernameController,
  required TextEditingController? emailController,
  required TextEditingController? nameController,
  required TextEditingController? passController,
  required TextEditingController? confirmPassController,
}) {
  return Column(
    children: [
      _textformfield(
        type: 'name',
        controller: nameController,
        model: model,
      ),
      const SizedBox(
        height: 8.0,
      ),
      _textformfield(
        type: 'username',
        controller: usernameController,
        model: model,
      ),
      const SizedBox(
        height: 8.0,
      ),
      _textformfield(
        type: 'email',
        controller: emailController,
        model: model,
      ),
      const SizedBox(
        height: 8.0,
      ),
      _textformfield(
        type: 'password',
        controller: passController,
        model: model,
      ),
      const SizedBox(
        height: 8.0,
      ),
    ],
  );
}

Widget _textformfield({
  String? type,
  required RegisViewModel model,
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
        if (type == "email") {
          model.email = value;
        } else if (type == 'name') {
          model.name = value;
        } else if (type == 'username') {
          model.username = value;
        } else if (type == 'password') {
          model.password = value;
        }
        debugPrint(value);
      },
      decoration: InputDecoration(
        isDense: type == 'password' ? true : false,
        hintText: type,
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

Widget _regisButton({
  required BuildContext context,
  required RegisViewModel model,
  required TextEditingController? usernameController,
  required TextEditingController? emailController,
  required TextEditingController? nameController,
  required TextEditingController? passController,
  required TextEditingController? confirmPassController,
}) {
  return Column(
    children: [
      SizedBox(
        height: 52,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () async {
            final navigator = Navigator.of(context);
            final scaffoldMessenger = ScaffoldMessenger.of(context);
            var response = await model.regisData();

            if (response.status == '') {
              var snackbar = const SnackBar(
                content: Text('success'),
              );
              scaffoldMessenger.showSnackBar(snackbar);
              navigator.pop();
            } else {
              var snackbar = const SnackBar(
                content: Text('Failed'),
              );
              scaffoldMessenger.showSnackBar(snackbar);
            }
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: const Color(0xff0166ff),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text('Register'),
        ),
      ),
    ],
  );
}
