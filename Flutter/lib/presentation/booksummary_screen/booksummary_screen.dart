import 'package:flutter/material.dart';
import 'package:taxi_final/core/app_export.dart';

class BooksummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgImage4,
                  height: getVerticalSize(
                    756.00,
                  ),
                  width: getHorizontalSize(
                    378.00,
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
