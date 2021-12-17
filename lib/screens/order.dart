import 'dart:developer';
import 'package:shop_flutter_app/dependencies.dart';

import 'package:flutter/material.dart';

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

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
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
    return Theme(
      data: Theme.of(context).copyWith(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Оформление заказа'),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: <Widget>[
              _OrderTextField(
                controller: nameController,
                hintText: 'Имя',
                validator: validator('name'),
                cancelError: () => cancelError('name'),
              ),
              _OrderTextField(
                controller: emailController,
                hintText: 'email',
                validator: validator('email'),
                cancelError: () => cancelError('email'),
              ),
              _OrderTextField(
                controller: phoneController,
                hintText: 'Номер телефона',
                validator: validator('phone'),
                cancelError: () => cancelError('phone'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_formKey.currentState!.validate()) {
                    log(emailController.text);
                    Dependencies.instance.navigator.openReadyOrder();
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
