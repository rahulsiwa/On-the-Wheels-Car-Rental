import 'package:flutter/material.dart';
import 'package:taxi_final/core/app_export.dart';
import 'package:taxi_final/presentation/login_screen/login_screen.dart';

class Onboarding3Screen extends StatelessWidget {
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
            top: 40,
            bottom: 40,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Spacer(),
              Container(
                height: getVerticalSize(
                  279.00,
                ),
                width: size.width,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgBlueillustrati,
                      height: getVerticalSize(
                        279.00,
                      ),
                      width: getHorizontalSize(
                        390.00,
                      ),
                      alignment: Alignment.center,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: getPadding(
                          bottom: 7,
                        ),
                        child: Text(
                          "Enjoy your ride",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtLondrinaSolidRegular30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: getHorizontalSize(
                  315.00,
                ),
                margin: getMargin(
                  top: 25,
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
                  top: 26,
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
                        14.00,
                      ),
                      width: getHorizontalSize(
                        15.00,
                      ),
                      margin: getMargin(
                        left: 7,
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
                        left: 7,
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
                  top: 17,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: getPadding(
                          bottom: 2,
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
                          113.00,
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
                                    builder: (_) => LoginScreen()));
                          },
                          child: Text(
                            "Next",
                            overflow: TextOverflow.ellipsis,
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
