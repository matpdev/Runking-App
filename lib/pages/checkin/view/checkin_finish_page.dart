// ignore_for_file: unnecessary_lambdas, inference_failure_on_function_return_type, prefer_final_locals, omit_local_variable_types, prefer_const_constructors

import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:runking_app/consts/colors.dart';
import 'package:runking_app/globalController/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:runking_app/globalController/widgets/bottom_navigation_controller.dart';
import 'package:runking_app/pages/account/login/login_page.dart';
import 'package:runking_app/widgets/widgets.dart';

class CheckinFinishPage extends StatefulWidget {
  const CheckinFinishPage({super.key});

  @override
  State<CheckinFinishPage> createState() => _CheckinFinishPageState();
}

class _CheckinFinishPageState extends State<CheckinFinishPage> {
  bool isVisible = false, isLoading = false;
  final userData = Get.put<UserController>(UserController());
  final navigationIndex = Get.put<NavigationController>(NavigationController());

  @override
  void initState() {
    super.initState();
    navigationIndex.indexSelected.value = 1;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

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
                                  "CHECK-IN FINALIZADO",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.qr_code_2,
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 40,
                          ),
                          child: Text(
                            "CHECK-IN REALIZADO COM\nSUCESSO!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20, bottom: 50),
                          child: Text(
                            "PEGUE SEU COMPROVANTE E RETIRE\nSEU KIT NO GUICHÊ MAIS PROXIMO",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
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
}

class CheckBoxRow extends StatelessWidget {
  const CheckBoxRow({
    super.key,
    required this.name,
    required this.code,
    required this.isSelected,
    required this.onTap,
  });

  final String name;
  final String code;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 25,
                  height: 25,
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(
                      4,
                    ),
                  ),
                  child: isSelected
                      ? Icon(
                          Icons.check,
                          color: secondColor,
                        )
                      : null,
                ),
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              width: 45,
              height: 25,
              color: dangerColor,
              child: Text(
                code,
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w800,
                ),
              ),
            )
          ],
        ),
      ),
    );
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
