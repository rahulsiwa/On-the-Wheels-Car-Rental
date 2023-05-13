import '../single_car_page_screen/widgets/listiconairconditioner_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:taxi_final/core/app_export.dart';
import 'package:taxi_final/widgets/app_bar/appbar_circleimage.dart';
import 'package:taxi_final/widgets/app_bar/custom_app_bar.dart';

class SingleCarPageScreen extends StatelessWidget {
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
          leadingWidth: 71,
          leading: AppbarCircleimage(
            imagePath: ImageConstant.imgEllipse10,
            margin: getMargin(
              left: 27,
              top: 6,
              bottom: 6,
            ),
          ),
          title: Padding(
            padding: getPadding(
              left: 13,
            ),
            child: Text(
              "Pramesh Katwal",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtInterRegular17,
            ),
          ),
        ),
        body: Container(
          width: size.width,
          padding: getPadding(
            left: 27,
            top: 7,
            right: 27,
            bottom: 7,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: getPadding(
                  left: 3,
                ),
                child: Text(
                  "Specs",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtInterSemiBold13,
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 2,
                  top: 5,
                ),
                child: Row(
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
              Padding(
                padding: getPadding(
                  left: 5,
                  top: 8,
                ),
                child: Text(
                  "Features",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtInterSemiBold13,
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 11,
                  top: 15,
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
                    return ListiconairconditionerItemWidget();
                  },
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 5,
                  top: 18,
                ),
                child: Text(
                  "Description",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtInterSemiBold13,
                ),
              ),
              Container(
                width: getHorizontalSize(
                  302.00,
                ),
                margin: getMargin(
                  left: 10,
                  top: 22,
                ),
                child: Text(
                  "With a breathtakingly beautiful and edgy design, the All New CRETA has been crafted to command respect. The bold exterior and the new masculine stance will set you apart from every other SUV on the road.",
                  maxLines: null,
                  textAlign: TextAlign.justify,
                  style: AppStyle.txtInterRegular13,
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 5,
                  top: 34,
                ),
                child: Text(
                  "More images",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtInterSemiBold13,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: getPadding(
                    left: 19,
                    top: 18,
                    right: 22,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgRectangle32,
                        height: getVerticalSize(
                          71.00,
                        ),
                        width: getHorizontalSize(
                          132.00,
                        ),
                        radius: BorderRadius.circular(
                          getHorizontalSize(
                            12.00,
                          ),
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgRectangle33,
                        height: getVerticalSize(
                          71.00,
                        ),
                        width: getHorizontalSize(
                          132.00,
                        ),
                        radius: BorderRadius.circular(
                          getHorizontalSize(
                            12.00,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: getPadding(
                    left: 22,
                    top: 24,
                    right: 22,
                    bottom: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgRectangle34,
                        height: getVerticalSize(
                          71.00,
                        ),
                        width: getHorizontalSize(
                          132.00,
                        ),
                        radius: BorderRadius.circular(
                          getHorizontalSize(
                            12.00,
                          ),
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgRectangle35,
                        height: getVerticalSize(
                          71.00,
                        ),
                        width: getHorizontalSize(
                          132.00,
                        ),
                        radius: BorderRadius.circular(
                          getHorizontalSize(
                            12.00,
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
        bottomNavigationBar: Container(
          width: size.width,
          padding: getPadding(
            left: 146,
            top: 16,
            right: 146,
            bottom: 16,
          ),
          decoration: AppDecoration.fillPurple100d2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: getPadding(
                  top: 2,
                ),
                child: Text(
                  "Book Now",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtInterSemiBold20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
