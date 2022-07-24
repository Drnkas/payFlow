import 'package:flutter/material.dart';
import 'package:nlw_flutter_app/modules/extract/extract_page.dart';
import 'package:nlw_flutter_app/modules/meus_boletos/meus_boletos_page.dart';
import 'package:nlw_flutter_app/shared/themes/app_colors.dart';
import 'package:nlw_flutter_app/shared/themes/app_text_styles.dart';
import '../../shared/models/user_model.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final UserModel user;
  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(152),
          child: Container(
            height: 152,
            color: AppColors.primary,
            child: Center(
              child: ListTile(
                //estilo de texto negrito e normal
                title: Text.rich(
                    TextSpan(
                        text: "Olá, ",
                        style: TextStyles.titleRegular,
                    children: [
                      TextSpan(
                          text: "${widget.user.name}!", style: TextStyles.titleBoldBackground)
                    ]),
                ),
                subtitle: Text("Mantenha suas contas em dias",
                    style: TextStyles.captionShape,
                ),
                trailing: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(image: NetworkImage(widget.user.photoURL!))
                  ),
                ),
              ),
            ),
          ),
        ),
        body: [MeusBoletosPage(
          key: UniqueKey(),
        ),ExtractPage(
          key: UniqueKey(),
        )
        ][controller.currentPage],
        bottomNavigationBar: Container (
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      controller.setPage(0);
                      setState(() {});
                    },
                  icon: Icon(
                      Icons.home,
                    color: controller.currentPage == 0 ? AppColors.primary : AppColors.body,
                  )
              ),
              GestureDetector(
                onTap: () async {
                  await Navigator.pushNamed(context, "/barcode_scanner");
                  setState (() {});
                },
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(
                    Icons.add_box_outlined,
                    color: AppColors.background,
                  ),
                ),
              ),
                IconButton(
                    onPressed: () {
                      controller.setPage(1);
                      setState(() {});
                    },
                  icon: Icon(
                      Icons.description_outlined,
                    color: controller.currentPage == 1 ? AppColors.primary : AppColors.body,
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
