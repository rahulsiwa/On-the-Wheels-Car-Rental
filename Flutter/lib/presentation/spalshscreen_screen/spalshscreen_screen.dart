import 'package:flutter/material.dart';
import 'package:taxi_final/core/app_export.dart';

class SpalshscreenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: Container(
          width: size.width,
          padding: getPadding(
            left: 20,
            right: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgLogo1removebgpreview,
                height: getVerticalSize(
                  217.00,
                ),
                width: getHorizontalSize(
                  346.00,
                ),
                margin: getMargin(
                  top: 7,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
