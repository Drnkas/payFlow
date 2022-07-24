import 'package:flutter/material.dart';
import 'package:nlw_flutter_app/modules/barcode_scanner/barcode_scanner_controller.dart';
import 'package:nlw_flutter_app/shared/themes/app_colors.dart';
import 'package:nlw_flutter_app/shared/themes/app_text_styles.dart';
import 'package:nlw_flutter_app/shared/widgets/bottom_sheet/bottom_sheet_widget.dart';
import 'package:nlw_flutter_app/shared/widgets/set_label_buttons/set_label_buttons.dart';

import 'barcode_scanner_status.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({Key? key}) : super(key: key);

  @override
  State<BarcodeScannerPage> createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {

  final controller = BarcodeScannerController();

  @override
  void initState() {
    controller.getAvailableCameras();
    controller.statusNotifier.addListener(() {
      if (controller.status.hasBarcode) {
        Navigator.pushReplacementNamed(context, "/insert_boleto",
            arguments: controller.status.barcode);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Stack(
        children: [
          ValueListenableBuilder<BarcodeScannerStatus>(
              valueListenable: controller.statusNotifier,
              builder: (_,status,__) {
                if (status.showCamera) {
                  return Container(
                    child: controller.cameraController!.buildPreview(),
                  );
                } else {
                  return Container();
                }
              }
          ),
          RotatedBox(
            quarterTurns: 1,
            child: SafeArea(
              top: true,
              bottom: true,
              left: true,
              right: true,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.black,
                  title: Text(
                      "Escaneie o código de barras do boleto",
                    style: TextStyles.buttonBackground,
                  ),
                  centerTitle: true,
                  leading: BackButton(
                      color: AppColors.background
                  ),
                ),
                body: Column(
                  children: [
                    Expanded(
                        child: Container(
                          color: Colors.black.withOpacity(0.6),
                        )
                    ),
                    Expanded(
                      flex: 2,
                        child: Container(
                          color: Colors.transparent,
                        )
                    ),
                    Expanded(
                        child: Container(
                          color: Colors.black.withOpacity(0.6),
                        )
                    )
                  ],
                ),
                bottomNavigationBar: SetLabelButtons(
                  primaryLabel: "Inserir código do boleto",
                  primaryOnPressed: (){
                    Navigator.pushReplacementNamed(context, "/inser_boleto");
                  },
                  secondaryLabel: "Adicionar da galeria",
                  secondaryOnPressed: (){})
              ),
            ),
          ),
          ValueListenableBuilder<BarcodeScannerStatus>(
              valueListenable: controller.statusNotifier,
              builder: (_,status,__) {
                if (status.hasError) {
                  return BottomSheetWidget(
                    title: "Não foi possível indentifcar um código de barras.",
                    subtitle: "Tente escanear novamente ou digíte o código do seu boleto.",
                    primaryLabel: "Escanear novamente",
                    primaryOnPressed: () {
                      controller.scanWithCamera();
                    },
                    secondaryLabel: "Digitar código",
                    secondaryOnPressed: () {
                      Navigator.pushReplacementNamed(
                          context, "/inser_boleto",
                        arguments: controller.status.barcode
                      );
                    },
                  );
                } else {
                  return Container();
                }
              }
          ),
          /*return BottomSheetWidget(
            title: "Não foi possível indentifcar um código de barras.",
            subtitle: "Tente escanear novamente ou digíte o código do seu boleto.",
            primaryLabel: "Escanear novamente",
            primaryOnPressed: () {},
            secondaryLabel: "Digitar código",
            secondaryOnPressed: () {},
           );*/
        ],
      ),
    );
  }
}
