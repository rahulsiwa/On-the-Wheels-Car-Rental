import 'package:flutter/material.dart';
import 'package:taxi_final/core/app_export.dart';
import 'package:taxi_final/widgets/app_bar/appbar_image.dart';
import 'package:taxi_final/widgets/app_bar/custom_app_bar.dart';
import 'package:taxi_final/widgets/custom_icon_button.dart';

class MappageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: Container(
          height: getVerticalSize(
            810.00,
          ),
          width: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgImage2,
                height: getVerticalSize(
                  813.00,
                ),
                width: getHorizontalSize(
                  390.00,
                ),
                alignment: Alignment.center,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: size.width,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomAppBar(
                        height: getVerticalSize(
                          43.00,
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
                          ),
                        ),
                        title: Container(
                          padding: getPadding(
                            left: 24,
                            top: 8,
                            right: 24,
                            bottom: 8,
                          ),
                          decoration: AppDecoration.outlineBlack900331.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder22,
                          ),
                          child: Row(
                            children: [
                              AppbarImage(
                                height: getVerticalSize(
                                  22.00,
                                ),
                                width: getHorizontalSize(
                                  23.00,
                                ),
                                svgPath: ImageConstant.imgSearch,
                                margin: getMargin(
                                  left: 24,
                                  top: 9,
                                  bottom: 9,
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 12,
                                  top: 9,
                                  right: 95,
                                  bottom: 8,
                                ),
                                child: Text(
                                  "Search location",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterSemiBold18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            width: size.width,
                            margin: getMargin(
                              top: 24,
                              bottom: 83,
                            ),
                            padding: getPadding(
                              left: 12,
                              right: 12,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomIconButton(
                                  height: 45,
                                  width: 45,
                                  margin: getMargin(
                                    right: 14,
                                  ),
                                  child: CustomImageView(
                                    svgPath: ImageConstant.imgTrash,
                                  ),
                                ),
                                CustomIconButton(
                                  height: 45,
                                  width: 45,
                                  margin: getMargin(
                                    top: 13,
                                    right: 14,
                                  ),
                                  padding: IconButtonPadding.PaddingAll9,
                                  child: CustomImageView(
                                    svgPath: ImageConstant.imgCursor,
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: 419,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        padding: getPadding(
                                          left: 4,
                                          top: 17,
                                          right: 4,
                                          bottom: 17,
                                        ),
                                        decoration: AppDecoration
                                            .outlineBlack90066
                                            .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.circleBorder22,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: getPadding(
                                                left: 5,
                                              ),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: getPadding(
                                                      bottom: 5,
                                                    ),
                                                    child: Text(
                                                      "Dharan, East Zone",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtInterSemiBold172,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: getHorizontalSize(
                                                      107.00,
                                                    ),
                                                    margin: getMargin(
                                                      left: 8,
                                                    ),
                                                    child: Text(
                                                      "Mostly sunny · 25°C\n11:45 PM",
                                                      maxLines: null,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtInterSemiBold11,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: getPadding(
                                                left: 55,
                                                top: 26,
                                                bottom: 12,
                                              ),
                                              child: Row(
                                                children: [
                                                  CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgCheckmark,
                                                    height: getVerticalSize(
                                                      19.00,
                                                    ),
                                                    width: getHorizontalSize(
                                                      22.00,
                                                    ),
                                                    margin: getMargin(
                                                      bottom: 1,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: getPadding(
                                                      left: 6,
                                                      top: 1,
                                                    ),
                                                    child: Text(
                                                      "Select Location",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtInterSemiBold155,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: getMargin(
                                          left: 13,
                                          top: 10,
                                          bottom: 10,
                                        ),
                                        padding: getPadding(
                                          left: 3,
                                          top: 5,
                                          right: 3,
                                          bottom: 5,
                                        ),
                                        decoration: AppDecoration
                                            .outlineBlack90066
                                            .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder12,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            CustomImageView(
                                              svgPath: ImageConstant.imgPlus,
                                              height: getSize(
                                                40.00,
                                              ),
                                              width: getSize(
                                                40.00,
                                              ),
                                            ),
                                            CustomImageView(
                                              svgPath: ImageConstant.imgVector,
                                              height: getVerticalSize(
                                                3.00,
                                              ),
                                              width: getHorizontalSize(
                                                23.00,
                                              ),
                                              margin: getMargin(
                                                top: 36,
                                                bottom: 10,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
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
    );
  }
}
