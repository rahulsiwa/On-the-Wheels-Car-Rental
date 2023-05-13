import 'package:flutter/material.dart';
import 'package:taxi_final/core/Repository/auth_repository.dart';
import 'package:taxi_final/core/app_export.dart';
import 'package:taxi_final/presentation/login_screen/login_screen.dart';
import 'package:taxi_final/widgets/app_bar/appbar_image.dart';
import 'package:taxi_final/widgets/app_bar/appbar_title.dart';
import 'package:taxi_final/widgets/app_bar/custom_app_bar.dart';
import 'package:taxi_final/widgets/custom_button.dart';
import 'package:taxi_final/widgets/custom_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isRegistering = false;

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
            text: "Signup",
          ),
        ),
        body: Form(
          key: _formKey,
          child: Container(
            width: size.width,
            padding: getPadding(
              left: 32,
              top: 37,
              right: 32,
              bottom: 37,
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
                      "Name",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInterExtraBold19,
                    ),
                  ),
                ),
                CustomTextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter name';
                    }
                    return null;
                  },
                  width: 325,
                  focusNode: FocusNode(),
                  controller: nameController,
                  hintText: "Enter your name",
                  margin: getMargin(
                    top: 3,
                  ),
                  prefix: Container(
                    margin: getMargin(
                      left: 18,
                      top: 7,
                      right: 8,
                      bottom: 7,
                    ),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgUser1,
                      height: getSize(
                        34.00,
                      ),
                      width: getSize(
                        34.00,
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
                      left: 14,
                      top: 13,
                    ),
                    child: Text(
                      "Email ID",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInterExtraBold19,
                    ),
                  ),
                ),
                CustomTextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Email';
                    }
                    return null;
                  },
                  width: 325,
                  focusNode: FocusNode(),
                  controller: emailController,
                  hintText: "Enter your email id",
                  margin: getMargin(
                    top: 4,
                  ),
                  textInputType: TextInputType.emailAddress,
                  prefix: Container(
                    margin: getMargin(
                      left: 15,
                      top: 12,
                      right: 14,
                      bottom: 8,
                    ),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgEmail1,
                      height: getVerticalSize(
                        28.00,
                      ),
                      width: getHorizontalSize(
                        31.00,
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
                      left: 14,
                      top: 13,
                    ),
                    child: Text(
                      "Password",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInterExtraBold19,
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
                  controller: passwordController,
                  hintText: "Enter your password",
                  margin: getMargin(
                    top: 5,
                  ),
                  textInputAction: TextInputAction.done,
                  prefix: Container(
                    margin: getMargin(
                      left: 19,
                      top: 8,
                      right: 9,
                      bottom: 8,
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
                CustomButton(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        isRegistering = true;
                      });
                      var data = {
                        "name": nameController.text,
                        "email": emailController.text,
                        "password": passwordController.text
                      };
                      var res = await AuthRepository().register(data);
                      if (res == 200) {
                        setState(() {
                          isRegistering = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.green,
                            content: Text('Registered successfully')));
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => LoginScreen()));
                      } else if (res == 401) {
                        setState(() {
                          isRegistering = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Email already taken')));
                      } else {
                        setState(() {
                          isRegistering = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Registration failed')));
                      }
                    }
                  },
                  height: 45,
                  width: 137,
                  text: isRegistering == true ? 'Wait...' : "Signup",
                  margin: getMargin(
                    top: 61,
                    bottom: 5,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: getPadding(
            left: 49,
            right: 54,
            bottom: 24,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: getPadding(
                  top: 2,
                  bottom: 2,
                ),
                child: Text(
                  "Already have an account?",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtInterRegular19,
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 2,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => LoginScreen()));
                  },
                  child: Text(
                    "Signin",
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
    );
  }
}
