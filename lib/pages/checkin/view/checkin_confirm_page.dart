// ignore_for_file: unnecessary_lambdas, inference_failure_on_function_return_type, prefer_final_locals, omit_local_variable_types, prefer_const_constructors

import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:runking_app/consts/colors.dart';
import 'package:runking_app/globalController/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:runking_app/globalController/widgets/bottom_navigation_controller.dart';
import 'package:runking_app/pages/checkin/view/checkin_auth_page.dart';
import 'package:runking_app/pages/checkin/view/checkin_confirmdata_page.dart';
import 'package:runking_app/widgets/widgets.dart';

class CheckinConfirmPage extends StatefulWidget {
  const CheckinConfirmPage({super.key});

  @override
  State<CheckinConfirmPage> createState() => _CheckinConfirmPageState();
}

class _CheckinConfirmPageState extends State<CheckinConfirmPage> {
  bool isVisible = false, isLoading = false;
  final _controller = PageController();
  int _currentPage = 0;
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
              CustomHeader(
                onTap: () {},
              ),
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
                    height: 800,
                    child: PageView.builder(
                      controller: _controller,
                      onPageChanged: (value) => setState(
                        () => _currentPage = value,
                      ),
                      itemCount: contents.length,
                      itemBuilder: (context, i) {
                        return SizedBox(
                          width: double.maxFinite,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    top: 20, left: 40, right: 40),
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
                                color: secondColor,
                                height: 40,
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 5),
                                      child: Text(
                                        "SELEÇÃO DE ATLETAS",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      FontAwesomeIcons.peopleGroup,
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 20,
                                ),
                                child: Column(
                                  children: [
                                    if (contents[i].length > 0)
                                      for (var j = 0;
                                          j < contents[i]["kits"].length;
                                          j++)
                                        CheckBoxRow(
                                          code: contents[i]["kits"][j]["code"]
                                              .toString()
                                              .toUpperCase(),
                                          isSelected: contents[i]["kits"][j]
                                              ["isSelected"],
                                          name: contents[i]["kits"][j]["name"]
                                              .toString()
                                              .toUpperCase(),
                                          onTap: () {
                                            setState(() {
                                              contents[i]["kits"][j]
                                                      ["isSelected"] =
                                                  !contents[i]["kits"][j]
                                                      ["isSelected"];
                                            });
                                          },
                                        )
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(bottom: 30),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    contents.length,
                                    (int index) => _buildDots(index: index),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Container(
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
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(CheckinConfirmDataPage());
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
                              InkWell(
                                onTap: () {
                                  Get.to(CheckinAuthorizePage());
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 30),
                                  color: backgroundBlueColor,
                                  height: 40,
                                  alignment: Alignment.center,
                                  child: Container(
                                    margin: EdgeInsets.only(right: 5),
                                    child: Text(
                                      "AUTORIZAR RETIRADA POR TERCEIROS",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
