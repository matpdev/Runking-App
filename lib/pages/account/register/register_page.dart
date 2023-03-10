import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';

import 'package:intl/intl.dart';
import 'package:mask/mask.dart';

import 'package:runking_app/consts/colors.dart';
import 'package:runking_app/pages/account/login/login_page.dart';
import 'package:runking_app/widgets/widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isVisible = true, isLoading = false, isLoadingImage = false;
  TextEditingController name = TextEditingController();
  String gender = "null";
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController cpf = TextEditingController();
  TextEditingController rg = TextEditingController();
  TextEditingController birthDate = TextEditingController();
  String image = "";
  DateTime selectedDate = DateTime.now();

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
                              "Nome",
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
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Luis A...",
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
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: const Text(
                              'CPF',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            child: TextFormField(
                              controller: cpf,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: '###.###.###-##',
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Colors.black,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              inputFormatters: [
                                Mask.generic(
                                  masks: ['###.###.###-##'],
                                  hashtag: Hashtag.numbers, // optional field
                                ),
                              ],
                              keyboardType: TextInputType.number,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: const Text(
                              'RG',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            child: TextFormField(
                              controller: rg,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: '###.###.###',
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Colors.black,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              inputFormatters: [
                                Mask.generic(
                                  masks: ['###.###.###'],
                                  hashtag: Hashtag.numbers, // optional field
                                ),
                              ],
                              keyboardType: TextInputType.number,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: const Text(
                              'Gênero',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                14,
                              ),
                            ),
                            child: DropdownButton(
                              underline: Container(),
                              value: gender,
                              isExpanded: true,
                              items: const [
                                DropdownMenuItem(
                                  value: "null",
                                  child: Text("Selecione uma Gênero"),
                                ),
                                DropdownMenuItem(
                                  value: "F",
                                  child: Text("Feminino"),
                                ),
                                DropdownMenuItem(
                                  value: "M",
                                  child: Text("Masculino"),
                                ),
                              ],
                              onChanged: (v) {
                                setState(() {
                                  gender = v!;
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
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
                              cursorColor: Colors.black,
                              controller: email,
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
                    Container(
                      margin: const EdgeInsets.only(bottom: 20, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            child: const Text(
                              "Telefone",
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
                              cursorColor: Colors.black,
                              controller: phone,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "(99) 99999-9999",
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
                              inputFormatters: [
                                Mask.generic(
                                  masks: ['(##) #####-####'],
                                  hashtag: Hashtag.numbers, // optional field
                                ),
                              ],
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: const Text(
                              'Data de Nascimento',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 56,
                            child: TextFormField(
                              cursorColor: Colors.grey[800],
                              controller: birthDate,
                              onChanged: (value) {
                                if (value.length == 10) {
                                  setState(
                                    () {
                                      selectedDate = DateTime.parse(
                                        value.replaceAllMapped(
                                          RegExp(r"(\d{2})\/(\d{2})\/(\d{4})"),
                                          (match) {
                                            return "${int.parse(match[3].toString()) > 2043 ? 2043 : int.parse(match[3].toString()) < 1950 ? 1950 : match[3]}-${match[2]}-${match[1]}";
                                          },
                                        ),
                                      );
                                      birthDate.value = TextEditingValue(
                                        text: DateFormat.yMd("pt_BR").format(
                                          DateTime.parse(
                                            value.replaceAllMapped(
                                              RegExp(
                                                  r"(\d{2})\/(\d{2})\/(\d{4})"),
                                              (match) {
                                                return "${int.parse(match[3].toString()) > 2043 ? 2043 : int.parse(match[3].toString()) < 1950 ? 1950 : match[3]}-${match[2]}-${match[1]}";
                                              },
                                            ),
                                          ),
                                        ),
                                        selection: TextSelection.fromPosition(
                                          TextPosition(offset: value.length),
                                        ),
                                      );
                                    },
                                  );
                                }
                              },
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'DD/MM/AAAA',
                                suffixIcon: InkWell(
                                  onTap: () async {
                                    var date = await showDatePicker(
                                      context: context,
                                      initialDate: selectedDate,
                                      firstDate: DateTime(1950),
                                      lastDate: DateTime(2024),
                                    );

                                    if (date != null) {
                                      setState(() {
                                        birthDate.text = DateFormat.yMd("pt_BR")
                                            .format(date);
                                      });
                                    }
                                  },
                                  child: const Icon(
                                    Icons.date_range,
                                  ),
                                ),
                                suffixIconColor: Colors.black,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Colors.black,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              inputFormatters: [
                                Mask.generic(
                                  masks: ['##/##/####'],
                                  hashtag: Hashtag.numbers, // optional field
                                ),
                              ],
                              keyboardType: TextInputType.number,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      height: 45,
                      width: double.maxFinite,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: backgroundBlueColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles(
                            type: FileType.image,
                          );

                          if (result == null) {
                            setState(() {
                              isLoading = false;
                            });
                            return;
                          }

                          File file = File(result.files[0].path!);
                          List<int> imageBytes = file.readAsBytesSync();
                          image =
                              "data:image/${result.files[0].extension};base64,${base64Encode(imageBytes)}";

                          setState(() {
                            isLoading = false;
                          });
                          return;
                        },
                        child: Text(
                          image.isNotEmpty
                              ? "Editar Icone do Pefil"
                              : "Enviar Icone do Perfil",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
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
                            // await AuthRepo.signUser();
                          }
                        },
                        child: const Text(
                          "Criar",
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
                  Get.off(const LoginPage());
                },
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 45,
                    bottom: 10,
                  ),
                  child: const Text(
                    "Já tem uma conta? Entre agora!",
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
