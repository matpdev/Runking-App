import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

import 'package:intl/intl.dart';
import 'package:mask/mask.dart';

import 'package:runking_app/consts/colors.dart';
import 'package:runking_app/db/user_db.dart';
import 'package:runking_app/globalController/user_controller.dart';
import 'package:runking_app/pages/account/login/login_page.dart';
import 'package:runking_app/pages/home/view/home_page.dart';
import 'package:runking_app/repository/auth_repository.dart';
import 'package:runking_app/utils/utils.dart';
import 'package:runking_app/widgets/widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isVisible = true, isLoading = false, isLoadingImage = false;
  TextEditingController name = TextEditingController();
  String gender = "";
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController cpf = TextEditingController();
  TextEditingController rg = TextEditingController();
  TextEditingController birthDate = TextEditingController();
  String image = "";
  DateTime selectedDate = DateTime.now();

  final userData = Get.put<UserController>(UserController());

  String errorPassword = '';
  String errorPasswordConfirm = '';
  late FocusNode focusNode;

  bool hasSpecialMatch = false,
      hasNumberMatch = false,
      isVisibleConfirm = true,
      termsData = false,
      receiveEmail = false,
      hasUpperMatch = false,
      focus = false,
      isEmailValid = false,
      hasMoreThen8Match = false;

  double progress = 0;

  void verifyPassword(String value) {
    final password = value.trim();
    final specialCharacter = RegExp(r'\W');
    final uppercaseCharacter = RegExp('[A-Z]');
    final number = RegExp(r'\d');

    if (value.isEmpty) {
      setState(() {
        errorPassword = 'Não Pode ser vazio';
      });
    } else {
      setState(() {
        errorPassword = '';
      });
    }

    if (password.length > 8) {
      setState(() {
        hasMoreThen8Match = true;
      });
    } else {
      setState(() {
        hasMoreThen8Match = false;
      });
    }

    if (number.hasMatch(password)) {
      setState(() {
        hasNumberMatch = true;
      });
    } else {
      setState(() {
        hasNumberMatch = false;
      });
    }
    if (specialCharacter.hasMatch(password)) {
      setState(() {
        hasSpecialMatch = true;
      });
    } else {
      setState(() {
        hasSpecialMatch = false;
      });
    }
    if (uppercaseCharacter.hasMatch(password)) {
      setState(() {
        hasUpperMatch = true;
      });
    } else {
      setState(() {
        hasUpperMatch = false;
      });
    }

    if (password.isEmpty) {
      setState(() {
        progress = 0;
      });
    } else if (password.length < 6 &&
        (uppercaseCharacter.hasMatch(password) ||
            number.hasMatch(password) ||
            specialCharacter.hasMatch(password))) {
      setState(() {
        progress = 1 / 4;
      });
    } else if (password.length < 8) {
      setState(() {
        progress = 2 / 4;
      });
    } else {
      if (password.length < 8 ||
          password.length > 8 &&
              uppercaseCharacter.hasMatch(password) &&
              number.hasMatch(password) &&
              !specialCharacter.hasMatch(password)) {
        setState(() {
          progress = 3 / 4;
        });
      } else if (password.length > 8 &&
          uppercaseCharacter.hasMatch(password) &&
          number.hasMatch(password) &&
          specialCharacter.hasMatch(password)) {
        setState(() {
          progress = 1;
        });
      }
    }
  }

  void _handleFocusChange() {
    if (focusNode.hasFocus != focus) {
      setState(() {
        focus = focusNode.hasFocus;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.removeListener(_handleFocusChange);
    focusNode.dispose();
  }

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
                              controller: name,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Luis A...",
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
                                  value: "",
                                  enabled: false,
                                  child: Text(
                                    "Selecione uma Gênero",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
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
                              height: errorPassword.isEmpty ? 50 : 80,
                              child: TextFormField(
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                                cursorColor: Colors.black,
                                obscureText: isVisible,
                                focusNode: focusNode,
                                controller: password,
                                onChanged: verifyPassword,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "**********",
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        isVisible = !isVisible;
                                      });
                                    },
                                    child: Icon(
                                      isVisible
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Colors.black,
                                    ),
                                  ),
                                  errorText: errorPassword.isEmpty
                                      ? null
                                      : errorPassword,
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
                        if (focus)
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 10,
                              runSpacing: 10,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Row(
                                    children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: hasMoreThen8Match
                                                ? primaryColor
                                                : Colors.white,
                                          ),
                                        ),
                                        child: Icon(
                                          hasMoreThen8Match
                                              ? Icons.check
                                              : Icons.close,
                                          color: hasMoreThen8Match
                                              ? primaryColor
                                              : Colors.white,
                                        ),
                                      ),
                                      const Text(
                                        'Mais de 8 caracteres',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 200,
                                  child: Row(
                                    children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: hasNumberMatch
                                                ? primaryColor
                                                : Colors.white,
                                          ),
                                        ),
                                        child: Icon(
                                          hasNumberMatch
                                              ? Icons.check
                                              : Icons.close,
                                          color: hasNumberMatch
                                              ? primaryColor
                                              : Colors.white,
                                        ),
                                      ),
                                      const Text(
                                        'Pelo menos um número',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 200,
                                  child: Row(
                                    children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: hasSpecialMatch
                                                ? primaryColor
                                                : Colors.white,
                                          ),
                                        ),
                                        child: Icon(
                                          hasSpecialMatch
                                              ? Icons.check
                                              : Icons.close,
                                          color: hasSpecialMatch
                                              ? primaryColor
                                              : Colors.white,
                                        ),
                                      ),
                                      const Text(
                                        'Caracter Especial',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 200,
                                  child: Row(
                                    children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: hasUpperMatch
                                                ? primaryColor
                                                : Colors.white,
                                          ),
                                        ),
                                        child: Icon(
                                          hasUpperMatch
                                              ? Icons.check
                                              : Icons.close,
                                          color: hasUpperMatch
                                              ? primaryColor
                                              : Colors.white,
                                        ),
                                      ),
                                      const Expanded(
                                        child: Text(
                                          'Pelo menos uma letra maiuscula',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
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
                                hintText: "(00) 00000-0000",
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
                              cursorColor: Colors.black,
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
                                        selectedDate = date;
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
                          print({
                            name.text,
                            email.text,
                            gender,
                            phone.text,
                            cpf.text,
                            rg.text,
                            birthDate.text,
                            password.text
                          });
                          if (name.text.isNotEmpty &&
                              email.text.isNotEmpty &&
                              gender.isNotEmpty &&
                              phone.text.isNotEmpty &&
                              cpf.text.isNotEmpty &&
                              rg.text.isNotEmpty &&
                              birthDate.text.isNotEmpty &&
                              password.text.isNotEmpty) {
                            if (progress == 1) {
                              if (!isLoading) {
                                setState(() {
                                  isLoading = true;
                                });
                                try {
                                  Response response = await AuthRepo.signUser(
                                    name: name.text,
                                    email: email.text,
                                    gender: gender,
                                    phone: phone.text.replaceAll(
                                        RegExp(
                                          r"\W",
                                          multiLine: true,
                                        ),
                                        ""),
                                    cpf: cpf.text.replaceAll(
                                        RegExp(
                                          r"\W",
                                          multiLine: true,
                                        ),
                                        ""),
                                    rg: rg.text.replaceAll(
                                        RegExp(
                                          r"\W",
                                          multiLine: true,
                                        ),
                                        ""),
                                    birthDate: DateFormat("y-MM-d")
                                        .format(selectedDate),
                                    image: image,
                                    password: password.text,
                                  );
                                  if (response.data.containsKey("jwt")) {
                                    userData.setUserData(response.data);
                                    saveUserToken(response.data["jwt"]);
                                    await DB().setUserdata(
                                      email.text,
                                      password.text,
                                      false,
                                    );
                                    setState(() {
                                      isLoading = false;
                                    });
                                    ElegantNotification.success(
                                      description: const Text(
                                        'Cadastro Concluído',
                                      ),
                                      height: 80,
                                    ).show(context);
                                    Get.to(const HomePage());
                                  }
                                } on DioError catch (e) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  ElegantNotification.error(
                                    description: Text(
                                      e.response?.data["message"],
                                    ),
                                    height: 80,
                                  ).show(context);
                                  print(e.response?.data);
                                }
                              }
                            } else {
                              ElegantNotification.error(
                                description: const Text(
                                  "Crie um senha forte!",
                                ),
                                height: 80,
                              ).show(context);
                            }
                          } else {
                            ElegantNotification.error(
                              description: const Text(
                                "Preencha todos os campos!",
                              ),
                              height: 80,
                            ).show(context);
                          }
                        },
                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
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
