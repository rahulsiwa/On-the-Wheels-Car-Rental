import 'package:flutter/material.dart';
import 'package:taxi_final/presentation/onboarding2_screen/onboarding2_screen.dart';
import 'package:taxi_final/presentation/spalshscreen_screen/spalshscreen_screen.dart';
import 'package:taxi_final/presentation/onboarding1_screen/onboarding1_screen.dart';
import 'package:taxi_final/presentation/onboarding3_screen/onboarding3_screen.dart';
import 'package:taxi_final/presentation/register_screen/register_screen.dart';
import 'package:taxi_final/presentation/login_screen/login_screen.dart';
import 'package:taxi_final/presentation/otp_screen/otp_screen.dart';
import 'package:taxi_final/presentation/bookinformation_screen/bookinformation_screen.dart';
import 'package:taxi_final/presentation/single_car_page_screen/single_car_page_screen.dart';
import 'package:taxi_final/presentation/caronlocation_screen/caronlocation_screen.dart';
import 'package:taxi_final/presentation/singlecarpage_screen/singlecarpage_screen.dart';
import 'package:taxi_final/presentation/mappage_screen/mappage_screen.dart';
import 'package:taxi_final/presentation/profile_screen/profile_screen.dart';
import 'package:taxi_final/presentation/docupload_screen/docupload_screen.dart';
import 'package:taxi_final/presentation/booksummary_screen/booksummary_screen.dart';
import 'package:taxi_final/presentation/book_successfully_screen/book_successfully_screen.dart';
import 'package:taxi_final/presentation/favourite_screen/favourite_screen.dart';
import 'package:taxi_final/presentation/editprofile_screen/editprofile_screen.dart';
import 'package:taxi_final/presentation/mybookings_screen/mybookings_screen.dart';
import 'package:taxi_final/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String onboarding2Screen = '/onboarding2_screen';

  static const String spalshscreenScreen = '/spalshscreen_screen';

  static const String onboarding1Screen = '/onboarding1_screen';

  static const String onboarding3Screen = '/onboarding3_screen';

  static const String registerScreen = '/register_screen';

  static const String loginScreen = '/login_screen';

  static const String otpScreen = '/otp_screen';

  static const String bookinformationScreen = '/bookinformation_screen';

  static const String singleCarPageScreen = '/single_car_page_screen';

  static const String caronlocationScreen = '/caronlocation_screen';

  static const String singlecarpageScreen = '/singlecarpage_screen';

  static const String mappageScreen = '/mappage_screen';

  static const String profileScreen = '/profile_screen';

  static const String docuploadScreen = '/docupload_screen';

  static const String booksummaryScreen = '/booksummary_screen';

  static const String bookSuccessfullyScreen = '/book_successfully_screen';

  static const String favouriteScreen = '/favourite_screen';

  //static const String editprofileScreen = '/editprofile_screen';

  static const String mybookingsScreen = '/mybookings_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    onboarding2Screen: (context) => Onboarding2Screen(),
    spalshscreenScreen: (context) => SpalshscreenScreen(),
    onboarding1Screen: (context) => Onboarding1Screen(),
    onboarding3Screen: (context) => Onboarding3Screen(),
    registerScreen: (context) => RegisterScreen(),
    loginScreen: (context) => LoginScreen(),
    otpScreen: (context) => OtpScreen(),
    // bookinformationScreen: (context) => Bookinginformation(),
    singleCarPageScreen: (context) => SingleCarPageScreen(),
    caronlocationScreen: (context) => CaronlocationScreen(),
    singlecarpageScreen: (context) => SinglecarpageScreen(),
    mappageScreen: (context) => MappageScreen(),
    profileScreen: (context) => ProfileScreen(),
    docuploadScreen: (context) => DocuploadScreen(),
    booksummaryScreen: (context) => BooksummaryScreen(),
    bookSuccessfullyScreen: (context) => BookSuccessfullyScreen(),
    favouriteScreen: (context) => FavouriteScreen(),
    // editprofileScreen: (context) => EditprofileScreen(),
    mybookingsScreen: (context) => MybookingsScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
