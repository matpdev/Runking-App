// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_raw_strings, unnecessary_lambdas, deprecated_member_use

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:runking_app/consts/colors.dart';
import 'package:runking_app/globalController/user_controller.dart';
import 'package:runking_app/globalController/widgets/bottom_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:runking_app/pages/account/login/login_page.dart';
import 'package:runking_app/pages/checkin/view/checkin_page.dart';
import 'package:runking_app/pages/home/view/home_page.dart';
import 'package:runking_app/pages/results/results_page.dart';

class BottomBarCustom extends StatefulWidget {
  const BottomBarCustom({super.key});

  @override
  State<BottomBarCustom> createState() => _BottomBarCustomState();
}

class _BottomBarCustomState extends State<BottomBarCustom> {
  final navigationIndex = Get.put<NavigationController>(NavigationController());
  final userData = Get.put<UserController>(UserController());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: primaryColor,
          ),
          width: MediaQuery.of(context).size.width * 0.8,
          height: 70,
          margin: EdgeInsets.only(bottom: 20),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconBottomBar(
                  text: 'RASTREAR',
                  icon: FontAwesomeIcons.personRunning,
                  selected:
                      navigationIndex.indexSelected.value == 0 ? true : false,
                  onPressed: () {
                    if (navigationIndex.indexSelected.value != 0) {
                      setState(() {
                        navigationIndex.setIndex(0);
                        Get.to(() => HomePage());
                      });
                    }
                  },
                ),
                IconBottomBar(
                  text: 'CHECK-IN',
                  icon: navigationIndex.indexSelected.value == 1
                      ? FontAwesomeIcons.solidCircleCheck
                      : FontAwesomeIcons.circleCheck,
                  selected:
                      navigationIndex.indexSelected.value == 1 ? true : false,
                  onPressed: () {
                    if (userData.userdata.value.token != null) {
                      if (navigationIndex.indexSelected.value != 1) {
                        setState(() {
                          navigationIndex.setIndex(1);
                          Get.to(() => CheckinPage());
                        });
                      }
                    } else {
                      Get.to(() => LoginPage());
                    }
                  },
                ),
                IconBottomBar(
                  text: 'EVENTOS',
                  icon: FontAwesomeIcons.ticket,
                  selected:
                      navigationIndex.indexSelected.value == 3 ? true : false,
                  onPressed: () {
                    if (userData.userdata.value.token != null) {
                      if (navigationIndex.indexSelected.value != 3) {
                        setState(() {
                          navigationIndex.setIndex(3);
                          // Get.to(() => OrdersPage());
                        });
                      }
                    } else {
                      Get.to(() => LoginPage());
                    }
                  },
                ),
                IconBottomBar(
                  text: 'RESULTADOS',
                  icon: FontAwesomeIcons.trophy,
                  selected:
                      navigationIndex.indexSelected.value == 4 ? true : false,
                  onPressed: () {
                    if (userData.userdata.value.token != null) {
                      if (navigationIndex.indexSelected.value != 4) {
                        setState(() {
                          navigationIndex.setIndex(4);
                          Get.to(() => ResultPage());
                        });
                      }
                    } else {
                      Get.to(() => LoginPage());
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class IconBottomBar extends StatelessWidget {
  const IconBottomBar({
    super.key,
    required this.text,
    required this.icon,
    required this.selected,
    required this.onPressed,
  });
  final String text;
  final IconData icon;
  final bool selected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Icon(
              icon,
              size: 20,
              color: selected ? Colors.white : Colors.white.withOpacity(0.7),
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: selected ? Colors.white : Colors.white.withOpacity(0.7),
              fontWeight: selected ? FontWeight.w800 : FontWeight.w300,
            ),
          )
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.onTap,
    required this.isBack,
  });

  final VoidCallback onTap;
  final bool isBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          if (!isBack)
            InkWell(
              onTap: onTap,
              child: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 40,
              ),
            ),
          if (isBack)
            Container(
              height: 84,
              margin: const EdgeInsets.only(top: 80, bottom: 20),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/icons/runkingIcon.png"),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class CustomHeader extends StatefulWidget {
  const CustomHeader({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  State<CustomHeader> createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  final userData = Get.put<UserController>(UserController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 80,
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
            onTap: widget.onTap,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  width: 55,
                  height: 55,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: userData.userdata.value.image == null
                        ? DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              "assets/icons/runkingIcon.png",
                            ),
                          )
                        : null,
                  ),
                  child: userData.userdata.value.image != null
                      ? userData.userdata.value.image!
                      : null,
                ),
                SizedBox(
                  width: 70,
                  child: Text(
                    userData.userdata.value.name ?? "Nome do Usuário",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                    ),
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
        margin: EdgeInsets.symmetric(
          vertical: name.length > 50 ? 20 : 10,
          horizontal: 20,
        ),
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
                SizedBox(
                  width: code.isEmpty
                      ? MediaQuery.of(context).size.width * 0.8
                      : MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: name.length > 50 ? 14 : 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            if (code.isNotEmpty)
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
