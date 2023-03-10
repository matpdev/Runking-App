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
import 'package:runking_app/pages/checkin/view/checkin_checkcode_page.dart';
import 'package:runking_app/widgets/widgets.dart';

class CheckinConfirmDataPage extends StatefulWidget {
  const CheckinConfirmDataPage({super.key});

  @override
  State<CheckinConfirmDataPage> createState() => _CheckinConfirmDataPageState();
}

class _CheckinConfirmDataPageState extends State<CheckinConfirmDataPage> {
  bool isVisible = false, isLoading = false;
  final _controller = PageController();
  final int _currentPage = 0;
  List contents = [
    {
      "kits": [
        {
          "name": "MEU KIT",
          "isSelected": false,
          "code": "12KM",
        },
        {
          "name": "MEU KIT",
          "isSelected": false,
          "code": "12KM",
        },
        {
          "name": "MEU KIT",
          "isSelected": false,
          "code": "12KM",
        },
        {
          "name": "MEU KIT",
          "isSelected": false,
          "code": "12KM",
        },
      ]
    },
    {},
    {}
  ];
  final userData = Get.put<UserController>(UserController());
  final navigationIndex = Get.put<NavigationController>(NavigationController());

  AnimatedContainer _buildDots({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
        color: _currentPage == index
            ? const Color(0xFF69DAD8)
            : const Color(0xFFF7F7F7).withOpacity(0.4),
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: 10,
    );
  }

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
                                  "*CONFERÊNCIA DE DADOS",
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
                                FontAwesomeIcons.search,
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 100,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: backgroundBlueColor,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "NUM",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    Text(
                                      "1586",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w900,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: 240,
                                height: 60,
                                color: dangerColor,
                                alignment: Alignment.center,
                                child: Text(
                                  "MARATONA 42KM",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                            ],
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
                                  fontSize: 26,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 40),
                                    child: Text(
                                      "SEXO: M",
                                      style: GoogleFonts.sourceSansPro(
                                        color: Colors.white,
                                        fontSize: 26,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "24/01/1987",
                                    style: GoogleFonts.sourceSansPro(
                                      color: Colors.white,
                                      fontSize: 26,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "EQUIPE CHRONOMAX",
                                style: GoogleFonts.sourceSansPro(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  Get.to(CheckinCheckCodePage());
                                },
                                child: Container(
                                  color: secondColor,
                                  width: 100,
                                  height: 40,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "AVANÇAR",
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
