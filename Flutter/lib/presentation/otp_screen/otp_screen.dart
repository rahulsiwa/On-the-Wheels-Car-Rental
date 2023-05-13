import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taxi_final/core/app_export.dart';
import 'package:taxi_final/widgets/app_bar/appbar_image.dart';
import 'package:taxi_final/widgets/app_bar/custom_app_bar.dart';
import 'package:taxi_final/widgets/custom_button.dart';

class OtpScreen extends StatelessWidget {
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
          leading: AppbarImage(
            height: getVerticalSize(
              43.00,
            ),
            width: getHorizontalSize(
              44.00,
            ),
            imagePath: ImageConstant.imgBackarrow1,
            margin: getMargin(
              left: 16,
              top: 6,
              bottom: 6,
            ),
          ),
          centerTitle: true,
          title: Text(
            "OTP Verification",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtInterBold30Gray900,
          ),
        ),
        body: Container(
          width: size.width,
          padding: getPadding(
            left: 24,
            top: 37,
            right: 24,
            bottom: 37,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: getHorizontalSize(
                  321.00,
                ),
                child: Text(
                  "Please enter the verification code here just we just sent you on rahu*******@gmail.com   ",
                  maxLines: null,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtInterMedium20,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 23,
                ),
                child: PinCodeTextField(
                  appContext: context,
                  length: 4,
                  obscureText: false,
                  obscuringCharacter: '*',
                  keyboardType: TextInputType.number,
                  autoDismissKeyboard: true,
                  enableActiveFill: true,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onChanged: (value) {},
                  pinTheme: PinTheme(
                    fieldHeight: getHorizontalSize(
                      58.00,
                    ),
                    fieldWidth: getHorizontalSize(
                      54.00,
                    ),
                    shape: PinCodeFieldShape.box,
                    selectedFillColor: ColorConstant.fromHex("#1212121D"),
                    activeFillColor: ColorConstant.fromHex("#1212121D"),
                    inactiveFillColor: ColorConstant.fromHex("#1212121D"),
                    inactiveColor: ColorConstant.gray900,
                    selectedColor: ColorConstant.gray900,
                    activeColor: ColorConstant.gray900,
                  ),
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 43,
                ),
                child: Text(
                  "Haven’t received the verification code?",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtInterMedium18,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 8,
                ),
                child: Text(
                  "Resend",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtInterBold18,
                ),
              ),
              Container(
                height: getVerticalSize(
                  48.00,
                ),
                width: getHorizontalSize(
                  138.00,
                ),
                margin: getMargin(
                  top: 30,
                  bottom: 5,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: getPadding(
                          left: 15,
                          bottom: 1,
                        ),
                        child: Text(
                          "Signin",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInterBold32,
                        ),
                      ),
                    ),
                    CustomButton(
                      height: 48,
                      width: 138,
                      text: "Verify",
                      variant: ButtonVariant.OutlineGray900_1,
                      fontStyle: ButtonFontStyle.InterBold28,
                      alignment: Alignment.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
