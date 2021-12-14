import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';

class ReadyOrderScreen extends StatefulWidget {
  const ReadyOrderScreen({Key? key}) : super(key: key);

  @override
  _ReadyOrderScreenState createState() => _ReadyOrderScreenState();
}

class _ReadyOrderScreenState extends State<ReadyOrderScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final nameController = TextEditingController();

  Map<String, String> errors = {};
  String? emailErrorText;
  String? phoneErrorText;
  String? nameErrorText;

  validator(String key) => (String? value) {
        if (value == null || value.isEmpty) {
          return "Значение не должно быть пустым";
        }
        return null;
      };

  // String? phoneValidator(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return "Значение не должно быть пустым";
  //   }
  //   return null;
  // }
  //
  // String? nameValidator(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return "Значение не должно быть пустым";
  //   }
  //   return null;
  // }

  String? cancelError(String key) {
    setState(() {
      errors.remove(key);
    });
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox.fromSize(
              size: const Size.fromRadius(100),
              child: const FittedBox(
                child: Icon(IconData(0xe156, fontFamily: 'MaterialIcons')),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Text(
                'Заказ отправлен! Oжидайте звонка оператора',
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ),
            // IconData(0xe156, fontFamily: 'MaterialIcons'),
          ],
        ),
      ),
    );
  }
}
