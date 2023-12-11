import 'package:flutter/material.dart';
class RegistrationPopup extends StatefulWidget {
  const RegistrationPopup({Key? key}) : super(key: key);

  @override
  State<RegistrationPopup> createState() => _RegistrationPopupState();
}

class _RegistrationPopupState extends State<RegistrationPopup> {
  final _formKey = GlobalKey<FormState>();
  ValueNotifier<String?> passwordNotifier = ValueNotifier('');  
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all( 12),
    child: AlertDialog(
      title: const Text('Registration'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return
 
'Please enter your email address.';
                }

                final regex = RegExp(r'^[a-zA-Z0-9.!#$%&''*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\$');

                if (!regex.hasMatch(value)) {
                  return 'Please enter a valid email address.';
                }

                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password.';
                }

                if (value.length < 8) {
                  return 'Please enter a password that is at least 8 characters long.';
                }

                return null;
              },
              obscureText: true,
              onChanged: (value) {
                 passwordNotifier.value = value;
              },
            ),
            TextFormField(
  decoration: const InputDecoration(
    labelText: 'Re-enter Password',
  ),
  validator: (value) {
    if (value!.isEmpty) {
      return 'Please enter your password again.';
    }

    if (value != passwordNotifier.value) {
      return 'The passwords do not match. Please enter the same password again.';
    }

    return null;
  },),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // Submit the form here
            }
          },
          child: const Text('Register'),
        ),
      ],
    ),
    );
  }
}