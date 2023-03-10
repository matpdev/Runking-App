import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:runking_app/consts/colors.dart';
import 'package:runking_app/db/user_db.dart';
import 'package:runking_app/globalController/user_controller.dart';
import 'package:runking_app/pages/account/register/register_page.dart';
import 'package:runking_app/pages/home/view/home_page.dart';
import 'package:runking_app/repository/auth_repository.dart';
import 'package:runking_app/utils/utils.dart';
import 'package:runking_app/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isVisible = true, isLoading = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final userData = Get.put<UserController>(UserController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/runImage1.jpg"),
            colorFilter: ColorFilter.mode(Colors.black, BlendMode.color),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.8),
          ),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 45),
            children: [
              CustomAppBar(
                isBack: false,
                onTap: () {
                  Get.back();
                },
              ),
              Container(
                height: 94,
                margin: const EdgeInsets.only(top: 80, bottom: 70),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/icons/runkingIcon.png"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            child: const Text(
                              "Email",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            child: TextFormField(
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                              controller: email,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "usuario@email.com",
                                hintStyle: const TextStyle(
                                  color: Colors.black,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 1),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 1),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 1),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          child: const Text(
                            "Senha",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            controller: password,
                            cursorColor: Colors.black,
                            obscureText: isVisible,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "**********",
                              hintStyle: const TextStyle(
                                color: Colors.black,
                              ),
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                  });
                                },
                                child: Icon(
                                  isVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 15,
                          bottom: 10,
                        ),
                        child: const Text(
                          "Esqueci minha senha",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      height: 45,
                      width: double.maxFinite,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: secondColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () async {
                          if (!isLoading) {
                            setState(() {
                              isLoading = true;
                            });
                            try {
                              Response response = await AuthRepo.loginUser(
                                email.text,
                                password.text,
                              );

                              if (response.data.containsKey("jwt")) {
                                userData.setUserData(response.data);
                                saveUserToken(response.data['jwt']);

                                await DB().setUserdata(
                                  email.text,
                                  password.text,
                                  false,
                                );

                                setState(() {
                                  isLoading = false;
                                });
                                Get.to(const HomePage());
                              }
                            } on DioError {
                              setState(() {
                                isLoading = false;
                              });
                              Get.snackbar("title", "message");
                            }
                          }
                        },
                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                "Entrar",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Get.off(const RegisterPage());
                },
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 45,
                    bottom: 10,
                  ),
                  child: const Text(
                    "Você não tem uma conta? Crie agora!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
