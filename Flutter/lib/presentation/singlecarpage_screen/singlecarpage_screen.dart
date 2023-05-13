import '../singlecarpage_screen/widgets/listiconairconditioner1_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:taxi_final/core/app_export.dart';
import 'package:taxi_final/widgets/app_bar/appbar_image.dart';
import 'package:taxi_final/widgets/app_bar/custom_app_bar.dart';

class SinglecarpageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
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
          actions: [
            AppbarImage(
              height: getSize(
                25.00,
              ),
              width: getSize(
                25.00,
              ),
              imagePath: ImageConstant.imgLove1,
              margin: getMargin(
                left: 28,
                top: 7,
                right: 28,
                bottom: 23,
              ),
            ),
          ],
        ),
        body: Container(
          width: size.width,
          padding: getPadding(
            top: 5,
            bottom: 5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgCretaredremovebg,
                height: getVerticalSize(
                  205.00,
                ),
                width: getHorizontalSize(
                  385.00,
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 35,
                  top: 27,
                ),
                child: Text(
                  "Hyundai  Creta SX",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtInterSemiBold17,
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 36,
                  top: 1,
                ),
                child: RatingBar.builder(
                  initialRating: 4,
                  minRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemSize: getVerticalSize(
                    16.00,
                  ),
                  unratedColor: ColorConstant.amber70001,
                  itemCount: 5,
                  updateOnDrag: true,
                  onRatingUpdate: (rating) {},
                  itemBuilder: (context, _) {
                    return Icon(
                      Icons.star,
                      color: ColorConstant.amber700,
                    );
                  },
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 35,
                  top: 15,
                ),
                child: Text(
                  "Renter",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtInterSemiBold15,
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 33,
                  top: 6,
                ),
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgEllipse10,
                      height: getSize(
                        44.00,
                      ),
                      width: getSize(
                        44.00,
                      ),
                      radius: BorderRadius.circular(
                        getHorizontalSize(
                          22.00,
                        ),
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        left: 13,
                        top: 14,
                        bottom: 8,
                      ),
                      child: Text(
                        "Pramesh Katwal",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtInterRegular17,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 36,
                  top: 13,
                ),
                child: Text(
                  "Specs",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtInterSemiBold13,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: getPadding(
                    top: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: getMargin(
                          bottom: 1,
                        ),
                        padding: getPadding(
                          left: 15,
                          top: 13,
                          right: 15,
                          bottom: 13,
                        ),
                        decoration: AppDecoration.outlineBlack9001e.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder12,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Max Power",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterRegular13,
                            ),
                            Padding(
                              padding: getPadding(
                                top: 4,
                              ),
                              child: Text(
                                "113 BHP",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtInterRegular15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: getMargin(
                          left: 10,
                          top: 1,
                        ),
                        padding: getPadding(
                          left: 16,
                          top: 13,
                          right: 16,
                          bottom: 13,
                        ),
                        decoration: AppDecoration.outlineBlack9001e.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder12,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Top Speed",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterRegular13,
                            ),
                            Padding(
                              padding: getPadding(
                                top: 4,
                              ),
                              child: Text(
                                "195 Km/h",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtInterRegular15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: getMargin(
                          left: 10,
                          bottom: 1,
                        ),
                        padding: getPadding(
                          left: 22,
                          top: 13,
                          right: 22,
                          bottom: 13,
                        ),
                        decoration: AppDecoration.outlineBlack9001e.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder12,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: getPadding(
                                right: 8,
                              ),
                              child: Text(
                                "Motor",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtInterRegular13,
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                top: 4,
                              ),
                              child: Text(
                                "1500 cc",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtInterRegular15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 33,
                  top: 3,
                ),
                child: Text(
                  "Features",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtInterSemiBold13,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: getPadding(
                    left: 39,
                    top: 15,
                    right: 26,
                  ),
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: getVerticalSize(
                          9.00,
                        ),
                      );
                    },
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Listiconairconditioner1ItemWidget();
                    },
                  ),
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 38,
                  top: 23,
                  bottom: 5,
                ),
                child: Text(
                  "Description",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtInterSemiBold13,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          width: size.width,
          padding: getPadding(
            left: 146,
            top: 17,
            right: 146,
            bottom: 17,
          ),
          decoration: AppDecoration.fillPurple100d2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Book Now",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtInterSemiBold20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
