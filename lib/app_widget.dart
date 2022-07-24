import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nlw_flutter_app/modules/home/home_page.dart';
import 'package:nlw_flutter_app/modules/insert_boleto/insert_boleto_page.dart';
import 'package:nlw_flutter_app/modules/splash/splash_page.dart';
import 'package:nlw_flutter_app/shared/themes/app_colors.dart';
import 'modules/barcode_scanner/barcode_scanner_page.dart';
import 'modules/login/login_page.dart';

class AppWidget extends StatelessWidget {
  //mantém o layout em pé, evitando quebra
  AppWidget () {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pay Flow',
      theme: ThemeData(
          primarySwatch: Colors.orange, primaryColor: AppColors.primary),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashPage(),
        "/home": (context) => HomePage(
          user: ModalRoute.of(context)!.settings.arguments as UserModel,
        ),
        "/login": (context) => LoginPage(),
        "/barcode_scanner": (context) => BarcodeScannerPage(),
        "/insert_boleto": (context) => InsertBoletoPage(
            barcode: ModalRoute.of(context) != null
                ? ModalRoute.of(context)!.settings.arguments.toString()
                : null)
      },
    );
  }
}