import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:taxi_final/core/Repository/auth_repository.dart';
// import 'package:taxi_final/core/Repository/kyc_repository.dart';
import 'package:taxi_final/core/app_export.dart';
import 'package:taxi_final/presentation/editprofile_screen/editprofile_screen.dart';
import 'package:taxi_final/presentation/login_screen/login_screen.dart';
import 'package:taxi_final/presentation/mybookings_screen/mybookings_screen.dart';
// import 'package:taxi_final/widgets/app_bar/appbar_circleimage.dart';
import 'package:taxi_final/widgets/app_bar/custom_app_bar.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var user;
  bool loading = true;
  @override
  void initState() {
    getUserData();
    super.initState();
  }

  getUserData() async {
    var res = await AuthRepository().getUserProfile();
    print(res);
    if (res != false) {
      setState(() {
        user = res;
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: CustomAppBar(
          height: getVerticalSize(
            96.00,
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50.0, top: 5),
                child: Text(
                  "Profile",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtInterSemiBold19,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50.0, top: 10),
                child: loading == true
                    ? Text('Loading....')
                    : Row(
                        children: [
                          user['image'] == null
                              ? CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "https://source.unsplash.com/random"),
                                )
                              : CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      ApiURL().imgUrl + user['image']),
                                ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              user['name'],
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterRegular19Gray600,
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
        body: Container(
          margin: getMargin(
            left: 28,
            top: 75,
            right: 28,
          ),
          decoration: AppDecoration.fillWhiteA700,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: getVerticalSize(
                    55.00,
                  ),
                  width: getHorizontalSize(
                    314.00,
                  ),
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () async {
                                await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => EditprofileScreen()));
                              },
                              child: Padding(
                                padding: getPadding(
                                  left: 65,
                                  right: 17,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Edit Profie",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInterRegular17Gray600,
                                    ),
                                    CustomImageView(
                                      svgPath: ImageConstant.imgArrowright,
                                      height: getVerticalSize(
                                        16.00,
                                      ),
                                      width: getHorizontalSize(
                                        8.00,
                                      ),
                                      margin: getMargin(
                                        top: 4,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            CustomImageView(
                              svgPath: ImageConstant.imgLine1,
                              height: getVerticalSize(
                                22.00,
                              ),
                              width: getHorizontalSize(
                                314.00,
                              ),
                              margin: getMargin(
                                top: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomImageView(
                        svgPath: ImageConstant.imgUser,
                        height: getVerticalSize(
                          34.00,
                        ),
                        width: getHorizontalSize(
                          28.00,
                        ),
                        alignment: Alignment.topLeft,
                        margin: getMargin(
                          left: 9,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => MybookingsScreen()));
                },
                child: Container(
                  height: getVerticalSize(
                    52.00,
                  ),
                  width: getHorizontalSize(
                    314.00,
                  ),
                  margin: getMargin(
                    top: 15,
                  ),
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: getPadding(
                                left: 68,
                                right: 7,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: getPadding(
                                      top: 1,
                                    ),
                                    child: Text(
                                      "My booking",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInterRegular17Gray600,
                                    ),
                                  ),
                                  CustomImageView(
                                    svgPath: ImageConstant.imgArrowright,
                                    height: getVerticalSize(
                                      16.00,
                                    ),
                                    width: getHorizontalSize(
                                      8.00,
                                    ),
                                    margin: getMargin(
                                      bottom: 6,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            CustomImageView(
                              svgPath: ImageConstant.imgLine1,
                              height: getVerticalSize(
                                22.00,
                              ),
                              width: getHorizontalSize(
                                314.00,
                              ),
                              margin: getMargin(
                                top: 4,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomImageView(
                        svgPath: ImageConstant.imgTicket,
                        height: getSize(
                          30.00,
                        ),
                        width: getSize(
                          30.00,
                        ),
                        alignment: Alignment.topLeft,
                        margin: getMargin(
                          left: 17,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: getVerticalSize(
                  55.00,
                ),
                width: getHorizontalSize(
                  314.00,
                ),
                margin: getMargin(
                  top: 12,
                ),
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: getPadding(
                              left: 65,
                              right: 7,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Notification",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterRegular17Gray600,
                                ),
                                CustomImageView(
                                  svgPath: ImageConstant.imgArrowright,
                                  height: getVerticalSize(
                                    16.00,
                                  ),
                                  width: getHorizontalSize(
                                    8.00,
                                  ),
                                  margin: getMargin(
                                    bottom: 4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CustomImageView(
                            svgPath: ImageConstant.imgLine1,
                            height: getVerticalSize(
                              22.00,
                            ),
                            width: getHorizontalSize(
                              314.00,
                            ),
                            margin: getMargin(
                              top: 4,
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomImageView(
                      svgPath: ImageConstant.imgNotification,
                      height: getVerticalSize(
                        32.00,
                      ),
                      width: getHorizontalSize(
                        28.00,
                      ),
                      alignment: Alignment.topLeft,
                      margin: getMargin(
                        left: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: getVerticalSize(
                  52.00,
                ),
                width: getHorizontalSize(
                  314.00,
                ),
                margin: getMargin(
                  top: 10,
                ),
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: getPadding(
                              left: 65,
                              right: 7,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "App Setting",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterRegular17Red800,
                                ),
                                CustomImageView(
                                  svgPath: ImageConstant.imgArrowright,
                                  height: getVerticalSize(
                                    16.00,
                                  ),
                                  width: getHorizontalSize(
                                    8.00,
                                  ),
                                  margin: getMargin(
                                    bottom: 5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CustomImageView(
                            svgPath: ImageConstant.imgLine1,
                            height: getVerticalSize(
                              22.00,
                            ),
                            width: getHorizontalSize(
                              314.00,
                            ),
                            margin: getMargin(
                              top: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomImageView(
                      svgPath: ImageConstant.imgSettingsGray600,
                      height: getSize(
                        32.00,
                      ),
                      width: getSize(
                        32.00,
                      ),
                      alignment: Alignment.topLeft,
                      margin: getMargin(
                        left: 15,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: getVerticalSize(
                  54.00,
                ),
                width: getHorizontalSize(
                  314.00,
                ),
                margin: getMargin(
                  top: 10,
                ),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: getPadding(
                          left: 20,
                          right: 2,
                          bottom: 21,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomImageView(
                              svgPath: ImageConstant.imgMenu,
                              height: getSize(
                                33.00,
                              ),
                              width: getSize(
                                33.00,
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                left: 11,
                                top: 8,
                                bottom: 3,
                              ),
                              child: Text(
                                "Terms & Condition",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtInterRegular17Gray600,
                              ),
                            ),
                            Spacer(),
                            CustomImageView(
                              svgPath: ImageConstant.imgArrowright,
                              height: getVerticalSize(
                                16.00,
                              ),
                              width: getHorizontalSize(
                                8.00,
                              ),
                              margin: getMargin(
                                top: 10,
                                bottom: 6,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    CustomImageView(
                      svgPath: ImageConstant.imgLine1,
                      height: getVerticalSize(
                        22.00,
                      ),
                      width: getHorizontalSize(
                        314.00,
                      ),
                      alignment: Alignment.bottomCenter,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: getVerticalSize(
                    57.00,
                  ),
                  width: getHorizontalSize(
                    316.00,
                  ),
                  margin: getMargin(
                    top: 7,
                  ),
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: getPadding(
                                left: 73,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Customer  care",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtInterRegular17Gray600,
                                  ),
                                  CustomImageView(
                                    svgPath: ImageConstant.imgArrowright,
                                    height: getVerticalSize(
                                      16.00,
                                    ),
                                    width: getHorizontalSize(
                                      8.00,
                                    ),
                                    margin: getMargin(
                                      bottom: 4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            CustomImageView(
                              svgPath: ImageConstant.imgLine1,
                              height: getVerticalSize(
                                22.00,
                              ),
                              width: getHorizontalSize(
                                314.00,
                              ),
                              margin: getMargin(
                                top: 4,
                                right: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomImageView(
                        svgPath: ImageConstant.imgMusicGray600,
                        height: getVerticalSize(
                          31.00,
                        ),
                        width: getHorizontalSize(
                          29.00,
                        ),
                        alignment: Alignment.topLeft,
                        margin: getMargin(
                          left: 27,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 22,
                  top: 6,
                  right: 17,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomImageView(
                      svgPath: ImageConstant.imgStar,
                      height: getSize(
                        38.00,
                      ),
                      width: getSize(
                        38.00,
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        left: 15,
                        top: 9,
                        bottom: 7,
                      ),
                      child: Text(
                        "Rate us",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtInterRegular17Gray600,
                      ),
                    ),
                    Spacer(),
                    CustomImageView(
                      svgPath: ImageConstant.imgArrowright,
                      height: getVerticalSize(
                        16.00,
                      ),
                      width: getHorizontalSize(
                        8.00,
                      ),
                      margin: getMargin(
                        top: 10,
                        bottom: 11,
                      ),
                    ),
                  ],
                ),
              ),
              CustomImageView(
                svgPath: ImageConstant.imgLine1,
                height: getVerticalSize(
                  22.00,
                ),
                width: getHorizontalSize(
                  314.00,
                ),
                alignment: Alignment.centerLeft,
                margin: getMargin(
                  left: 2,
                  top: 5,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: getPadding(
                    left: 33,
                    top: 5,
                    right: 17,
                  ),
                  child: InkWell(
                    onTap: () async {
                      var res = await AuthRepository().logout();
                      if (res == true) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => LoginScreen()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Cannot logout')));
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgClockGray600,
                          height: getSize(
                            20.00,
                          ),
                          width: getSize(
                            20.00,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 25,
                          ),
                          child: Text(
                            "Sign Out",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtInterRegular17Gray600,
                          ),
                        ),
                        Spacer(),
                        CustomImageView(
                          svgPath: ImageConstant.imgArrowright,
                          height: getVerticalSize(
                            16.00,
                          ),
                          width: getHorizontalSize(
                            8.00,
                          ),
                          margin: getMargin(
                            bottom: 4,
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
    );
  }
}
