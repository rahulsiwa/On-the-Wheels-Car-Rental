import 'package:flutter/material.dart';
import 'package:taxi_final/core/app_export.dart';
import 'package:taxi_final/presentation/login_screen/login_screen.dart';
import 'package:taxi_final/presentation/onboarding1_screen/onboarding1_screen.dart';
import 'package:taxi_final/presentation/onboarding3_screen/onboarding3_screen.dart';

class Onboarding2Screen extends StatelessWidget {
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
            left: 31,
            top: 40,
            right: 31,
            bottom: 40,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Spacer(),
              CustomImageView(
                imagePath: ImageConstant.imgImage2022121,
                height: getVerticalSize(
                  279.00,
                ),
                width: getHorizontalSize(
                  305.00,
                ),
                alignment: Alignment.centerLeft,
                margin: getMargin(
                  left: 4,
                ),
              ),
              Container(
                width: getHorizontalSize(
                  210.00,
                ),
                margin: getMargin(
                  top: 1,
                ),
                child: Text(
                  "Select your dream car",
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
                  top: 20,
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
                  top: 21,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: getVerticalSize(
                        14.00,
                      ),
                      width: getHorizontalSize(
                        15.00,
                      ),
                      margin: getMargin(
                        top: 3,
                        bottom: 2,
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
                        19.00,
                      ),
                      width: getHorizontalSize(
                        21.00,
                      ),
                      margin: getMargin(
                        left: 5,
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
                        left: 4,
                        top: 3,
                        bottom: 2,
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
                height: getVerticalSize(
                  44.00,
                ),
                width: getHorizontalSize(
                  113.00,
                ),
                margin: getMargin(
                  top: 19,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: getPadding(
                          top: 1,
                        ),
                        child: Text(
                          "Next",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInterBold30,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: getHorizontalSize(
                          150.00,
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => Onboarding3Screen()));
                          },
                          child: Text(
                            "Next",
                            textAlign: TextAlign.left,
                            style: AppStyle.txtInterBold30,
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
