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
import 'package:runking_app/pages/checkin/view/checkin_confirm_page.dart';
import 'package:runking_app/widgets/widgets.dart';

class CheckinPage extends StatefulWidget {
  const CheckinPage({super.key});

  @override
  State<CheckinPage> createState() => _CheckinPageState();
}

class _CheckinPageState extends State<CheckinPage> {
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
                            "CHECK-IN DISPONÍVEL",
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
                    height: 300,
                    child: PageView.builder(
                      controller: _controller,
                      onPageChanged: (value) => setState(
                        () => _currentPage = value,
                      ),
                      itemCount: contents.length,
                      itemBuilder: (context, i) {
                        return SizedBox(
                          width: double.maxFinite,
                          child: InkWell(
                            onTap: () {
                              Get.to(CheckinConfirmPage());
                            },
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
                              ],
                            ),
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
              Column(
                children: [
                  Container(
                    color: backgroundBlueColor,
                    height: 40,
                    alignment: Alignment.center,
                    child: Text(
                      "PROXIMOS EVENTOS",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 300,
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
                                  top: 20,
                                  left: 40,
                                  right: 40,
                                ),
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
                                  "SP CITY MARATHON",
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
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
