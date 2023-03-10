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

class CheckinAuthorizePage extends StatefulWidget {
  const CheckinAuthorizePage({super.key});

  @override
  State<CheckinAuthorizePage> createState() => _CheckinAuthorizePageState();
}

class _CheckinAuthorizePageState extends State<CheckinAuthorizePage> {
  bool isVisible = false, isLoading = false;
  TextEditingController nameUserThird = TextEditingController();

  final userData = Get.put<UserController>(UserController());
  final navigationIndex = Get.put<NavigationController>(NavigationController());

  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    navigationIndex.indexSelected.value = 1;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
      bottomNavigationBar: !isVisible ? BottomBarCustom() : null,
      extendBody: true,
      body: Stack(
        children: [
          Container(
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
                              margin:
                                  EdgeInsets.only(top: 20, left: 40, right: 40),
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
                              child: Container(
                                margin: EdgeInsets.only(right: 5),
                                child: Text(
                                  "AUTORIZAR RETIRADA",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(40, 50, 40, 20),
                              height: 40,
                              child: TextFormField(
                                textAlignVertical: TextAlignVertical.bottom,
                                cursorColor: Colors.black,
                                controller: nameUserThird,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  prefixIcon: Icon(
                                    Icons.search,
                                  ),
                                  prefixIconColor: Colors.black,
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      nameUserThird.value =
                                          TextEditingValue.empty;
                                    },
                                    child: Icon(
                                      Icons.close,
                                    ),
                                  ),
                                  suffixIconColor: Colors.black,
                                  hintText: "NOME TERCEIRO",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 20),
                              child: Column(
                                children: [
                                  Text(
                                    "JOÃO MARCOS FARIAS",
                                    style: GoogleFonts.sourceSansPro(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "24/01/1987",
                                        style: GoogleFonts.sourceSansPro(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "EQUIPE CHRONOMAX",
                                    style: GoogleFonts.sourceSansPro(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            CheckBoxRow(
                              name:
                                  "Ao clicar em autorizar você concorda que essa pessoa retire seu kit e todos os pertences adquiridos por você no momento da inscrição.",
                              isSelected: isSelected,
                              onTap: () {
                                setState(() {
                                  isSelected = !isSelected;
                                });
                              },
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    color: blueNeutralButtonColor,
                                    width: 100,
                                    height: 40,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "VOLTAR",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        isVisible = !isVisible;
                                      });
                                    },
                                    child: Container(
                                      color: secondColor,
                                      width: 120,
                                      height: 40,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "AUTORIZAR",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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
          if (isVisible)
            Container(
              color: Colors.black.withOpacity(
                0.8,
              ),
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                    color: headingBlueColor,
                    height: 60,
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.only(right: 5),
                      child: Text(
                        "ATENÇÃO!!!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 40),
                    child: Text(
                      "ESSA OPERAÇÃO É IRREVERSÍVEL,\nPORTANTO TENHA PLENA CONVICCÃO\nDE QUE SELECIONOU A PESSOA\nCORRETA PARA RETIRADA DE SEU KIT!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          child: Container(
                            color: dangerColor,
                            width: 120,
                            height: 40,
                            alignment: Alignment.center,
                            child: Text(
                              "CANCELAR",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          child: Container(
                            color: secondColor,
                            width: 120,
                            height: 40,
                            alignment: Alignment.center,
                            child: Text(
                              "CONFIRMAR",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                      ],
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

class CheckBoxRow extends StatelessWidget {
  const CheckBoxRow({
    super.key,
    required this.name,
    required this.isSelected,
    required this.onTap,
  });

  final String name;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Row(
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
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
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
