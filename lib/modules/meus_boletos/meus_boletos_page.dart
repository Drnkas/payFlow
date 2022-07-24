import 'package:animated_card/animated_card.dart';
import 'package:animated_card/animated_card_direction.dart';
import 'package:flutter/material.dart';
import 'package:nlw_flutter_app/shared/widgets/boleto_info/boleto_info_widget.dart';
import 'package:nlw_flutter_app/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:nlw_flutter_app/shared/widgets/boleto_list/boleto_list_widget.dart';

import '../../shared/themes/app_colors.dart';
import '../../shared/themes/app_text_styles.dart';

class MeusBoletosPage extends StatefulWidget {
  const MeusBoletosPage({Key? key}) : super(key: key);

  @override
  State<MeusBoletosPage> createState() => _MeusBoletosPageState();
}

class _MeusBoletosPageState extends State<MeusBoletosPage> {

  final controller = BoletoListController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 80,
            child: Stack(
              children: [
                Container(
                  height: 40,
                  color: AppColors.primary,
                ),
                AnimatedCard(
                  direction: AnimatedCardDirection.left,
                  child: BoletoInfoWidget(
                    key: UniqueKey(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 24
            ),
            child: Row(
              children: [
                Text("Meus boletos", style: TextStyles.titleBoldHeading),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Divider(
              color: AppColors.stroke,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: BoletoListWidget(
              key: UniqueKey(),
            ),
          )
        ],
      ),
    );
  }
}

