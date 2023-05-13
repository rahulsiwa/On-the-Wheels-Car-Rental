import 'package:flutter/material.dart';
import 'package:taxi_final/core/app_export.dart';
import 'package:taxi_final/presentation/bottomnavigationbaritems/items.dart';

class CaronlocationScreen extends StatefulWidget {
  @override
  State<CaronlocationScreen> createState() => _CaronlocationScreenState();
}

class _CaronlocationScreenState extends State<CaronlocationScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: items.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              setState(() {
                _selectedIndex = value;
              });
            },
            currentIndex: _selectedIndex,
            items: [
              BottomNavigationBarItem(
                  label: 'Home',
                  icon: SizedBox(
                    width: 25,
                    child: Image(
                      image: AssetImage(ImageConstant.imgHome1),
                    ),
                  )),
              BottomNavigationBarItem(
                  label: 'Upload',
                  icon: SizedBox(
                    width: 25,
                    child: Image(
                      image: AssetImage(ImageConstant.imgImage2022121),
                    ),
                  )),
              BottomNavigationBarItem(
                  label: 'Saved',
                  icon: SizedBox(
                    width: 25,
                    child: Image(
                      image: AssetImage(ImageConstant.imgLove1),
                    ),
                  )),
              BottomNavigationBarItem(
                  label: 'Profile',
                  icon: SizedBox(
                    width: 25,
                    child: Image(
                      image: AssetImage(ImageConstant.imgUser1),
                    ),
                  ))
            ]),
      ),
    );
  }
}
