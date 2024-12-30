import 'package:doctor_app/components/button.dart';
import 'package:doctor_app/utils/config.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool obesecurePass = true;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              cursorColor: Config.primaryColor,
              decoration: const InputDecoration(
                hintText: 'email address',
                labelText: 'email',
                alignLabelWithHint: true,
                prefixIcon: Icon(Icons.email_outlined),
                prefixIconColor: Config.primaryColor,
              ),
            ),
            Config.spaceSmall,
            TextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              cursorColor: Config.primaryColor,
              decoration: InputDecoration(
                  hintText: 'password code',
                  labelText: 'password',
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.lock_outline),
                  prefixIconColor: Config.primaryColor,
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obesecurePass = !obesecurePass;
                        });
                      },
                      icon: obesecurePass
                          ? const Icon(
                              Icons.visibility_off_outlined,
                              color: Colors.black38,
                            )
                          : const Icon(
                              Icons.visibility_outlined,
                              color: Config.primaryColor,
                            ))),
            ),
            Config.spaceSmall,
            Button(
              width: double.infinity,
              title: 'Login',
              onPressed: (){},
              disable: false,
            ),
            Config.spaceSmall,
          ],
        ));
  }
}
