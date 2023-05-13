import 'package:flutter/material.dart';
import 'package:taxi_final/core/app_export.dart';
import 'package:taxi_final/presentation/login_screen/login_screen.dart';
import 'package:taxi_final/presentation/onboarding2_screen/onboarding2_screen.dart';
import 'package:taxi_final/presentation/onboarding3_screen/onboarding3_screen.dart';

class Onboarding1Screen extends StatelessWidget {
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
            left: 7,
            top: 40,
            right: 7,
            bottom: 40,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Spacer(),
              Container(
                height: getVerticalSize(
                  243.00,
                ),
                width: getHorizontalSize(
                  375.00,
                ),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgPage2ndremovebgpreview,
                      height: getVerticalSize(
                        195.00,
                      ),
                      width: getHorizontalSize(
                        375.00,
                      ),
                      alignment: Alignment.bottomCenter,
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Onthewheels",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtLondrinaSolidRegular50,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: getHorizontalSize(
                  215.00,
                ),
                margin: getMargin(
                  top: 11,
                ),
                child: Text(
                  "Welcome to our car rental",
                  maxLines: null,
                  textAlign: TextAlign.center,
                  style: AppStyle.txtLondrinaSolidRegular30,
                ),
              ),
              Container(
                width: getHorizontalSize(
                  315.00,
                ),
                margin: getMargin(
                  top: 26,
                ),
                child: Text(
                  "On the wheels is an easy to use car rental  application. On the wheels is an easy to use car rental  application. On the wheels is an easy to use car rental  application.",
                  maxLines: null,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtInterExtraBold155,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: getVerticalSize(
                        19.00,
                      ),
                      width: getHorizontalSize(
                        21.00,
                      ),
                      decoration: BoxDecoration(
                        color: ColorConstant.gray900,
                        borderRadius: BorderRadius.circular(
                          getHorizontalSize(
                            10.00,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: getVerticalSize(
                        14.00,
                      ),
                      width: getHorizontalSize(
                        15.00,
                      ),
                      margin: getMargin(
                        left: 5,
                        top: 2,
                        bottom: 3,
                      ),
                      decoration: BoxDecoration(
                        color: ColorConstant.gray900,
                        borderRadius: BorderRadius.circular(
                          getHorizontalSize(
                            7.00,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: getVerticalSize(
                        14.00,
                      ),
                      width: getHorizontalSize(
                        15.00,
                      ),
                      margin: getMargin(
                        left: 5,
                        top: 2,
                        bottom: 3,
                      ),
                      decoration: BoxDecoration(
                        color: ColorConstant.gray900,
                        borderRadius: BorderRadius.circular(
                          getHorizontalSize(
                            7.00,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: getHorizontalSize(
                  113.00,
                ),
                margin: getMargin(
                  top: 21,
                ),
                padding: getPadding(
                  left: 22,
                  top: 2,
                  right: 0,
                  bottom: 2,
                ),
                decoration: AppDecoration.txtOutlineBlack900.copyWith(
                  borderRadius: BorderRadiusStyle.txtCircleBorder22,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => Onboarding2Screen()));
                  },
                  child: Text(
                    "Next",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtInterBold30,
                  ),
                ),
              ),
              Container(
                width: getHorizontalSize(
                  113.00,
                ),
                margin: getMargin(
                  top: 5,
                ),
                padding: getPadding(
                  left: 24,
                  top: 1,
                  right: 24,
                  bottom: 1,
                ),
                decoration: AppDecoration.txtOutlineBlack9001.copyWith(
                  borderRadius: BorderRadiusStyle.txtCircleBorder22,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => LoginScreen()));
                  },
                  child: Text(
                    "Skip",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtInterBold30Gray900,
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
