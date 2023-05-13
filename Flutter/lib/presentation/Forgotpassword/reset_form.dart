import 'package:flutter/material.dart';
import 'package:taxi_final/presentation/Forgotpassword/forgot_controller.dart';
import 'package:taxi_final/presentation/login_screen/login_screen.dart';

class PasswordResetForm extends StatefulWidget {
  final String email;

  PasswordResetForm({key, required this.email});
  @override
  _PasswordResetFormState createState() => _PasswordResetFormState();
}

class _PasswordResetFormState extends State<PasswordResetForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _password = TextEditingController();
  TextEditingController _cPassword = TextEditingController();
  bool resetting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Reset Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _password,
                decoration: const InputDecoration(
                  labelText: 'New Password',
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your new password';
                  }
                  if (value.length < 8) {
                    return 'Password must be at least 8 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _cPassword,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please confirm your new password';
                  }
                  if (value != _password.value.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      resetting = true;
                    });
                    var res = await Forgotpassword().updatePassword({
                      'password': _password.value.text,
                      'email': widget.email
                    });

                    if (res == true) {
                      setState(() {
                        resetting = false;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text('Password updated successfully'),
                        ),
                      );
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => LoginScreen()));
                    } else {
                      setState(() {
                        resetting = false;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Cannot update password'),
                        ),
                      );
                    }
                  }
                },
                child:
                    Text(resetting == true ? 'Resetting...' : 'Reset Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
