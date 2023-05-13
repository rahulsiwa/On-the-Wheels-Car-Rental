import 'package:flutter/material.dart';
import 'package:taxi_final/core/app_export.dart';

// ignore: must_be_immutable
class ListiconairconditionerItemWidget extends StatelessWidget {
  ListiconairconditionerItemWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImageView(
          svgPath: ImageConstant.imgIconairconditioner,
          height: getSize(
            22.00,
          ),
          width: getSize(
            22.00,
          ),
          margin: getMargin(
            top: 2,
            bottom: 1,
          ),
        ),
        Padding(
          padding: getPadding(
            left: 5,
            bottom: 8,
          ),
          child: Text(
            "Air Conditioner",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtInterRegular13,
          ),
        ),
        Spacer(),
        CustomImageView(
          svgPath: ImageConstant.imgMusic,
          height: getSize(
            25.00,
          ),
          width: getSize(
            25.00,
          ),
        ),
        Padding(
          padding: getPadding(
            left: 5,
            bottom: 8,
          ),
          child: Text(
            "Music",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtInterRegular13,
          ),
        ),
      ],
    );
  }
}
