import 'package:flutter/material.dart';
import 'package:taxi_final/core/app_export.dart';

class BookSuccessfullyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: CustomImageView(
          imagePath: ImageConstant.imgImage5,
          height: getVerticalSize(
            788.00,
          ),
          width: getHorizontalSize(
            393.00,
          ),
        ),
        bottomNavigationBar: Container(
          width: size.width,
          margin: getMargin(
            left: 1,
            right: 2,
            bottom: 2,
          ),
          padding: getPadding(
            left: 97,
            top: 6,
            right: 97,
            bottom: 6,
          ),
          decoration: AppDecoration.fillPurple100d2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: getPadding(
                    top: 3,
                    right: 27,
                  ),
                  child: Text(
                    "Back to home",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtInterSemiBold20,
                  ),
                ),
              ),
              CustomImageView(
                svgPath: ImageConstant.imgVectorBlack900,
                height: getVerticalSize(
                  6.00,
                ),
                width: getHorizontalSize(
                  162.00,
                ),
                margin: getMargin(
                  top: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
