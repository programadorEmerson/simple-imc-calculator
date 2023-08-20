import 'package:flutter/material.dart';
import 'package:imccalculator/Widgets/input_text.dart';
import 'package:imccalculator/Widgets/text_button.dart';
import 'package:imccalculator/pages/dashboard.dart';

const urlImage =
    "https://saturnino.com.br/_next/image?url=%2Fassets%2Flogo.png&w=2048&q=75";

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  bool showPassword = false;
  bool hasError = false;
  String errorMessage = "";

  bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegex.hasMatch(email);
  }

  handleToogleShowPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  handleLogin(BuildContext context) {
    bool hasError = false;
    String errorMessage = "";

    if (emailControler.text.isEmpty || !isValidEmail(emailControler.text)) {
      hasError = true;
      errorMessage = "Email inválido";
    } else if (passwordControler.text.isEmpty) {
      hasError = true;
      errorMessage = "Informe a senha";
    }

    if (hasError) {
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
          backgroundColor: const Color.fromARGB(255, 230, 94, 84),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => const Dashboard(title: "Imc Calculator")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
            child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            children: [
              const Expanded(
                flex: 2,
                child: Center(
                  child: Image(
                    height: 180,
                    image: NetworkImage(urlImage),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        InputTextCustom(
                          valueController: emailControler,
                          hintText: "Email",
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                          hintColor: Colors.white,
                          prefixIcon: Icons.email,
                        ),
                        InputTextCustom(
                          valueController: passwordControler,
                          hintText: "Senha",
                          obscureText: showPassword,
                          keyboardType: TextInputType.text,
                          hintColor: Colors.white,
                          functionSufixIcon: handleToogleShowPassword,
                          prefixIcon: Icons.lock,
                          suffixIcon: showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(top: 10),
                          child: CustomTextButton(
                            onPressed: () {
                              handleLogin(context);
                            },
                            backgroundColor: Colors.blue,
                            textButton: "Entrar",
                            textColor: Colors.white,
                            width: double.infinity,
                            fontSize: 20,
                          ),
                        )
                      ],
                    )),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    CustomTextButton(
                      onPressed: handleLogin,
                      backgroundColor: Colors.transparent,
                      textButton: "Cadastre-se",
                      textColor: Colors.white,
                      fontSize: 18,
                    ),
                    CustomTextButton(
                      onPressed: handleLogin,
                      backgroundColor: Colors.transparent,
                      textButton: "Esqueci minha senha",
                      textColor: Colors.white,
                      fontSize: 18,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
