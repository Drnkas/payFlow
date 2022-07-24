import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nlw_flutter_app/shared/themes/app_colors.dart';
import 'package:nlw_flutter_app/shared/themes/app_images.dart';
import 'package:nlw_flutter_app/shared/themes/app_text_styles.dart';
import 'package:nlw_flutter_app/shared/widgets/social_login/social_login_button.dart';
import '../../shared/widgets/social_login/social_login_button.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final controller = LoginController();

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.36,
              color: AppColors.primary,
            ),
            Positioned(
              top: 40,
              right: 0,
              left: 0,
                child: Image.asset(
                  AppImages.person,
                  width: 208,
                  height: 353,
                )
            ),
            Positioned(
                bottom: size.height * 0.16,
                left: 0,
                right: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.logomini),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 70, right: 70),
                      child: Text("Organize seus boletos em um lugar só",
                        textAlign: TextAlign.center,
                        style: TextStyles.titleHome,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
                      child: SocialLoginButton(
                        // login com o google
                        onTap: (){
                          controller.googleSignIn(context);
                        },
                      ),
                    )
                  ],
                ),
            )
          ],
        ),
      ),
    );
  }
}
