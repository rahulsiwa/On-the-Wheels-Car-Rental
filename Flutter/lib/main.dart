import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:taxi_final/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
        publicKey: "test_public_key_b2676907604b4b05819e414246e65386",
        builder: (context, navigatorKey) {
          return MaterialApp(
            localizationsDelegates: const [
              KhaltiLocalizations.delegate,
            ],
            theme: ThemeData(
              visualDensity: VisualDensity.standard,
            ),
            title: 'taxi_final',
            initialRoute: AppRoutes.loginScreen,
            routes: AppRoutes.routes,
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
