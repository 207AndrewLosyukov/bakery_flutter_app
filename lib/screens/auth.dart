import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shop_flutter_app/dependencies.dart';
import 'package:shop_flutter_app/models/user.dart';
import 'package:shop_flutter_app/redux/auth_page/actions.dart';
import 'package:shop_flutter_app/redux/auth_page/state.dart';
import 'package:shop_flutter_app/redux/auth_page/thunk.dart';
import 'package:shop_flutter_app/redux/state.dart';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class _OrderTextField extends StatelessWidget {
  final String? hintText;
  final Function validator; //todo поменять тип
  final TextEditingController controller;
  final String? error;
  final Function cancelError;
  final isPassword;

  const _OrderTextField(
      {Key? key,
        required this.isPassword,
      this.hintText,
      this.error,
      required this.cancelError,
      required this.validator,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: TextFormField(
        obscureText: isPassword ? true : false,
        onTap: () => cancelError(),
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          errorText: error,
          border: const OutlineInputBorder(),
        ),
        validator: (String? value) => validator(value),
      ),
    );
  }
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool doesWantToAuth = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  Map<String, String> errors = {};
  String? emailErrorText;
  String? passErrorText;

  String? cancelError(String key) {
    setState(() {
      errors.remove(key);
    });
  }

  @override
  void dispose() {
    passController.dispose();
    super.dispose();
  }

  validator(String key) => (String? value) {
        if (value == null || value.isEmpty) {
          return "Значение не должно быть пустым";
        }
        if (value != 'trumpyandex1@gmail.com' && value != '12345678') {
          return "Неправильные данные для входа";
        }
        return null;
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
              body: Center(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: [
                        if (!doesWantToAuth)
                          Padding(
                            padding: const EdgeInsets.only(top: 100.0),
                            child: Container(
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  side: const BorderSide(
                                    width: 1,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    doesWantToAuth = true;
                                  });
                                },
                                child: const Text("Войти через Google"),
                              ),
                            ),
                          ),
                        if (doesWantToAuth)
                          const Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: Text(
                              "Страница входа через Google",
                              style: TextStyle(fontSize: 22),
                            ),
                          ),
                        if (doesWantToAuth)
                          _OrderTextField(
                            isPassword: false,
                            controller: emailController,
                            hintText: 'E-mail',
                            validator: validator(passController.text),
                            cancelError: () => cancelError('E-mail'),
                          ),
                        if (doesWantToAuth)
                          _OrderTextField(
                            isPassword: true,
                            controller: passController,
                            hintText: 'Password',
                            validator: validator(emailController.text),
                            cancelError: () => cancelError('Password'),
                          ),
                        if (doesWantToAuth)
                          ElevatedButton(
                            onPressed: () {
                              // Validate will return true if the form is valid, or false if
                              // the form is invalid.
                              if (_formKey.currentState!.validate()) {
                                Dependencies.instance.store.dispatch(AddUser(const User("Дмитрий", "trumpyandex1@gmail.com", "")));
                                Dependencies.instance.navigator.replaceMainPage();
                              }
                            },
                            child: const Text('Submit'),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            );
  }
}
