import 'package:flutter/material.dart';
import 'package:taxi_final/presentation/Forgotpassword/forgot_controller.dart';
import 'package:taxi_final/presentation/Forgotpassword/reset_form.dart';

class Otpform extends StatefulWidget {
  final String email;
  const Otpform({Key? key, required this.email}) : super(key: key);

  @override
  _OtpformState createState() => _OtpformState();
}

class _OtpformState extends State<Otpform> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  bool sendingEmail = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        sendingEmail = true;
      });
      var res = await Forgotpassword().checkOtp(
          {'otp': _emailController.value.text, 'email': widget.email});
      if (res == true) {
        setState(() {
          sendingEmail = false;
        });

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => PasswordResetForm(email: widget.email)));
      } else {
        setState(() {
          sendingEmail = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red, content: Text('Otp didnot matched.')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Forgot Password'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Otp',
                  hintText: 'Enter your otp',
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your otp';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                  onPressed: _submitForm,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.grey),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                    ),
                  ),
                  child:
                      Text(sendingEmail == true ? 'Checking...' : 'Check otp')),
            ],
          ),
        ),
      ),
    );
  }
}
