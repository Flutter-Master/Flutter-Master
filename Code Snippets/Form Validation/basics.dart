import 'package:flutter/material.dart';

class FormValidation extends StatefulWidget {
  @override
  _FormValidationState createState() => _FormValidationState();
}

class _FormValidationState extends State<FormValidation> {
  // used to get the current state
  // of the form
  final _formKey = GlobalKey<FormState>();

  // used to control username field
  TextEditingController _usernameController;
  // used to control password field
  TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    // initialising the controllers
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // disposing controllers when not
    // in user
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        // validating the form when FAB
        // is pressed
        onPressed: () {
          // This will call validate method
          // on the form.
          // If everything is correct, then it will
          // continue
          // Otherwise it show the defined error.
          if (_formKey.currentState.validate()) {
            // will print when form is validated
            print('Form submitted');
            print('Username: ${_usernameController.text}');
            print('Password: ${_passwordController.text}');
          }
        },
        child: const Icon(Icons.check),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                // adding controller to the field
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'username',
                ),
                validator: (String submittedValue) {
                  // logic for Form Validation
                  if (submittedValue.isEmpty) {
                    return 'username cannot be blank';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 30.0,
              ),
              TextFormField(
                // adding controller to the field
                controller: _passwordController,
                // hiding the content of the field
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'password',
                ),
                validator: (String submittedValue) {
                  // logic for Form Validation
                  if (submittedValue.length < 6) {
                    return 'password should have at least 6 characters';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
