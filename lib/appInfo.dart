import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppInfo extends StatelessWidget {

  _launchGithub()  {
    const url = 'https://github.com/Fschmatz/gardenal_tracker';
    launch(url);
  }

  Color? themeColorApp = Color(0xFF3F8CCB);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("App Info"),
        ),
        body: ListView(children: <Widget>[
          const SizedBox(height: 20),
          CircleAvatar(
            radius: 55,
            backgroundColor: Colors.orange,
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/avatar.jpg'),
            ),
          ),
          const SizedBox(height: 15),
          Center(
            child: Text('Gardenal de Cachorro Tracker Versão 1.1.2',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: themeColorApp)),
          ),
          const SizedBox(height: 15),
          const Divider(),
          ListTile(
            leading: SizedBox(
              height: 0.1,
            ),
            title: Text("Dev".toUpperCase(),
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: themeColorApp)),
          ),
          ListTile(
            leading: Icon( Icons.info_outline),
            title: Text(
              "MARTELADO E REFEITO DO ZERO: 0 !!!",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          ListTile(
            leading: SizedBox(
              height: 0.1,
            ),
            title: Text(
              "( This is The Way! )",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          ListTile(
            leading: SizedBox(
              height: 0.1,
            ),
            title: Text(
              "Aplicativo criado utilizando o Flutter e a linguagem Dart.",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          const Divider(),
          ListTile(
            leading: SizedBox(
              height: 0.1,
            ),
            title: Text("Código Fonte".toUpperCase(),
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: themeColorApp)),
          ),
          ListTile(
            onTap: () {_launchGithub();},
            leading: Icon(Icons.open_in_new_outlined),
            title: Text("Ver no Github",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.blue)),
          ),
          const Divider(),
          ListTile(
            leading: SizedBox(
              height: 0.1,
            ),
            title: Text("Quote".toUpperCase(),
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: themeColorApp)),
          ),
          ListTile(
            leading: Icon(Icons.messenger_outline),
            title: Text(
              "Não posso ensinar nada a ninguém. Eu só posso fazê-los pensar.",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ]));
  }
}
