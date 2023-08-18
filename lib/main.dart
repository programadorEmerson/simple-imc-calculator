import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Calculadora de IMC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int weight = 0;
  int height = 0;
  double imc = 0;

  void _calculateImc() {
    if (height > 0) {
      double calculatedImc = weight / ((height / 100) * (height / 100));
      double roundedImc = calculatedImc.ceilToDouble(); // Arredonda para cima
      setState(() {
        imc = roundedImc;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Digite as informações para calcular seu IMC',
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Peso',
              ),
              onChanged: (value) {
                setState(() {
                  weight = int.tryParse(value) ?? 0;
                });
              },
            ),
            const SizedBox(height: 20),
            TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Altura',
                ),
                onChanged: (value) {
                  setState(() {
                    height = int.tryParse(value) ?? 0;
                  });
                }),
            const SizedBox(height: 20),
            Text(
              'Seu IMC é: ${imc.toStringAsFixed(2)}',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateImc,
              child: const Text('Calcular'),
            ),
          ],
        ),
      ),
    );
  }
}
