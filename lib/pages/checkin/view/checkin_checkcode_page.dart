// ignore_for_file: unnecessary_lambdas, inference_failure_on_function_return_type, prefer_final_locals, omit_local_variable_types, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'package:runking_app/consts/colors.dart';
import 'package:runking_app/globalController/user_controller.dart';
import 'package:runking_app/globalController/widgets/bottom_navigation_controller.dart';
import 'package:runking_app/pages/account/login/login_page.dart';
import 'package:runking_app/pages/checkin/view/checkin_finish_page.dart';
import 'package:runking_app/widgets/widgets.dart';

class CheckinCheckCodePage extends StatefulWidget {
  const CheckinCheckCodePage({super.key});

  @override
  State<CheckinCheckCodePage> createState() => _CheckinCheckCodePageState();
}

class _CheckinCheckCodePageState extends State<CheckinCheckCodePage> {
  bool isVisible = false, isLoading = false;
  final userData = Get.put<UserController>(UserController());
  final navigationIndex = Get.put<NavigationController>(NavigationController());

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  Barcode? result;
  QRViewController? controller;

  bool isStarted = true;

  @override
  void initState() {
    super.initState();
    navigationIndex.indexSelected.value = 1;
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    print(result?.code);

    return Scaffold(
      bottomNavigationBar: BottomBarCustom(),
      extendBody: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: const AssetImage("assets/images/runImage1.jpg"),
            colorFilter: ColorFilter.mode(
              Colors.black,
              BlendMode.color,
            ),
          ),
        ),
        child: Container(
          padding: EdgeInsets.only(bottom: 50),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.9),
          ),
          child: ListView(
            children: [
              CustomHeader(),
              Column(
                children: [
                  Container(
                    color: secondColor,
                    height: 40,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Text(
                            "CHECK-IN",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        Icon(FontAwesomeIcons.checkCircle)
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20, left: 40, right: 40),
                          width: double.maxFinite,
                          height: 180,
                          decoration: BoxDecoration(
                            color: backgroundBlueColor,
                            borderRadius: BorderRadius.circular(18),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: const AssetImage(
                                "assets/images/boxImage.png",
                              ),
                            ),
                          ),
                          padding: EdgeInsets.all(10),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Text(
                            "SP CITY MARATHON",
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(
                            "26/03/2023",
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          color: headingBlueColor,
                          height: 40,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 5),
                                child: Text(
                                  "LER QRCODE",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.qr_code_2,
                              )
                            ],
                          ),
                        ),
                        // if ()
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          width: 200,
                          height: 200,
                          child: QRView(
                            key: qrKey,
                            onQRViewCreated: _onQRViewCreated,
                          ),
                        ),
                        Container(
                          width: double.maxFinite,
                          margin: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 60),
                          color: Colors.white,
                          height: 2,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Text(
                            "* Caso detecte algum erro de cadastro, conclua o processo de retirada dos kits e dirija-se aos guichês de atendimento para correção",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
      controller.stopCamera();
      Get.to(CheckinFinishPage());
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 60,
          ),
          Container(
            width: 160,
            height: 100,
            margin: const EdgeInsets.only(top: 10, bottom: 20),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/icons/runkingIcon.png"),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(LoginPage());
            },
            child: Column(
              children: [
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        "assets/icons/runkingIcon.png",
                      ),
                    ),
                  ),
                ),
                Text(
                  "Name",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
