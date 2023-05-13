import 'package:flutter/material.dart';
import 'package:taxi_final/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get txtOutlineGray900 => BoxDecoration(
        color: ColorConstant.gray900,
        border: Border.all(
          color: ColorConstant.gray900,
          width: getHorizontalSize(
            3.00,
          ),
        ),
      );
  static BoxDecoration get outlineBlack90033 => BoxDecoration(
        border: Border.all(
          color: ColorConstant.black90033,
          width: getHorizontalSize(
            2.00,
          ),
        ),
      );
  static BoxDecoration get outlineBlack90066 => BoxDecoration(
        color: ColorConstant.whiteA700D8,
        border: Border.all(
          color: ColorConstant.black90066,
          width: getHorizontalSize(
            1.00,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: ColorConstant.black90059,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              4,
              2.5,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack900331 => BoxDecoration(
        color: ColorConstant.whiteA700,
        border: Border.all(
          color: ColorConstant.black90033,
          width: getHorizontalSize(
            1.00,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: ColorConstant.black900B2,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              4,
              2.5,
            ),
          ),
        ],
      );
  static BoxDecoration get txtOutlineBlack900 => BoxDecoration(
        color: ColorConstant.gray900,
        border: Border.all(
          color: ColorConstant.black900,
          width: getHorizontalSize(
            1.00,
          ),
        ),
      );
  static BoxDecoration get fillPurple100d2 => BoxDecoration(
        color: ColorConstant.purple100D2,
      );
  static BoxDecoration get txtOutlineBlack9001 => BoxDecoration(
        border: Border.all(
          color: ColorConstant.black900,
          width: getHorizontalSize(
            1.00,
          ),
        ),
      );
  static BoxDecoration get outlineGray900 => BoxDecoration(
        border: Border.all(
          color: ColorConstant.gray900,
          width: getHorizontalSize(
            2.00,
          ),
        ),
      );
  static BoxDecoration get outlineBlack9001e => BoxDecoration(
        border: Border.all(
          color: ColorConstant.black9001e,
          width: getHorizontalSize(
            1.00,
          ),
        ),
      );
  static BoxDecoration get txtOutlineGray9001 => BoxDecoration(
        border: Border.all(
          color: ColorConstant.gray900,
          width: getHorizontalSize(
            2.00,
          ),
        ),
      );
  static BoxDecoration get outlineGray9001 => BoxDecoration(
        border: Border.all(
          color: ColorConstant.gray900,
          width: getHorizontalSize(
            2.00,
          ),
        ),
        gradient: LinearGradient(
          begin: Alignment(
            0.26,
            0,
          ),
          end: Alignment(
            0.65,
            1.07,
          ),
          colors: [
            ColorConstant.purple100,
            ColorConstant.purple10062,
            ColorConstant.purple10000,
          ],
        ),
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
}

class BorderRadiusStyle {
  static BorderRadius circleBorder22 = BorderRadius.circular(
    getHorizontalSize(
      22.00,
    ),
  );

  static BorderRadius roundedBorder15 = BorderRadius.circular(
    getHorizontalSize(
      15.00,
    ),
  );

  static BorderRadius roundedBorder12 = BorderRadius.circular(
    getHorizontalSize(
      12.00,
    ),
  );

  static BorderRadius customBorderTL12 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        12.00,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        12.00,
      ),
    ),
  );

  static BorderRadius txtRoundedBorder12 = BorderRadius.circular(
    getHorizontalSize(
      12.00,
    ),
  );

  static BorderRadius txtCircleBorder22 = BorderRadius.circular(
    getHorizontalSize(
      22.00,
    ),
  );

  static BorderRadius circleBorder27 = BorderRadius.circular(
    getHorizontalSize(
      27.00,
    ),
  );
}
