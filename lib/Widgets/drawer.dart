import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String fakeUrl =
    "https://www.nj.com/resizer/zovGSasCaR41h_yUGYHXbVTQW2A=/1280x0/smart/cloudfront-us-east-1.images.arcpublishing.com/advancelocal/SJGKVE5UNVESVCW7BBOHKQCZVE.jpg";

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String emailUser = "";

  getData() async {
    // Armazenar o email no SharedPreferences para ser usado no Dashboard
    final storage = await SharedPreferences.getInstance();
    setState(() {
      emailUser = storage.getString(
            "email",
          ) ??
          "";
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(),
        child: Column(children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Colors.orange),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.network(
                  fakeUrl,
                  width: 80, // Largura da imagem
                  height: 80, // Altura da imagem
                  fit: BoxFit
                      .cover, // Ajustar a imagem ao tamanho do CircleAvatar
                ),
              ),
            ),
            accountName: const Text('Usuário teste'),
            accountEmail: Text(emailUser),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Perfil'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ]),
      ),
    );
  }
}
