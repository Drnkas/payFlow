import 'package:flutter/material.dart';
import 'package:nlw_flutter_app/shared/themes/app_colors.dart';
import 'package:nlw_flutter_app/shared/themes/app_images.dart';
import '../../../modules/insert_boleto/boleto_model.dart';
import '../../themes/app_text_styles.dart';
import '../boleto_list/boleto_list_controller.dart';

class BoletoInfoWidget extends StatefulWidget {
  BoletoInfoWidget({Key? key}) : super(key: key);

  @override
  _BoletoInfoWidgetState createState() => _BoletoInfoWidgetState();
}

class _BoletoInfoWidgetState extends State<BoletoInfoWidget> {
  final controller = BoletoListController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.secondary, borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                AppImages.logomini,
                width: 56,
                height: 34,
                color: AppColors.background,
              ),
              Container(
                width: 1,
                height: 32,
                color: AppColors.background,
              ),
              ValueListenableBuilder<List<BoletoModel>>(
                  valueListenable: controller.boletosNotifier,
                  builder: (_, boletos, __) => Text.rich(TextSpan(
                    text: "Você tem ",
                    style: TextStyles.captionBackground,
                    children: [
                      TextSpan(
                        text: "${boletos.length} boletos\n",
                        style: TextStyles.captionBoldBackground,
                      ),
                      TextSpan(
                        text: "cadastrados para pagar",
                        style: TextStyles.captionBackground,
                      ),
                    ],
                  )
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
