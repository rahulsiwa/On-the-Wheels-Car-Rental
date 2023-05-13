import 'package:flutter/material.dart';
import 'package:taxi_final/core/Repository/auth_repository.dart';
import 'package:taxi_final/core/app_export.dart';
import 'package:taxi_final/presentation/Forgotpassword/forgot_password.dart';
import 'package:taxi_final/presentation/bookinformation_screen/bookinformation_screen.dart';
import 'package:taxi_final/presentation/caronlocation_screen/caronlocation_screen.dart';
import 'package:taxi_final/presentation/register_screen/register_screen.dart';
import 'package:taxi_final/widgets/app_bar/appbar_image.dart';
import 'package:taxi_final/widgets/app_bar/appbar_title.dart';
import 'package:taxi_final/widgets/app_bar/custom_app_bar.dart';
import 'package:taxi_final/widgets/custom_button.dart';
import 'package:taxi_final/widgets/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  bool isSigning = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          height: getVerticalSize(
            56.00,
          ),
          leadingWidth: 60,
          centerTitle: true,
          title: AppbarTitle(
            text: "Login",
          ),
        ),
        body: Form(
          key: _formKey,
          child: Container(
            width: size.width,
            padding: getPadding(
              left: 32,
              top: 24,
              right: 32,
              bottom: 24,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: getPadding(
                      left: 19,
                      top: 7,
                    ),
                    child: Text(
                      "Email",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInterExtraBold20,
                    ),
                  ),
                ),
                CustomTextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter email';
                    }
                    return null;
                  },
                  width: 325,
                  focusNode: FocusNode(),
                  controller: _emailController,
                  hintText: "Enter your email",
                  margin: getMargin(
                    top: 4,
                  ),
                  textInputAction: TextInputAction.done,
                  prefix: Container(
                    margin: getMargin(
                      left: 17,
                      top: 7,
                      right: 11,
                      bottom: 9,
                    ),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgTelephone1,
                      height: getSize(
                        32.00,
                      ),
                      width: getSize(
                        32.00,
                      ),
                    ),
                  ),
                  prefixConstraints: BoxConstraints(
                    maxHeight: getVerticalSize(
                      48.00,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: getPadding(
                      left: 19,
                      top: 7,
                    ),
                    child: Text(
                      "Password",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInterExtraBold20,
                    ),
                  ),
                ),
                CustomTextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter password';
                    }
                    return null;
                  },
                  width: 325,
                  isObscureText: true,
                  focusNode: FocusNode(),
                  controller: _passwordController,
                  hintText: "Enter your password",
                  margin: getMargin(
                    top: 4,
                  ),
                  textInputAction: TextInputAction.done,
                  prefix: Container(
                    margin: getMargin(
                      left: 17,
                      top: 7,
                      right: 11,
                      bottom: 9,
                    ),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgTelephone1,
                      height: getSize(
                        32.00,
                      ),
                      width: getSize(
                        32.00,
                      ),
                    ),
                  ),
                  prefixConstraints: BoxConstraints(
                    maxHeight: getVerticalSize(
                      48.00,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ForgotPasswordForm()));
                        },
                        child: Text('Forgot password ?')),
                  ),
                ),
                CustomButton(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        isSigning = true;
                      });
                      var res = await AuthRepository().login(
                          _emailController.text, _passwordController.text);
                      if (res == true) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => CaronlocationScreen()));
                      } else if (res == 401) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Wrong password')));
                        setState(() {
                          isSigning = false;
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('User not found')));
                        setState(() {
                          isSigning = false;
                        });
                      }
                    }
                  },
                  height: 45,
                  width: 137,
                  text: isSigning == true ? 'Wait..' : "Login",
                  margin: getMargin(
                    top: 49,
                  ),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: getPadding(
                      right: 19,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: getPadding(
                            bottom: 4,
                          ),
                          child: Text(
                            "Don’t have an account?",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtInterRegular19,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 4,
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => RegisterScreen()));
                            },
                            child: Text(
                              "Signup",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtLondrinaSolidLight23,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
