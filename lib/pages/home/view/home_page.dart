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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isVisible = false, isLoading = false;
  final _controller = PageController();
  int _currentPage = 0;
  List contents = [{}, {}, {}];
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
    navigationIndex.indexSelected.value = 0;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
      bottomNavigationBar: BottomBarCustom(),
      extendBody: true,
      body: userData.userdata.value.email == null
          ? Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: const AssetImage("assets/images/runImage2.jpg"),
                  colorFilter: ColorFilter.mode(
                    Colors.black,
                    BlendMode.color,
                  ),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.8),
                ),
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 45),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(LoginPage());
                          },
                          child: Column(
                            children: const [
                              Text(
                                "LOGIN",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              FaIcon(
                                FontAwesomeIcons.arrowRightToBracket,
                                color: Colors.white,
                                size: 40,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 84,
                      margin: const EdgeInsets.only(top: 80, bottom: 20),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/icons/runkingIcon.png"),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Text(
                        "Encontre sua corrida",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    TextFormField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        hintText: "Maratona...",
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          : Container(
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
                    Container(
                      color: secondColor,
                      height: 40,
                      alignment: Alignment.center,
                      child: Text(
                        "RECORDES PESSOAIS",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                            width: double.maxFinite,
                            margin: EdgeInsets.symmetric(vertical: 50),
                            child: Column(
                              children: [
                                Text(
                                  "MELHOR DESEMPENHO",
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  color: backgroundBlueColor,
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "72,32%",
                                        style: GoogleFonts.montserrat(
                                          color: Color(0xFF020202),
                                          fontSize: 70,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      Text(
                                        "AGE GRADINGS",
                                        style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 20,
                                    bottom: 50,
                                  ),
                                  child: Text(
                                    "MARATONA DE TÓKYO 2019",
                                    style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 280,
                                  height: 1,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            margin: EdgeInsets.only(right: 20),
                            alignment: Alignment.center,
                            width: 50,
                            height: 30,
                            color: dangerColor,
                            child: Text(
                              "42KM",
                              style: GoogleFonts.montserrat(
                                fontSize: 13,
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "MELHOR TEMPOS",
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 203,
                          child: PageView.builder(
                            controller: _controller,
                            onPageChanged: (value) => setState(
                              () => _currentPage = value,
                            ),
                            itemCount: contents.length,
                            itemBuilder: (context, i) {
                              return SizedBox(
                                width: double.maxFinite,
                                child: Stack(
                                  alignment: Alignment.centerRight,
                                  children: [
                                    SizedBox(
                                      width: double.maxFinite,
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(top: 40),
                                            color: headingBlueColor,
                                            padding: EdgeInsets.all(10),
                                            child: Text(
                                              "00:00:00.000",
                                              style: GoogleFonts.montserrat(
                                                color: Color(0xFF020202),
                                                fontSize: 45,
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              top: 20,
                                              bottom: 50,
                                            ),
                                            child: Text(
                                              "ATHENAS RUN FASTER 2022",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.italic,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 5,
                                      ),
                                      margin: EdgeInsets.only(
                                        right: 20,
                                        bottom: 140,
                                      ),
                                      alignment: Alignment.center,
                                      width: 60,
                                      height: 40,
                                      color: dangerColor,
                                      child: Text(
                                        "42KM",
                                        style: GoogleFonts.montserrat(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
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
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
