// ignore_for_file: unnecessary_lambdas, inference_failure_on_function_return_type, prefer_final_locals, omit_local_variable_types, prefer_const_constructors

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:runking_app/consts/colors.dart';
import 'package:runking_app/globalController/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:runking_app/globalController/widgets/bottom_navigation_controller.dart';
import 'package:runking_app/widgets/widgets.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  bool isVisible = false, isLoading = false;
  final _controller = PageController();
  final int _currentPage = 0;
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
    navigationIndex.indexSelected.value = 3;
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
                onTap: () {
                  // Get.back();
                },
              ),
              Container(
                color: secondColor,
                height: 40,
                alignment: Alignment.center,
                child: Text(
                  "ÚLTIMOS RESULTADOS",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: const [
                    Text(
                      "14/09/2023",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* 
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

 */