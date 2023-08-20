import 'package:flutter/material.dart';
import 'package:imccalculator/Widgets/input_text.dart';
import 'package:imccalculator/Widgets/text_button.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key, required this.title});
  final String title;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  double imc = 0;
  String imcMessage = "";

  void _calculateImc() {
    if (weightController.text.isNotEmpty && heightController.text.isNotEmpty) {
      double weight = double.tryParse(weightController.text) ?? 0;
      double height = double.tryParse(heightController.text) ?? 0;

      if (weight > 0 && height > 0) {
        double calculatedImc = weight / ((height / 100) * (height / 100));
        double roundedImc = calculatedImc.ceilToDouble();

        setState(() {
          imc = roundedImc;

          if (roundedImc < 16) {
            imcMessage = "Magreza grave";
          } else if (roundedImc < 17) {
            imcMessage = "Magreza moderada";
          } else if (roundedImc < 18.5) {
            imcMessage = "Magreza leve";
          } else if (roundedImc < 25) {
            imcMessage = "Saudável";
          } else if (roundedImc < 30) {
            imcMessage = "Sobrepeso";
          } else if (roundedImc < 35) {
            imcMessage = "Obesidade Grau 1";
          } else if (roundedImc < 40) {
            imcMessage = "Obesidade Grau 2 (severa)";
          } else {
            imcMessage = "Obesidade Grau 3 (mórbida)";
          }
        });
      } else {
        setState(() {
          imcMessage = "";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Digite as informações para calcular seu IMC',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              InputTextCustom(
                valueController: weightController,
                hintText: "Informe seu peso",
                obscureText: false,
                keyboardType: TextInputType.text,
                hintColor: Colors.black,
                prefixIcon: Icons.balance,
              ),
              const SizedBox(height: 20),
              InputTextCustom(
                valueController: heightController,
                hintText: "Informe sua altura",
                obscureText: false,
                keyboardType: TextInputType.text,
                hintColor: Colors.black,
                prefixIcon: Icons.height,
              ),
              const SizedBox(height: 20),
              CustomTextButton(
                onPressed: _calculateImc,
                backgroundColor: Colors.blue,
                textButton: "Calcular IMC",
                textColor: Colors.white,
                width: double.infinity,
                fontSize: 20,
              ),
              const SizedBox(height: 20),
              Text(
                'Seu IMC é: ${imc.toStringAsFixed(2)}',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                imcMessage,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
