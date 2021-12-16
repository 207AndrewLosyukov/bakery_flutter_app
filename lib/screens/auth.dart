import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class _OrderTextField extends StatelessWidget {
  final String? hintText;
  final Function validator; //todo поменять тип
  final TextEditingController controller;
  final String? error;
  final Function cancelError;

  const _OrderTextField(
      {Key? key,
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
  AuthScreen({Key? key}) : super(key: key);

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
                    controller: emailController,
                    hintText: 'E-mail',
                    validator: validator('E-mail'),
                    cancelError: () => cancelError('E-mail'),
                  ),
                if (doesWantToAuth)
                  _OrderTextField(
                    controller: passController,
                    hintText: 'Password',
                    validator: validator('Password'),
                    cancelError: () => cancelError('Password'),
                  ),
                if (doesWantToAuth)
                  ElevatedButton(
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState!.validate()) {
                        // Сюда писать аутентификацию
                        // auth();
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
